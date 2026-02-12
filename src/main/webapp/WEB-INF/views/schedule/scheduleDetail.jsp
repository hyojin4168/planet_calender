<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="currentPage" value="todo" />

<link rel="stylesheet" href="${path}/resources/css/scheduleDetail.css">

<main class="schedule-detail-page">
  <section class="detail-container">

    <h2 class="page-title">일정 상세</h2>

    <c:choose>

      <c:when test="${date eq '2026-02-03'}">
        <div class="detail-box">
          <div class="detail-item">
            <span class="label">제목</span>
            <span class="value">시험</span>
          </div>
          <div class="detail-item">
            <span class="label">날짜</span>
            <span class="value">${date}</span>
          </div>
          <div class="detail-item">
            <span class="label">시간</span>
            <span class="value">10:00 ~ 12:00</span>
          </div>
          <div class="detail-item memo-box">
            <span class="label">메모</span>
            <div class="memo-content">
              중간고사 시험 일정입니다.
            </div>         
             <div class="detail-actions">
				  <button onclick="location.href='${path}/schedule/edit?date=${param.date}&idx=${param.idx}'">
				    수정
				  </button>
				
				  <button onclick="deleteSchedule()">삭제</button>
				</div>  
          </div>
        </div>
      </c:when>

      <c:when test="${date eq '2026-02-12'}">
        <div class="detail-box">
          <div class="detail-item">
            <span class="label">제목</span>
            <span class="value">여행</span>
          </div>
          <div class="detail-item">
            <span class="label">날짜</span>
            <span class="value">${date}</span>
          </div>
          <div class="detail-item">
            <span class="label">시간</span>
            <span class="value">09:00 ~ 21:00</span>
          </div>
          <div class="detail-item memo-box">
            <span class="label">메모</span>
            <div class="memo-content">
              부산 여행 일정입니다.
            </div>
              <div class="detail-actions">
				  <button onclick="location.href='${path}/schedule/edit?date=${param.date}&idx=${param.idx}'">
				    수정
				  </button>				
				  <button onclick="deleteSchedule()">삭제</button>
				</div>
          </div>
          </div>
      </c:when>

      <c:when test="${date eq '2026-02-18'}">
        <div class="detail-box">
          <div class="detail-item">
            <span class="label">제목</span>
            <span class="value">회의</span>
          </div>
          <div class="detail-item">
            <span class="label">날짜</span>
            <span class="value">${date}</span>
          </div>
          <div class="detail-item">
            <span class="label">시간</span>
            <span class="value">14:00 ~ 16:00</span>
          </div>
          <div class="detail-item memo-box">
            <span class="label">메모</span>
            <div class="memo-content">
              팀 프로젝트 회의입니다.
            </div>
              <div class="detail-actions">
				  <button onclick="location.href='${path}/schedule/edit?date=${param.date}&idx=${param.idx}'">
				    수정
				  </button>
				
				  <button onclick="deleteSchedule()">삭제</button>
			</div>
         
          </div>
          </div>
      </c:when>

      <c:otherwise>
        <div class="empty-state">
          <div class="empty-icon">📅</div>
          <p class="empty-title">등록된 일정이 없습니다</p>
          <p class="empty-desc">
            선택한 날짜에 일정이 없어요.
          </p>
        </div>
      </c:otherwise>

    </c:choose>

  </section>
</main>

<script>
function deleteSchedule() {
  if(confirm("정말 삭제하시겠습니까?")) {
    location.href = "${path}/calendar";
  }
}
</script>

<script src="${path}/resources/js/main.js"></script>

<%@ include file="../common/footer.jsp" %>
