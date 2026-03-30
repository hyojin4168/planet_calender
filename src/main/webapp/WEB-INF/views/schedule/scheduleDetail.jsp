<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="path" value="${pageContext.request.contextPath}" />

<link rel="stylesheet" href="${path}/resources/css/scheduleDetail.css">

<main class="schedule-detail-page">
  <section class="detail-container">

    <h2 class="page-title">일정 상세</h2>

    <c:choose>

      <!-- 일정 존재 -->
      <c:when test="${not empty schedule}">
        <div class="detail-box">

          <div class="detail-item">
            <span class="label">제목</span>
            <span class="value">${schedule.title}</span>
          </div>

          <div class="detail-item">
            <span class="label">날짜</span>
            <span class="value">${schedule.startDate}</span>
          </div>

          <div class="detail-item">
            <span class="label">시간</span>
            <span class="value">
              ${schedule.startTime}
              <c:if test="${not empty schedule.endTime}">
                ~ ${schedule.endTime}
              </c:if>
            </span>
          </div>

          <div class="detail-item memo-box">
            <span class="label">메모</span>
            <div class="memo-content">
              <c:out value="${schedule.memo}" default="메모가 없습니다."/>
            </div>

            <div class="detail-actions">
              <button onclick="location.href='${path}/schedule/edit?scheduleId=${schedule.scheduleId}'">
                수정
              </button>

              <button onclick="deleteSchedule(${schedule.scheduleId})">
                삭제
              </button>
            </div>

          </div>
        </div>
      </c:when>

      <!-- 일정 없음 -->
      <c:otherwise>
        <div class="empty-state">
          <div class="empty-icon">📅</div>
          <p class="empty-title">등록된 일정이 없습니다</p>
          <p class="empty-desc">
            선택한 일정이 존재하지 않습니다.
          </p>
        </div>
      </c:otherwise>

    </c:choose>

  </section>
</main>

<script>
function deleteSchedule(scheduleId) {
  if(confirm("정말 삭제하시겠습니까?")) {
    location.href = "${path}/schedule/delete?scheduleId=" + scheduleId;
  }
}
</script>

<script src="${path}/resources/js/main.js"></script>

<%@ include file="../common/footer.jsp" %>
