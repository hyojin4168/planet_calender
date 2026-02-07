<!-- 메뉴 페이지 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="currentPage" value="menu" />
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>Planet Calendar</title>

	<link rel="stylesheet" href="${path}/resources/css/menu.css">

</head>
<body>

<main class="menu-page">
  <section class="menu-container">
    <h2>메뉴</h2>

    <ul class="menu-list">
      <li><a href="${path}/calendar">캘린더</a></li>
      <li><a href="${path}/schedule">일정 등록</a></li>
      <li><a href="${path}/dday">D-Day</a></li>
      <li><a href="${path}/todo">To-Do</a></li>
      <li><a href="${path}/settings">설정</a></li>
    </ul>
  </section>
</main>

<%@ include file="../common/footer.jsp" %>
