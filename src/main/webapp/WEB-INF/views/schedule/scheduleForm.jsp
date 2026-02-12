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
      <c:when test="${mode == 'edit'}">일정 수정</c:when>
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
        <c:when test="${mode == 'edit'}">일정 수정</c:when>
        <c:otherwise>일정 등록</c:otherwise>
      </c:choose>
    </h2>

    <form method="post" class="schedule-form">

      <input type="hidden" name="mode" value="${mode}" />
      <input type="hidden" name="date" value="${date}" />

      <div class="form-group">
        <label for="title">제목</label>
        <input type="text"
               id="title"
               name="title"
               value="${title}"
               placeholder="일정 제목을 입력하세요"
               required>
      </div>

      <div class="form-group">
        <label for="date">날짜</label>
        <input type="date"
               id="date"
               name="date"
               value="${date}"
               required>
      </div>

      <div class="form-group">
        <label for="content">메모</label>
        <textarea id="content"
                  name="content"
                  rows="4"
                  placeholder="메모를 입력하세요">${content}</textarea>
      </div>

      <div class="form-actions">
        <a href="${path}/calendar" class="btn-cancel">취소</a>

        <button type="submit" class="btn-submit">
          <c:choose>
            <c:when test="${mode == 'edit'}">수정하기</c:when>
            <c:otherwise>등록하기</c:otherwise>
          </c:choose>
        </button>
      </div>

    </form>

  </section>

</main>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>
