document.addEventListener("DOMContentLoaded", function () {
  const checkboxes = document.querySelectorAll(".todo-checkbox");

  checkboxes.forEach((cb) => {
    cb.addEventListener("change", function () {
      const li = this.closest(".todo-item");
      if (!li) return;

      if (this.checked) li.classList.add("done");
      else li.classList.remove("done");
    });
  });
});
