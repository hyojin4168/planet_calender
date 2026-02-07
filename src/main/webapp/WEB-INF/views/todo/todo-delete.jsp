<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="path" value="${pageContext.request.contextPath}" />

<link rel="stylesheet" href="${path}/resources/css/todo-form.css">

<main class="todo-page">

  <section class="todo-form-container danger">

    <h2 class="page-title">To-Do 삭제</h2>

    <p class="delete-text">
      이 할 일을 삭제하시겠습니까?
    </p>

    <div class="form-actions">
      <button type="button" class="btn-delete">삭제</button>
      <a href="${path}/todo" class="btn-cancel">취소</a>
    </div>

  </section>

</main>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
