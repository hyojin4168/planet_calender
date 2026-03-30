<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" href="${path}/resources/css/common/footer.css">

<!-- Mobile Bottom Navigation -->
<nav class="bottom-nav">

  <a href="${path}/home"
     class="nav-btn ${currentPage eq 'home' ? 'active' : ''}">
    <span class="icon">🏠</span>
    <span class="label">홈</span>
  </a>

  <a href="${path}/calendar"
     class="nav-btn ${currentPage eq 'calendar' ? 'active' : ''}">
    <span class="icon">📅</span>
    <span class="label">캘린더</span>
  </a>

  <a href="${path}/menu"
     class="nav-btn ${currentPage eq 'menu' ? 'active' : ''}">
    <span class="icon">🗂</span>
    <span class="label">메뉴</span>
  </a>

</nav>

</body>
</html>
