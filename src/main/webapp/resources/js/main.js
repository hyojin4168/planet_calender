document.addEventListener("DOMContentLoaded", function () {

  /* =====================
     State
  ===================== */
  const today = new Date();
  let currentDate = new Date(today);
  let viewMode = "month";     // "month" | "week"
  let selectedKey = null;
  let suppressClick = false;

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
  const viewButtons = document.querySelectorAll(".view-btn");

  const dateGrid = document.querySelector(".date-grid");
  const panel = document.querySelector(".schedule-panel");
  const title = document.querySelector(".schedule-title");
  const list  = document.querySelector(".schedule-list");

  if (!dateGrid || !panel || !title || !list || !yearEl || !monthEl) {
    console.error("필수 DOM 누락");
    return;
  }

  /* =====================
     Utils
  ===================== */
  function pad(n) {
    return String(n).padStart(2, "0");
  }

  function dateKey(date) {
    return date.getFullYear() + "-" +
           pad(date.getMonth() + 1) + "-" +
           pad(date.getDate());
  }

  function keyToDate(key) {
    const a = key.split("-").map(Number);
    return new Date(a[0], a[1] - 1, a[2]);
  }

  function updateHeader() {
    yearEl.textContent = currentDate.getFullYear();
    monthEl.textContent = pad(currentDate.getMonth() + 1);
  }

  /* =====================
     Panel
  ===================== */
  function hidePanel() {
    panel.hidden = true;
  }

  function openPanel(key) {
    const data = schedules[key];
    if (!data || data.length === 0) {
      hidePanel();
      return;
    }

    const d = keyToDate(key);
    title.textContent = (d.getMonth() + 1) + "월 " + d.getDate() + "일";
    list.innerHTML = "";

    data.forEach(item => {
      const li = document.createElement("li");
      li.className = "schedule-item";
      li.textContent = item.title;
      list.appendChild(li);
    });

    panel.hidden = false;
  }

  /* =====================
     Cell Factory
  ===================== */
  function createCell(key, day, empty) {
    const cell = document.createElement("div");
    cell.className = "date-cell";

    if (empty) {
      cell.classList.add("empty");
      return cell;
    }

    cell.dataset.key = key;

    const num = document.createElement("span");
    num.className = "date-num";
    num.textContent = day;
    cell.appendChild(num);

    const activeKey = selectedKey !== null ? selectedKey : dateKey(today);
    if (key === activeKey) cell.classList.add("active");
    if (key === dateKey(today)) cell.classList.add("today");

    if (schedules[key]) {
      const dot = document.createElement("span");
      dot.className = "event-dot";
      cell.appendChild(dot);
    }

    return cell;
  }

  /* =====================
     Render Month
  ===================== */
  function renderMonth() {
    dateGrid.innerHTML = "";
    dateGrid.classList.remove("week");
    updateHeader();

    const y = currentDate.getFullYear();
    const m = currentDate.getMonth();
    const first = new Date(y, m, 1).getDay();
    const last  = new Date(y, m + 1, 0).getDate();

    for (let i = 0; i < first; i++) {
      dateGrid.appendChild(createCell("", "", true));
    }

    for (let d = 1; d <= last; d++) {
      const key = dateKey(new Date(y, m, d));
      dateGrid.appendChild(createCell(key, d, false));
    }
  }

  /* =====================
     Render Week
  ===================== */
  function renderWeek() {
    dateGrid.innerHTML = "";
    dateGrid.classList.add("week");
    updateHeader();

    const start = new Date(currentDate);
    start.setDate(currentDate.getDate() - currentDate.getDay());

    for (let i = 0; i < 7; i++) {
      const d = new Date(start);
      d.setDate(start.getDate() + i);
      dateGrid.appendChild(
        createCell(dateKey(d), d.getDate(), false)
      );
    }
  }

  function render() {
    viewMode === "week" ? renderWeek() : renderMonth();
  }

  /* =====================
     Click (이벤트 위임)
  ===================== */
  dateGrid.addEventListener("click", function (e) {
    if (suppressClick) {
      suppressClick = false;
      return;
    }

    const cell = e.target.closest(".date-cell");
    if (!cell || cell.classList.contains("empty")) return;

    const key = cell.dataset.key;

    if (selectedKey === key && panel.hidden === false) {
      hidePanel();
      return;
    }

    selectedKey = key;
    currentDate = keyToDate(key);
    render();
    openPanel(key);
  });

  /* =====================
     View Toggle
  ===================== */
  viewButtons.forEach(btn => {
    btn.addEventListener("click", () => {
      viewButtons.forEach(b => b.classList.remove("active"));
      btn.classList.add("active");

      viewMode = btn.dataset.view;
      selectedKey = null;
      hidePanel();
      render();
    });
  });

  /* =====================
     Swipe
  ===================== */
  let sx = 0, sy = 0, swiping = false;

  dateGrid.addEventListener("pointerdown", e => {
    sx = e.clientX;
    sy = e.clientY;
    swiping = false;
    dateGrid.setPointerCapture(e.pointerId);
  });

  dateGrid.addEventListener("pointermove", e => {
    const dx = e.clientX - sx;
    const dy = e.clientY - sy;
    if (Math.abs(dx) > 60 && Math.abs(dx) > Math.abs(dy)) {
      swiping = true;
    }
  });

  dateGrid.addEventListener("pointerup", e => {
    if (!swiping) return;

    suppressClick = true;
    setTimeout(() => suppressClick = false, 0);

    selectedKey = null;
    hidePanel();

    const next = e.clientX < sx;
    if (viewMode === "month") {
      currentDate.setMonth(currentDate.getMonth() + (next ? 1 : -1));
    } else {
      currentDate.setDate(currentDate.getDate() + (next ? 7 : -7));
    }

    render();
  });

  /* =====================
     Init
  ===================== */
  hidePanel();
  render();
});
