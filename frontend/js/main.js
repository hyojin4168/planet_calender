document.addEventListener("DOMContentLoaded", () => {

  /* =====================
     State
  ===================== */
  const today = new Date();

  let currentYear = today.getFullYear();
  let currentMonth = today.getMonth(); // 0~11
  let selectedDay = today.getDate();

  const weekNames = ["일", "월", "화", "수", "목", "금", "토"];

  /* =====================
     DOM
  ===================== */
  const dateGrid = document.querySelector(".date-grid");
  const dateMain = document.querySelector(".date-main");
  const dateSub  = document.querySelector(".date-sub");

  /* =====================
     Context Bar
  ===================== */
  function updateContext(year, month, day) {
    const d = new Date(year, month, day);
    dateMain.textContent = `${month + 1}월 ${day}일`;
    dateSub.textContent  = `(${weekNames[d.getDay()]})`;
  }

  /* =====================
     Calendar Render (Month)
  ===================== */
  function renderMonth(year, month) {
    dateGrid.innerHTML = "";

    const firstDay = new Date(year, month, 1).getDay();
    const lastDate = new Date(year, month + 1, 0).getDate();

    // 빈칸
    for (let i = 0; i < firstDay; i++) {
      const empty = document.createElement("div");
      empty.className = "date-cell empty";
      dateGrid.appendChild(empty);
    }

    // 날짜
    for (let day = 1; day <= lastDate; day++) {
      const cell = createDateCell(year, month, day);
      dateGrid.appendChild(cell);
    }
  }

  /* =====================
     Date Cell
  ===================== */
  function createDateCell(year, month, day) {
    const cell = document.createElement("div");
    cell.className = "date-cell";

    const num = document.createElement("span");
    num.className = "date-num";
    num.textContent = day;
    cell.appendChild(num);

    // 오늘 표시
    if (
      year === today.getFullYear() &&
      month === today.getMonth() &&
      day === today.getDate()
    ) {
      cell.classList.add("today");
    }

    // 선택된 날짜
    if (day === selectedDay) {
      cell.classList.add("active");
      updateContext(year, month, day);
    }

    // 클릭 이벤트
    cell.addEventListener("click", () => {
      selectedDay = day;
      document
        .querySelectorAll(".date-cell")
        .forEach(c => c.classList.remove("active"));
      cell.classList.add("active");
      updateContext(year, month, day);
    });

    return cell;
  }

  /* =====================
     Init
  ===================== */
  updateContext(currentYear, currentMonth, selectedDay);
  renderMonth(currentYear, currentMonth);
});
