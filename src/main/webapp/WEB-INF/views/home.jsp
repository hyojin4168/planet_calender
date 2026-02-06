<!-- D-Day 요약 페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="currentPage" value="home" />
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>Planet Calendar</title>
  <link rel="stylesheet" href="${path}/resources/css/home.css">
</head>
<body>

<main class="home-page">

  <!-- =====================
       D-Day Summary
  ====================== -->
  <section class="dday-summary-container">

    <h2 class="section-title">D-Day</h2>

    <ul class="dday-list">
      <!-- Phase 1: 정적 더미 -->
      <li class="dday-item">
        <span class="dday-count">D-3</span>
        <span class="dday-title">시험</span>
      </li>

      <li class="dday-item">
        <span class="dday-count">D-12</span>
        <span class="dday-title">여행</span>
      </li>

      <li class="dday-item">
        <span class="dday-count">D-30</span>
        <span class="dday-title">프로젝트 발표</span>
      </li>
    </ul>
    
    <a href="${path}/dday" class="dday-more">
	  D-Day 전체 보기 →
	</a>
    
  </section>

</main>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
