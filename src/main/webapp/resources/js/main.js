document.addEventListener("DOMContentLoaded", function () {

  const today = new Date();
  let currentDate = new Date(today);
  let viewMode = "month";
  let selectedKey = null;

  const schedules = {
    "2026-02-03": [{ title: "시험" }],
    "2026-02-12": [{ title: "여행" }],
    "2026-02-18": [{ title: "회의" }]
  };

  const yearEl  = document.querySelector(".year");
  const monthEl = document.querySelector(".month");
  const viewButtons = document.querySelectorAll(".view-btn");
  const dateGrid = document.querySelector(".date-grid");
  const panel = document.querySelector(".schedule-panel");
  const title = document.querySelector(".schedule-title");
  const list  = document.querySelector(".schedule-list");

  const prevBtn = document.querySelector(".prev-btn");
  const nextBtn = document.querySelector(".next-btn");

  /* =========================
     Side Menu
  ========================== */
  const moreBtn = document.querySelector(".more-btn");
  const sideMenu = document.querySelector(".side-menu");
  const overlay = document.querySelector(".menu-overlay");

  if (moreBtn && sideMenu && overlay) {

    moreBtn.addEventListener("click", () => {
      sideMenu.hidden = false;
      overlay.hidden = false;
      requestAnimationFrame(() => sideMenu.classList.add("show"));
    });

    overlay.addEventListener("click", () => {
      sideMenu.classList.remove("show");
      setTimeout(() => {
        sideMenu.hidden = true;
        overlay.hidden = true;
      }, 300);
    });
  }

  /* =========================
     Utilities
  ========================== */
  function pad(n) { return String(n).padStart(2, "0"); }

  function dateKey(date) {
    return date.getFullYear() + "-" +
           pad(date.getMonth() + 1) + "-" +
           pad(date.getDate());
  }

  function keyToDate(key) {
    const [y, m, d] = key.split("-").map(Number);
    return new Date(y, m - 1, d);
  }

  function updateHeader() {
    yearEl.textContent = currentDate.getFullYear();
    monthEl.textContent = pad(currentDate.getMonth() + 1);
  }

  function hidePanel() {
    panel.hidden = true;
  }

  /* =========================
     Panel
  ========================== */
  function openPanel(key) {
    const data = schedules[key];
    const d = keyToDate(key);

    title.textContent = (d.getMonth() + 1) + "월 " + d.getDate() + "일";
    list.innerHTML = "";

    if (!data || data.length === 0) {
      const empty = document.createElement("div");
      empty.className = "empty-message";
      empty.textContent = "등록된 일정이 없습니다.";

      const addBtn = document.createElement("button");
      addBtn.className = "add-btn";
      addBtn.type = "button";
      addBtn.textContent = "+ 일정 등록하기";

      addBtn.addEventListener("click", () => {
        window.location.href =
          contextPath + "/schedule/create?date=" + key;
      });

      list.appendChild(empty);
      list.appendChild(addBtn);

      panel.hidden = false;
      return;
    }

    data.forEach((item, index) => {
      const li = document.createElement("li");
      li.className = "schedule-item";
      li.innerHTML = `
        <span class="item-title">${item.title}</span>
        <span class="arrow">›</span>
      `;

      li.addEventListener("click", () => {
        window.location.href =
          contextPath + "/schedule/detail?date=" + key + "&idx=" + index;
      });

      list.appendChild(li);
    });

    panel.hidden = false;
  }

  /* =========================
     Calendar Render
  ========================== */
  function createCell(key, day) {
    const cell = document.createElement("div");
    cell.className = "date-cell";
    cell.dataset.key = key;

    const num = document.createElement("span");
    num.className = "date-num";
    num.textContent = day;
    cell.appendChild(num);

    if (key === dateKey(today)) {
      cell.classList.add("today");
    }

    if (key === selectedKey) {
      cell.classList.add("selected");
    }

    if (schedules[key]) {
      const dot = document.createElement("span");
      dot.className = "event-dot";
      cell.appendChild(dot);
    }

    cell.addEventListener("click", () => {

      if (selectedKey === key && !panel.hidden) {
        selectedKey = null;
        hidePanel();
        render();
        return;
      }

      selectedKey = key;
      currentDate = keyToDate(key);
      openPanel(key);
      render();
    });

    return cell;
  }

  function renderMonth() {
    dateGrid.innerHTML = "";
    updateHeader();

    const y = currentDate.getFullYear();
    const m = currentDate.getMonth();
    const first = new Date(y, m, 1).getDay();
    const last  = new Date(y, m+1, 0).getDate();

    for (let i = 0; i < first; i++) {
      const empty = document.createElement("div");
      empty.className = "date-cell empty";
      dateGrid.appendChild(empty);
    }

    for (let d = 1; d <= last; d++) {
      const key = dateKey(new Date(y, m, d));
      dateGrid.appendChild(createCell(key, d));
    }
  }

  function renderWeek() {
    dateGrid.innerHTML = "";
    updateHeader();

    const start = new Date(currentDate);
    start.setDate(currentDate.getDate() - currentDate.getDay());

    for (let i = 0; i < 7; i++) {
      const d = new Date(start);
      d.setDate(start.getDate() + i);
      dateGrid.appendChild(createCell(dateKey(d), d.getDate()));
    }
  }

  function render() {
    if (viewMode === "week") renderWeek();
    else renderMonth();
  }

  /* =========================
     Navigation
  ========================== */
  prevBtn.addEventListener("click", () => {
    if (viewMode === "month")
      currentDate.setMonth(currentDate.getMonth() - 1);
    else
      currentDate.setDate(currentDate.getDate() - 7);

    selectedKey = null;
    hidePanel();
    render();
  });

  nextBtn.addEventListener("click", () => {
    if (viewMode === "month")
      currentDate.setMonth(currentDate.getMonth() + 1);
    else
      currentDate.setDate(currentDate.getDate() + 7);

    selectedKey = null;
    hidePanel();
    render();
  });

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

  hidePanel();
  render();
});
