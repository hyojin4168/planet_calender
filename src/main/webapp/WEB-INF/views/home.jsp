<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="common/header.jsp" %>

<link rel="stylesheet" href="${path}/resources/css/home.css">

<!-- =====================
     Main (Calendar)
====================== -->
<main class="calendar-main">

  <section class="calendar-card">

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

    <!-- 날짜 (JS 생성) -->
    <div class="date-grid"></div>

  </section>
  
  <!-- 일정 목록 패널 -->
	<section class="schedule-panel">
	  <div class="schedule-header">
	    <h3 class="schedule-title"></h3>
	  </div>
	
	  <ul class="schedule-list"></ul>
	</section>
	  
</main>

<script src="${path}/resources/js/main.js"></script>

<%@ include file="common/footer.jsp" %>
