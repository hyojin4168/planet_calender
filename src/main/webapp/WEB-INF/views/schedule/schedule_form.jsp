<!-- 일정 등록하는 페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="currentPage" value="menu" />
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>일정 등록 | Planet Calendar</title>
  <link rel="stylesheet" href="${path}/resources/css/schedule.css">
</head>
<body>

<main class="schedule-page">

  <section class="schedule-form-container">

    <h2 class="page-title">일정 등록</h2>

    <!-- Phase 1: 구조만 -->
    <form class="schedule-form">

      <div class="form-group">
        <label for="title">제목</label>
        <input type="text" id="title" placeholder="일정 제목을 입력하세요" disabled>
      </div>

      <div class="form-group">
        <label for="date">날짜</label>
        <input type="date" id="date" disabled>
      </div>

      <div class="form-group">
        <label for="memo">메모</label>
        <textarea id="memo" rows="4" placeholder="메모를 입력하세요" disabled></textarea>
      </div>

      <div class="form-actions">
		  <a href="${path}/calendar" class="btn-cancel">취소</a>
		  <button type="button" class="btn-submit">등록</button>
	  </div>

    </form>

  </section>

</main>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
