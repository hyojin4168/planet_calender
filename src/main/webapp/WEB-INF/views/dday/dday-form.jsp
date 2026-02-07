<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="path" value="${pageContext.request.contextPath}" />

<link rel="stylesheet" href="${path}/resources/css/dday.css">

<main class="dday-page">

  <section class="dday-form-container">

    <h2 class="page-title">D-Day 등록 / 수정</h2>

    <!-- 나중에 action / method만 바꾸면 바로 백엔드 연결 -->
    <form class="dday-form">

      <div class="form-group">
        <label>제목</label>
        <input type="text" placeholder="예: 시험">
      </div>

      <div class="form-group">
        <label>날짜</label>
        <input type="date">
      </div>

      <div class="form-actions">
        <button type="submit" class="btn-save">저장</button>
        <a href="${path}/dday" class="btn-cancel">취소</a>
      </div>

    </form>

  </section>

</main>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
