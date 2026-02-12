<!-- D-Day 전체 목록 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="currentPage" value="dday" />

<link rel="stylesheet" href="${path}/resources/css/dday.css">

<main class="dday-page">

  <section class="dday-list-container">

    <!-- 헤더 영역 -->
    <div class="dday-header">
      <h2 class="page-title">D-Day 목록</h2>
      <a href="${path}/dday/new" class="btn-add">+ 등록</a>
    </div>

   <ul class="dday-list">

  <c:choose>
    <c:when test="${empty ddayList}">
      <li class="dday-empty">
        등록된 D-Day가 없습니다.
      </li>
    </c:when>

    <c:otherwise>
      <c:forEach var="item" items="${ddayList}" varStatus="status">
        <li class="dday-item">

          <span class="dday-count">${item.count}</span>

          <div class="dday-info">
            <span class="dday-title">${item.title}</span>
            <span class="dday-date">${item.date}</span>
          </div>

          <div class="dday-actions">
            <a href="${path}/dday/edit?idx=${status.index}" class="btn-edit">수정</a>
            <a href="${path}/dday/delete?idx=${status.index}" class="btn-delete">삭제</a>
          </div>

        </li>
      </c:forEach>
    </c:otherwise>

  </c:choose>

</ul>

  </section>

</main>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
