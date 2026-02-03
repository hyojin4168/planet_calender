document.addEventListener("DOMContentLoaded", () => {

  /* =====================
     State
  ===================== */
  const today = new Date();
  let currentDate = new Date(today);
  let selectedDate = null;
  let viewMode = "month";

  /* =====================
     Schedule Data (임시)
  ===================== */
  const schedules = {
    "2026-02-03": [{ title: "시험" }],
    "2026-02-12": [{ title: "여행" }],
    "2026-02-18": [{ title: "회의" }]
  };

  /* =====================
     DOM
  ===================== */
  const yearEl  = document.querySelector(".ym-btn .year");
  const monthEl = document.querySelector(".ym-btn .month");
  const dateGrid = document.querySelector(".date-grid");
  const viewButtons = document.querySelectorAll(".view-btn");

  // 🔥 일정 패널 DOM
  const schedulePanel = document.querySelector(".schedule-panel");
  const scheduleTitle = document.querySelector(".schedule-title");
  const scheduleList  = document.querySelector(".schedule-list");

  if (!dateGrid || !yearEl || !monthEl) return;

  /* =====================
     Utils
  ===================== */
  function updateHeader(date) {
    yearEl.textContent  = date.getFullYear();
    monthEl.textContent = String(date.getMonth() + 1).padStart(2, "0");
  }

  function isSameDate(a, b) {
    return a.getFullYear() === b.getFullYear() &&
           a.getMonth() === b.getMonth() &&
           a.getDate() === b.getDate();
  }

  function getDateKey(date) {
    const y = date.getFullYear();
    const m = String(date.getMonth() + 1).padStart(2, "0");
    const d = String(date.getDate()).padStart(2, "0");
    return `${y}-${m}-${d}`;
  }

  function formatDateTitle(date) {
    return `${date.getMonth() + 1}월 ${date.getDate()}일`;
  }

  function moveMonth(dir) {
    const y = currentDate.getFullYear();
    const m = currentDate.getMonth();
    const d = currentDate.getDate();
    const lastDay = new Date(y, m + dir + 1, 0).getDate();
    currentDate = new Date(y, m + dir, Math.min(d, lastDay));
  }

  /* =====================
     Schedule List Render
  ===================== */
  function renderScheduleList(date) {
  if (!schedulePanel) return;

  const key = getDateKey(date);
  const daySchedules = schedules[key];

  scheduleTitle.textContent = formatDateTitle(date);
  scheduleList.innerHTML = "";
  schedulePanel.hidden = false;

  // 🔥 추가
  schedulePanel.scrollIntoView({
    behavior: "smooth",
    block: "start"
  });

  if (!daySchedules || daySchedules.length === 0) {
    const li = document.createElement("li");
    li.className = "schedule-empty";
    li.textContent = "일정이 없습니다.";
    scheduleList.appendChild(li);
    return;
  }

  daySchedules.forEach(item => {
    const li = document.createElement("li");
    li.className = "schedule-item";
    li.textContent = item.title;
    scheduleList.appendChild(li);
  });
}

  function hideSchedulePanel() {
    if (schedulePanel) {
      schedulePanel.hidden = true;
    }
  }

  /* =====================
     Render Month
  ===================== */
  function renderMonth() {
    dateGrid.innerHTML = "";
    dateGrid.classList.remove("week");

    updateHeader(currentDate);

    const y = currentDate.getFullYear();
    const m = currentDate.getMonth();
    const firstDay = new Date(y, m, 1).getDay();
    const lastDate = new Date(y, m + 1, 0).getDate();

    for (let i = 0; i < firstDay; i++) {
      const empty = document.createElement("div");
      empty.className = "date-cell empty";
      dateGrid.appendChild(empty);
    }

    for (let day = 1; day <= lastDate; day++) {
      const cellDate = new Date(y, m, day);
      const cell = document.createElement("div");
      cell.className = "date-cell";

      const num = document.createElement("span");
      num.className = "date-num";
      num.textContent = day;
      cell.appendChild(num);

      if (isSameDate(cellDate, today)) {
        cell.classList.add("today");
      }

      if (selectedDate && isSameDate(cellDate, selectedDate)) {
        cell.classList.add("active");
      } else if (
        !selectedDate &&
        isSameDate(cellDate, today) &&
        cellDate.getMonth() === currentDate.getMonth() &&
        cellDate.getFullYear() === currentDate.getFullYear()
      ) {
        cell.classList.add("active");
      }

      // 일정 점
      const key = getDateKey(cellDate);
      if (schedules[key]) {
        const dot = document.createElement("span");
        dot.className = "event-dot";
        cell.appendChild(dot);
      }

      cell.onclick = () => {
        selectedDate = new Date(cellDate);
        currentDate = new Date(cellDate);
        renderMonth();
        renderScheduleList(cellDate);   // 🔥 핵심
      };

      dateGrid.appendChild(cell);
    }
  }

  /* =====================
     Render Week
  ===================== */
  function renderWeek() {
    dateGrid.innerHTML = "";
    dateGrid.classList.add("week");

    updateHeader(currentDate);

    const start = new Date(currentDate);
    start.setDate(currentDate.getDate() - currentDate.getDay());

    for (let i = 0; i < 7; i++) {
      const d = new Date(start);
      d.setDate(start.getDate() + i);

      const cell = document.createElement("div");
      cell.className = "date-cell";

      const num = document.createElement("span");
      num.className = "date-num";
      num.textContent = d.getDate();
      cell.appendChild(num);

      if (isSameDate(d, today)) {
        cell.classList.add("today");
      }

      if (selectedDate && isSameDate(d, selectedDate)) {
        cell.classList.add("active");
      }

      const key = getDateKey(d);
      if (schedules[key]) {
        const dot = document.createElement("span");
        dot.className = "event-dot";
        cell.appendChild(dot);
      }

      cell.onclick = () => {
        selectedDate = new Date(d);
        currentDate = new Date(d);
        renderWeek();
        renderScheduleList(d);          // 🔥 핵심
      };

      dateGrid.appendChild(cell);
    }
  }

  /* =====================
     View Toggle
  ===================== */
  viewButtons.forEach(btn => {
    btn.addEventListener("click", () => {
      viewButtons.forEach(b => b.classList.remove("active"));
      btn.classList.add("active");

      viewMode = btn.dataset.view;
      hideSchedulePanel();
      selectedDate = null;

      viewMode === "month" ? renderMonth() : renderWeek();
    });
  });

  /* =====================
     Swipe
  ===================== */
  let startX = 0;

  dateGrid.addEventListener("pointerdown", e => {
    startX = e.clientX;
    dateGrid.setPointerCapture(e.pointerId);
  });

  dateGrid.addEventListener("pointerup", e => {
    const diff = startX - e.clientX;
    if (Math.abs(diff) < 60) return;

    selectedDate = null;
    hideSchedulePanel();

    if (viewMode === "month") {
      moveMonth(diff > 0 ? 1 : -1);
      renderMonth();
    } else {
      currentDate.setDate(currentDate.getDate() + (diff > 0 ? 7 : -7));
      renderWeek();
    }
  });

  /* =====================
     Init
  ===================== */
  hideSchedulePanel();
  renderMonth();
});
