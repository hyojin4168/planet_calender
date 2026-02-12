<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="currentPage" value="dday" />

<link rel="stylesheet" href="${path}/resources/css/dday-form.css">

<main class="dday-page">

  <section class="dday-form-container danger">

    <h2 class="page-title">D-Day 삭제</h2>

    <p class="delete-text">
      이 D-Day를 삭제하시겠습니까?
    </p>

    <div class="form-actions">
      <button type="button"
        class="btn-delete"
        onclick="confirmDelete()">
		  삭제
		</button>
      <a href="${path}/dday" class="btn-cancel">취소</a>
    </div>

  </section>

</main>

<script>
function confirmDelete() {
  if (confirm("정말 삭제하시겠습니까?")) {
    location.href = "${path}/dday";
  }
}
</script>

<%@ include file="../common/footer.jsp" %>
