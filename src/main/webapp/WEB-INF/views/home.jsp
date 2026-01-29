<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="common/header.jsp" %>

<link rel="stylesheet" href="${path}/resources/css/home.css">

  <!-- =====================
       Context Bar
  ====================== -->
  <section class="context-bar">
    <div class="context-inner">
      <div class="selected-date">
        <!-- JS에서 값 주입 -->
        <span class="date-main"></span>
        <span class="date-sub"></span>
      </div>
    </div>
  </section>

  <!-- =====================
       Main (Calendar Grid)
  ====================== -->
  <main class="calendar-main">

    <section class="calendar-grid">

      <!-- 요일 -->
      <div class="week-row">
        <div class="week sun">Sun</div>
        <div class="week">Mon</div>
        <div class="week">Tue</div>
        <div class="week">Wed</div>
        <div class="week">Thu</div>
        <div class="week">Fri</div>
        <div class="week sat">Sat</div>
      </div>

      <!-- 날짜 (JS로 생성) -->
      <div class="date-grid"></div>

    </section>

  </main>
  
   <!-- scripts -->
  <script src="${path}/resources/js/main.js"></script>

  <%@ include file="common/footer.jsp" %>
