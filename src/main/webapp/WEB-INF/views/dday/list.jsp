<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="path" value="${pageContext.request.contextPath}" />

<link rel="stylesheet" href="${path}/resources/css/dday.css">

<main class="dday-page">

  <section class="dday-list-container">

    <div class="dday-header">
      <h2 class="page-title">D-Day 목록</h2>
      <a href="${path}/dday/new" class="btn-add">+ 등록</a>
    </div>

    <ul class="dday-list">

      <!-- 더미 데이터 (UI 확인용) -->
      <li class="dday-item">
        <span class="dday-count">D-3</span>
        <div class="dday-info">
          <span class="dday-title">시험</span>
          <span class="dday-date">2026-02-03</span>
        </div>
        <div class="dday-actions">
          <a href="${path}/dday/edit" class="btn-edit">수정</a>
          <a href="#" class="btn-delete">삭제</a>
        </div>
      </li>

      <li class="dday-item">
        <span class="dday-count">D-12</span>
        <div class="dday-info">
          <span class="dday-title">여행</span>
          <span class="dday-date">2026-02-12</span>
        </div>
        <div class="dday-actions">
          <a href="${path}/dday/edit" class="btn-edit">수정</a>
          <a href="#" class="btn-delete">삭제</a>
        </div>
      </li>

    </ul>

  </section>

</main>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
