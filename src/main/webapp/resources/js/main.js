document.addEventListener("DOMContentLoaded", () => {

  /* =====================
     State
  ===================== */
  const today = new Date();

  let currentYear  = today.getFullYear();
  let currentMonth = today.getMonth(); // 0~11
  let selectedDay  = today.getDate();

  let viewMode = "month"; // "month" | "week"
  let currentDate = new Date(today);

  const weekNames = ["일", "월", "화", "수", "목", "금", "토"];

  /* =====================
     DOM
  ===================== */
  const yearEl  = document.querySelector(".current-date .year");
  const monthEl = document.querySelector(".current-date .month");

  const dateGrid = document.querySelector(".date-grid");
  const dateMain = document.querySelector(".date-main");
  const dateSub  = document.querySelector(".date-sub");

  const viewButtons = document.querySelectorAll(".view-btn");

  if (!dateGrid) return;

  /* =====================
     Header / Context
  ===================== */
  function updateHeader(year, month) {
    if (!yearEl || !monthEl) return;
    yearEl.textContent  = year;
    monthEl.textContent = String(month + 1).padStart(2, "0");
  }

  function updateContext(date) {
    dateMain.textContent = `${date.getMonth() + 1}월 ${date.getDate()}일`;
    dateSub.textContent  = `(${weekNames[date.getDay()]})`;
  }

  function isSameDate(a, b) {
    return a.getFullYear() === b.getFullYear() &&
           a.getMonth() === b.getMonth() &&
           a.getDate() === b.getDate();
  }

  /* =====================
     Month Render
  ===================== */
  function renderMonth(year, month) {
    dateGrid.innerHTML = "";
    dateGrid.classList.remove("week");

    updateHeader(year, month);

    const firstDay = new Date(year, month, 1).getDay();
    const lastDate = new Date(year, month + 1, 0).getDate();

    for (let i = 0; i < firstDay; i++) {
      const empty = document.createElement("div");
      empty.className = "date-cell empty";
      dateGrid.appendChild(empty);
    }

    for (let day = 1; day <= lastDate; day++) {
      const cell = createDateCell(year, month, day);
      dateGrid.appendChild(cell);
    }

    updateContext(new Date(year, month, selectedDay));
  }

  function createDateCell(year, month, day) {
    const cell = document.createElement("div");
    cell.className = "date-cell";

    const num = document.createElement("span");
    num.className = "date-num";
    num.textContent = day;
    cell.appendChild(num);

    if (
      year === today.getFullYear() &&
      month === today.getMonth() &&
      day === today.getDate()
    ) {
      cell.classList.add("today");
    }

    if (day === selectedDay) {
      cell.classList.add("active");
    }

    cell.addEventListener("click", () => {
      selectedDay = day;
      currentDate = new Date(year, month, day);

      document.querySelectorAll(".date-cell")
        .forEach(c => c.classList.remove("active"));

      cell.classList.add("active");
      updateContext(currentDate);
    });

    return cell;
  }

  /* =====================
     Week Render
  ===================== */
  function renderWeek(date) {
    dateGrid.innerHTML = "";
    dateGrid.classList.add("week");

    updateHeader(date.getFullYear(), date.getMonth());

    const start = new Date(date);
    start.setDate(date.getDate() - date.getDay()); // 일요일 기준

    for (let i = 0; i < 7; i++) {
      const d = new Date(start);
      d.setDate(start.getDate() + i);

      const cell = document.createElement("div");
      cell.className = "date-cell";

      const num = document.createElement("span");
      num.className = "date-num";
      num.textContent = d.getDate();
      cell.appendChild(num);

      if (isSameDate(d, date)) {
        cell.classList.add("active");
      }

      cell.addEventListener("click", () => {
        currentDate = d;
        selectedDay = d.getDate();
        updateContext(d);
        renderWeek(d);
      });

      dateGrid.appendChild(cell);
    }

    updateContext(date);
  }

  /* =====================
     View Toggle (월 / 주)
  ===================== */
  viewButtons.forEach(btn => {
    btn.addEventListener("click", () => {
      viewButtons.forEach(b => b.classList.remove("active"));
      btn.classList.add("active");

      viewMode = btn.dataset.view;

      if (viewMode === "month") {
        renderMonth(currentYear, currentMonth);
      } else {
        currentDate = new Date(currentYear, currentMonth, selectedDay);
        renderWeek(currentDate);
      }
    });
  });

  /* =====================
     Swipe Control
  ===================== */
  let startX = 0;
  let currentX = 0;
  let isSwiping = false;
  const SWIPE_DISTANCE = 60;

  dateGrid.addEventListener("pointerdown", e => {
    startX = e.clientX;
    currentX = startX;
    isSwiping = true;
    dateGrid.setPointerCapture(e.pointerId);
  });

  dateGrid.addEventListener("pointermove", e => {
    if (!isSwiping) return;
    currentX = e.clientX;
  });

  dateGrid.addEventListener("pointerup", () => {
    if (!isSwiping) return;
    isSwiping = false;

    const diff = startX - currentX;
    if (Math.abs(diff) < SWIPE_DISTANCE) return;

    if (viewMode === "month") {
      if (diff > 0) {
        currentMonth++;
        if (currentMonth > 11) {
          currentMonth = 0;
          currentYear++;
        }
      } else {
        currentMonth--;
        if (currentMonth < 0) {
          currentMonth = 11;
          currentYear--;
        }
      }
      renderMonth(currentYear, currentMonth);
    } else {
      if (diff > 0) {
        currentDate.setDate(currentDate.getDate() + 7);
      } else {
        currentDate.setDate(currentDate.getDate() - 7);
      }
      selectedDay = currentDate.getDate();
      renderWeek(currentDate);
    }
  });

  /* =====================
     Init
  ===================== */
  renderMonth(currentYear, currentMonth);
});
