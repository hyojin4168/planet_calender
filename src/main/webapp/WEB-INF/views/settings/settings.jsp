<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="currentPage" value="settings" />

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>설정 | Planet Calendar</title>

  <link rel="stylesheet" href="${path}/resources/css/settings.css">
</head>
<body>

<main class="settings-page">

  <section class="settings-container">
    <h2 class="page-title">설정</h2>

    <ul class="settings-list">
      <li class="settings-item">
        <span class="item-title">알림 설정</span>
        <span class="item-desc">D-Day 및 일정 알림 관리</span>
      </li>

      <li class="settings-item">
        <span class="item-title">시작 요일</span>
        <span class="item-desc">캘린더 시작 요일 설정</span>
      </li>

      <li class="settings-item">
        <span class="item-title">테마</span>
        <span class="item-desc">라이트 / 다크 모드</span>
      </li>

      <li class="settings-item danger">
        <span class="item-title">데이터 초기화</span>
        <span class="item-desc">모든 일정 및 D-Day 삭제</span>
      </li>
    </ul>

    <p class="settings-note">
      ※ 설정 기능은 추후 업데이트 예정입니다.
    </p>

  </section>

</main>

<%@ include file="../common/footer.jsp" %>
</body>
</html>
