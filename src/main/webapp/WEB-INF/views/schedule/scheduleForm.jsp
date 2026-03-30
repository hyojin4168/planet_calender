<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>
    <c:choose>
      <c:when test="${not empty schedule}">일정 수정</c:when>
      <c:otherwise>일정 등록</c:otherwise>
    </c:choose>
    | Planet Calendar
  </title>
  <link rel="stylesheet" href="${path}/resources/css/schedule.css">
</head>
<body>

<main class="schedule-page">

  <section class="schedule-form-container">

    <h2 class="page-title">
      <c:choose>
        <c:when test="${not empty schedule}">일정 수정</c:when>
        <c:otherwise>일정 등록</c:otherwise>
      </c:choose>
    </h2>

    <form method="post"
          action="<c:choose>
                    <c:when test='${not empty schedule}'>
                      ${path}/schedule/update
                    </c:when>
                    <c:otherwise>
                      ${path}/schedule/create
                    </c:otherwise>
                  </c:choose>"
          class="schedule-form">

      <!-- 수정일 때만 scheduleId 포함 -->
      <c:if test="${not empty schedule}">
        <input type="hidden" name="scheduleId"
               value="${schedule.scheduleId}" />
      </c:if>

      <div class="form-group">
        <label for="title">제목</label>
        <input type="text"
               id="title"
               name="title"
               value="${schedule.title}"
               placeholder="일정 제목을 입력하세요"
               required>
      </div>

      <div class="form-group">
        <label for="startDate">날짜</label>
        <input type="date"
               id="startDate"
               name="startDate"
               value="${schedule.startDate}"
               required>
      </div>

      <div class="form-group">
        <label for="startTime">시작 시간</label>
        <input type="time"
               id="startTime"
               name="startTime"
               value="${schedule.startTime}">
      </div>

      <div class="form-group">
        <label for="endTime">종료 시간</label>
        <input type="time"
               id="endTime"
               name="endTime"
               value="${schedule.endTime}">
      </div>

      <div class="form-group">
        <label for="memo">메모</label>
        <textarea id="memo"
                  name="memo"
                  rows="4"
                  placeholder="메모를 입력하세요">${schedule.memo}</textarea>
      </div>

      <div class="form-actions">
        <a href="${path}/calendar" class="btn-cancel">취소</a>

        <button type="submit" class="btn-submit">
          <c:choose>
            <c:when test="${not empty schedule}">수정하기</c:when>
            <c:otherwise>등록하기</c:otherwise>
          </c:choose>
        </button>
      </div>

    </form>

  </section>

</main>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
