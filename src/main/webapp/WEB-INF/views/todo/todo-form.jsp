<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="currentPage" value="todo" />

<link rel="stylesheet" href="${path}/resources/css/todo-form.css">

<main class="todo-page">

  <section class="todo-form-container">

    <h2 class="page-title">To-Do 등록 / 수정</h2>

    <form class="todo-form">

      <div class="form-group">
        <label>할 일</label>
        <input type="text" placeholder="할 일을 입력하세요">
      </div>

      <div class="form-group">
        <label>날짜</label>
        <input type="date">
      </div>

      <div class="form-actions">
        <button type="button" class="btn-save">저장</button>
        <a href="${path}/todo" class="btn-cancel">취소</a>
      </div>

    </form>

  </section>

</main>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
