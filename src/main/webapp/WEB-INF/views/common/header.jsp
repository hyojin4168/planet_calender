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
  <link rel="stylesheet" href="${path}/resources/css/common/header.css">
</head>
<body>

  <!-- Calendar Toolbar (통합 헤더) -->
<section class="calendar-toolbar" aria-label="달력 컨트롤">
  <div class="toolbar-inner">

    <!-- 1) 연/월 -->
    <button type="button" class="ym-btn" aria-label="연/월 선택">
      <span class="year"></span>.<span class="month"></span>
      <span class="ym-caret"></span>
    </button>

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

    <!-- More Button -->
	<button type="button" class="more-btn" aria-label="더보기">
	  ☰
	</button>
	    
  </div>
</section>

<!-- First Visit Guide Toast -->
<div class="guide-toast" hidden>
  ☰ 더보기에서<br>
  가계부 · 메모 · 설정을 사용할 수 있어요
</div>
