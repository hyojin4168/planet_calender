<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>Planet Calendar</title>

  <!-- CSS는 무조건 head -->
  <link rel="stylesheet" href="${path}/resources/css/header.css">
</head>
<body>

  <!-- Global Header -->
  <header class="global-header" role="banner">
    <div class="global-inner">

      <h1 class="app-title">
        <a href="${path}/" class="app-title-link">Planet Calendar</a>
      </h1>

      <nav class="global-actions" aria-label="전역 메뉴">
        <button type="button" class="icon-btn menu-btn" aria-label="기능 메뉴">
          <span class="icon">☰</span>
        </button>

        <button type="button" class="icon-btn setting-btn" aria-label="설정">
          <span class="icon">⚙</span>
        </button>
      </nav>

    </div>
  </header>

  <!-- Calendar Header -->
  <section class="calendar-header" aria-label="달력 컨트롤">
    <div class="calendar-inner">

      <!-- 현재 연/월 -->
      <h2 class="current-date">
        <span class="year"></span>.
        <span class="month"></span>
      </h2>

      <!-- View Toggle -->
      <div class="view-toggle">
		  <button type="button"
		          class="view-btn month active"
		          data-view="month">
		   		 월
		  </button>
		
		  <button type="button"
		          class="view-btn week"
		          data-view="week">
		   		 주
		  </button>
		</div>

    </div>
  </section>

  <!-- Context Bar -->
  <section class="context-bar" aria-label="선택 날짜 정보">
    <div class="context-inner">

      <!-- Selected Date -->
      <div class="selected-date">
        <span class="date-main"></span>
        <span class="date-sub"></span>
      </div>

      <!-- D-Day Area -->
      <div class="dday-area">
        <button type="button" class="dday-btn prev" aria-label="이전 D-Day">‹</button>

        <div class="dday-list">
          <div class="dday-item">D-3 시험</div>
          <div class="dday-item">D-12 여행</div>
        </div>

        <button type="button" class="dday-btn next" aria-label="다음 D-Day">›</button>
      </div>

    </div>
  </section>
