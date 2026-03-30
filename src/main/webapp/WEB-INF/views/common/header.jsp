<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>Planet Calendar</title>
  <link rel="stylesheet" href="${path}/resources/css/common/header.css">
</head>
<body>

<!-- Calendar Toolbar -->
<section class="calendar-toolbar" aria-label="달력 컨트롤">
  <div class="toolbar-inner">

    <!-- 1) 이전 / 연월 / 다음 -->
    <div class="calendar-nav">
      <button type="button" class="nav-btn prev-btn" aria-label="이전">‹</button>

      <button type="button" class="ym-btn" aria-label="연/월 표시">
        <span class="year"></span>.<span class="month"></span>
      </button>

      <button type="button" class="nav-btn next-btn" aria-label="다음">›</button>
    </div>

    <!-- 2) 월/주 토글 -->
    <div class="view-toggle" role="tablist" aria-label="보기 전환">
      <button type="button"
              class="view-btn month active"
              data-view="month"
              role="tab"
              aria-selected="true">
        월
      </button>

      <button type="button"
              class="view-btn week"
              data-view="week"
              role="tab"
              aria-selected="false">
        주
      </button>
    </div>

    <!-- 3) D-Day -->
    <div class="dday-wrap">
      <button class="dday-nav prev">‹</button>

      <div class="dday-scroll">
        <div class="dday-list">
          <button class="dday-chip">D-3 시험</button>
          <button class="dday-chip">D-12 여행</button>
        </div>
      </div>

      <button class="dday-nav next">›</button>
    </div>

    <!-- 4) More -->
    <button type="button" class="more-btn" aria-label="더보기">☰</button>

  </div>
</section>

<!-- Overlay -->
<div class="menu-overlay" hidden></div>

<!-- Side Menu -->
<aside class="side-menu" hidden>
  <nav class="side-menu-inner">
    <a href="#" class="side-item">가계부</a>
    <a href="#" class="side-item">메모</a>
    <a href="#" class="side-item">설정</a>
  </nav>
</aside>

<!-- First Visit Guide Toast -->
<div class="guide-toast" hidden>
  ☰ 더보기에서<br>
  가계부 · 메모 · 설정을 사용할 수 있어요
</div>
