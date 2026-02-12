<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="path" value="${pageContext.request.contextPath}" />

<link rel="stylesheet" href="${path}/resources/css/dday.css">

<main class="dday-page">

  <section class="dday-form-container">

    <h2 class="page-title">
      <c:choose>
        <c:when test="${mode == 'edit'}">D-Day 수정</c:when>
        <c:otherwise>D-Day 등록</c:otherwise>
      </c:choose>
    </h2>

    <form class="dday-form" method="post" action="${path}/dday">

      <input type="hidden" name="mode" value="${mode}" />

      <div class="form-group">
        <label>제목</label>
        <input type="text"
               name="title"
               value="${title}"
               placeholder="예: 시험"
               required>
      </div>

      <div class="form-group">
        <label>날짜</label>
        <input type="date"
               name="date"
               value="${date}"
               required>
      </div>

      <div class="form-actions">

        <button type="submit" class="btn-save">
          <c:choose>
            <c:when test="${mode == 'edit'}">수정하기</c:when>
            <c:otherwise>저장하기</c:otherwise>
          </c:choose>
        </button>

        <a href="${path}/dday" class="btn-cancel">취소</a>

      </div>

    </form>

  </section>

</main>

<%@ include file="../common/footer.jsp" %>
