<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="path" value="${pageContext.request.contextPath}" />

<!-- Footer -->
<footer class="app-footer">

  <!-- PC Footer -->
  <div class="footer-pc">
    <p class="footer-title">Planet Calendar</p>
    <p class="footer-desc">
      계획이 나를 재촉하지 않도록.
    </p>
    <p class="footer-copy">
      © 2026 Planet Calendar
    </p>
  </div>

  <!-- Mobile Footer (Buttons Only) -->
  <div class="footer-mobile">

    <button type="button"
            class="footer-btn active"
            aria-label="캘린더"
            data-link="${path}/calendar">
      📅
    </button>

    <button type="button"
            class="footer-btn add"
            aria-label="추가"
            data-link="${path}/schedule/add">
      ➕
    </button>

    <button type="button"
            class="footer-btn"
            aria-label="투두"
            data-link="${path}/todo">
      ✅
    </button>

  </div>

</footer>
