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

    <!-- 빈 상태 처리 -->
    <c:choose>

      <c:when test="${empty todoGroups}">
        <p class="todo-empty">등록된 할 일이 없습니다.</p>
      </c:when>

      <c:otherwise>

        <!-- 날짜 그룹 반복 -->
        <c:forEach var="group" items="${todoGroups}" varStatus="gStatus">

          <div class="todo-date-group">

            <h3 class="todo-date">${group.date}</h3>

            <ul class="todo-list">

              <!-- ✅ 날짜별 할 일 반복 -->
              <c:forEach var="item" items="${group.todos}" varStatus="status">

                <li class="todo-item ${item.done ? 'done' : ''}">

                  <label class="todo-check">
                    <input type="checkbox"
				       class="todo-checkbox"
				       ${item.done ? 'checked' : ''}>
                    <span class="todo-title">${item.title}</span>
                  </label>

                  <div class="todo-actions">
                    <a href="${path}/todo/edit?date=${group.date}&idx=${status.index}"
                       class="btn-edit">수정</a>
					<a href="${path}/todo/delete?date=${group.date}&idx=${status.index}"
					   class="btn-delete"
					   onclick="return confirm('삭제하시겠습니까?');">
					   삭제
					</a>
                  </div>

                </li>

              </c:forEach>

            </ul>

          </div>

        </c:forEach>

      </c:otherwise>

    </c:choose>

  </section>

</main>

<script src="${path}/resources/js/todo.js"></script>

<%@ include file="../common/footer.jsp" %>
