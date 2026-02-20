document.addEventListener("DOMContentLoaded", function () {

  const today = new Date();
  let currentDate = new Date(today);
  let viewMode = "month";

  const yearEl  = document.querySelector(".year");
  const monthEl = document.querySelector(".month");
  const viewButtons = document.querySelectorAll(".view-btn");
  const dateGrid = document.querySelector(".date-grid");

  const prevBtn = document.querySelector(".prev-btn");
  const nextBtn = document.querySelector(".next-btn");

  const selectedDateFromServer =
    typeof selectedDate !== "undefined" ? selectedDate : null;

  /* =========================
     Utilities
  ========================== */
  function pad(n) { return String(n).padStart(2, "0"); }

  function dateKey(date) {
    return date.getFullYear() + "-" +
           pad(date.getMonth() + 1) + "-" +
           pad(date.getDate());
  }

  function updateHeader() {
    if (!yearEl || !monthEl) return;
    yearEl.textContent = currentDate.getFullYear();
    monthEl.textContent = pad(currentDate.getMonth() + 1);
  }

  /* =========================
     Date Cell
  ========================== */
  function createCell(key, day) {

    const cell = document.createElement("div");
    cell.className = "date-cell";

    const num = document.createElement("span");
    num.className = "date-num";
    num.textContent = day;
    cell.appendChild(num);

    // 오늘 표시
    if (key === dateKey(today)) {
      cell.classList.add("today");
    }

    // 서버에서 선택된 날짜 표시
    if (selectedDateFromServer === key) {
      cell.classList.add("selected");
    }

    // DB 점 표시
    if (typeof monthEventDates !== "undefined" &&
        monthEventDates.includes(key)) {

      const dot = document.createElement("span");
      dot.className = "event-dot";
      cell.appendChild(dot);
    }

    // 날짜 클릭 이벤트
    cell.addEventListener("click", () => {

      // 같은 날짜 다시 클릭 → 패널 닫기
      if (selectedDateFromServer === key) {
        window.location.href = contextPath + "/calendar";
        return;
      }

      // 다른 날짜 클릭 → 서버 이동
      window.location.href = contextPath + "/calendar?date=" + key;
    });

    return cell;
  }

  /* =========================
     Month Render
  ========================== */
  function renderMonth() {
    dateGrid.innerHTML = "";
    updateHeader();

    const y = currentDate.getFullYear();
    const m = currentDate.getMonth();
    const first = new Date(y, m, 1).getDay();
    const last  = new Date(y, m + 1, 0).getDate();

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

  /* =========================
     Week Render
  ========================== */
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

  if (prevBtn) {
    prevBtn.addEventListener("click", () => {

      if (viewMode === "month")
        currentDate.setMonth(currentDate.getMonth() - 1);
      else
        currentDate.setDate(currentDate.getDate() - 7);

      const y = currentDate.getFullYear();
      const m = pad(currentDate.getMonth() + 1);

      // 월 이동 시 패널 제거 (date 파라미터 없음)
      window.location.href = contextPath +
        "/calendar?year=" + y + "&month=" + m;
    });
  }

  if (nextBtn) {
    nextBtn.addEventListener("click", () => {

      if (viewMode === "month")
        currentDate.setMonth(currentDate.getMonth() + 1);
      else
        currentDate.setDate(currentDate.getDate() + 7);

      const y = currentDate.getFullYear();
      const m = pad(currentDate.getMonth() + 1);

      window.location.href = contextPath +
        "/calendar?year=" + y + "&month=" + m;
    });
  }

  viewButtons.forEach(btn => {
    btn.addEventListener("click", () => {
      viewButtons.forEach(b => b.classList.remove("active"));
      btn.classList.add("active");

      viewMode = btn.dataset.view;
      render();
    });
  });

  render();
});