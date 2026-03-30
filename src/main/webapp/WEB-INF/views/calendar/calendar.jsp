<!-- 캘린더 페이지 -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp" %>

<c:set var="currentPage" value="calendar" />

<link rel="stylesheet" href="${path}/resources/css/calendar.css">

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
<section class="schedule-panel ${not empty schedules ? 'active' : ''}">

  <div class="schedule-header">
    <h3 class="schedule-title">
      ${selectedDate} 일정
    </h3>
  </div>

  <c:if test="${not empty schedules}">
    <ul class="schedule-list">
      <c:forEach var="s" items="${schedules}">
        <li class="schedule-item"
            onclick="location.href='${path}/schedule/detail?scheduleId=${s.scheduleId}'">
          <span class="time">${s.startTime}</span>
          <span class="title">${s.title}</span>
        </li>
      </c:forEach>
    </ul>
  </c:if>

</section>

</main>

<script>
  const contextPath = "${pageContext.request.contextPath}";
  const selectedDate = "${selectedDate}";

  const monthEventDates = [
  <c:forEach var="s" items="${monthSchedules}" varStatus="status">
    "${s.startDate}"<c:if test="${!status.last}">,</c:if>
  </c:forEach>
  ];
</script>

<script src="${path}/resources/js/main.js"></script>

<%@ include file="../common/footer.jsp" %>
