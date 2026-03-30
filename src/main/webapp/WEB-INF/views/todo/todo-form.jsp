<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="currentPage" value="todo" />

<link rel="stylesheet" href="${path}/resources/css/todo-form.css">

<main class="todo-page">

  <section class="todo-form-container">

   <h2>
  <c:choose>
    <c:when test="${mode == 'edit'}">할 일 수정</c:when>
    <c:otherwise>할 일 등록</c:otherwise>
  </c:choose>
</h2>

<form method="post" action="${path}/todo">

  <input type="hidden" name="mode" value="${mode}" />

  <div class="form-group">
    <label>내용</label>
    <input type="text"
           name="title"
           value="${title}"
           required>
  </div>

	 <div class="form-actions">
		  <button type="submit" class="btn-save">
		    <c:choose>
		      <c:when test="${mode == 'edit'}">수정하기</c:when>
		      <c:otherwise>저장하기</c:otherwise>
		    </c:choose>
		  </button>
		
		  <a href="${path}/todo" class="btn-cancel">취소</a>
	</div>

  </form>

  </section>

</main>

<%@ include file="../common/footer.jsp" %>
