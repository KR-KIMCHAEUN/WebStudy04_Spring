<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<table class="table table-bordered">
	<thead>
		<tr>
			<th>일련번호</th>
			<th>회원명</th>
			<th>이메일</th>
			<th>휴대폰</th>
			<th>주소1</th>
			<th>마일리지</th>
		</tr>
	</thead>
	<tbody>
		<c:choose>
			<c:when test="${not empty memberList}">
				<c:forEach items="${memberList}" var="member">
					<tr>
						<td>${member.rnum}</td>
						<td>${member.memName}</td>
						<td>${member.memMail}</td>
						<td>${member.memHp}</td>
						<td>${member.memAdd1}</td>
						<td>${member.memMileage}</td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="6">조건에 맞는 회원이 없음,</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</tbody>
	<tfoot>
		<tr>
			<td colspan="6">
				<form:form id="submitForm" modelAttribute="paging" method="get">
					<input type = "hidden"  name = "page" placeholder="page" />
					<form:input path="simpleCondition.searchType" placeholder="searchType"/>
					<form:input path="simpleCondition.searchWord" placeholder="searchWord"/>
				</form:form>
				<div data-pg-role="searchUI" data-pg-target="#submitForm">
					<form:select path="paging.simpleCondition.searchType" class="form-select">
						<form:option value="" label="전체"/>
						<form:option value="name" label="이름"/>
						<form:option value="address" label="주소"/>
					</form:select>
					<form:input path="paging.simpleCondition.searchWord"/>
					<button type="button" data-pg-role="searchBtn">검색</button>
				</div>
				${pagingHTML} 
			</td>
		</tr>
	</tfoot>
</table>
<script src = "<c:url value ='/resources/js/app/common/paging.js' />"></script>
