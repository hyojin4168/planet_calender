<!-- 날짜 기반 투두 리스트 페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="currentPage" value="todo" />

<link rel="stylesheet" href="${path}/resources/css/todo.css">

<main class="todo-page">

  <section class="todo-container">

    <!-- 상단 -->
    <div class="todo-header">
      <h2 class="page-title">To-Do</h2>
      <a href="${path}/todo/new" class="btn-add">+ 추가</a>
    </div>

    <!-- 날짜 기준 그룹 -->
    <div class="todo-date-group">

      <h3 class="todo-date">2026-02-03</h3>

      <ul class="todo-list">
        <!-- Phase 1: 정적 더미 -->
        <li class="todo-item">
          <label class="todo-check">
            <input type="checkbox" disabled>
            <span class="todo-title">운동하기</span>
          </label>
        </li>

        <li class="todo-item done">
          <label class="todo-check">
            <input type="checkbox" checked disabled>
            <span class="todo-title">약 챙기기</span>
          </label>
        </li>
      </ul>

    </div>

    <div class="todo-date-group">

      <h3 class="todo-date">2026-02-04</h3>

      <ul class="todo-list">
        <li class="todo-item">
          <label class="todo-check">
            <input type="checkbox" disabled>
            <span class="todo-title">개발 공부 1시간</span>
          </label>
        </li>
      </ul>

    </div>

  </section>

</main>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
