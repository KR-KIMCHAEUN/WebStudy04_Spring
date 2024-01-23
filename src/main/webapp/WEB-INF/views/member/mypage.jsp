<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:if test="${not empty sessionScope.message}">
	<span class="text-danger">${sessionScope.message}</span>	
	<c:remove scope="session" var="message"/> 
</c:if>
<table class="table table-bordered">
	<tr>
		<th>프로필</th>
		<td>
			<img src="data:image/*;base64,${member.base64Img}"/>
		</td>
	</tr>
	<tr>
		<th>회원아이디</th>
		<td>${requestScope.member.memId}</td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td>${requestScope.member.memPass}</td>
	</tr>
	<tr>
		<th>이름</th>
		<td>${requestScope.member.memName}</td>
	</tr>
	<tr>
		<th>주민번호1</th>
		<td>${requestScope.member.memRegno1}</td>
	</tr>
	<tr>
		<th>주민번호2</th>
		<td>${requestScope.member.memRegno2}</td>
	</tr>
	<tr>
		<th>생일</th>
		<td>${requestScope.member.memBir}</td>
	</tr>
	<tr>
		<th>우편번호</th>
		<td>${requestScope.member.memZip}</td>
	</tr>
	<tr>
		<th>주소1</th>
		<td>${requestScope.member.memAdd1}</td>
	</tr>
	<tr>
		<th>주소2</th>
		<td>${requestScope.member.memAdd2}</td>
	</tr>
	<tr>
		<th>집전번</th>
		<td>${requestScope.member.memHometel}</td>
	</tr>
	<tr>
		<th>회사전번</th>
		<td>${requestScope.member.memComtel}</td>
	</tr>
	<tr>
		<th>휴대폰</th>
		<td>${requestScope.member.memHp}</td>
	</tr>
	<tr>
		<th>이메일</th>
		<td>${requestScope.member.memMail}</td>
	</tr>
	<tr>
		<th>직업</th>
		<td>${requestScope.member.memJob}</td>
	</tr>
	<tr>
		<th>취미</th>
		<td>${requestScope.member.memLike}</td>
	</tr>
	<tr>
		<th>기념일</th>
		<td>${requestScope.member.memMemorial}</td>
	</tr>
	<tr>
		<th>기념일자</th>
		<td>${requestScope.member.memMemorialday}</td>
	</tr>
	<tr>
		<th>마일리지</th>
		<td>${requestScope.member.memMileage}</td>
	</tr>
	<tr>
		<td colspan="2">
			<button class="btn btn-danger" id="delBtn">탈퇴</button>
			<a class="btn btn-primary" href='<c:url value = "/member/memberUpdate.do" />'>개인정보수정</a>
		</td>
	</tr>
</table>
<h4>구매목록</h4>
<table class="table table-bordered">
	<thead>
		  <th>상품명</th>
		  <th>상품가격</th>
		  <th>상품마일리지</th>
	</thead>
	<tbody>
<c:set var ="cartList" value="${member.cartList}"/>
   <c:choose>
      <c:when test="${not empty cartList }">
         <c:forEach items="${cartList }" var="cart">
            <tr>
               <td>
               <c:url value="/prod/prodView.do" var="viewUrl">
                  <c:param name="what" value="${cart.prod.prodId }"/>
               </c:url>
                  <a href="${viewUrl}">${cart.prod.prodName }</a>
               </td>
               <td>${cart.prod.prodPrice }</td>
               <td>${cart.prod.prodMileage }</td>
            </tr>
         </c:forEach>
      </c:when>
      <c:otherwise>
         <tr>
            <td colspan="5">구매이력 없음</td>
         </tr>
      </c:otherwise>
   </c:choose>
   </tbody>
</table>
<form name ="deleteForm" method="post" action="${pageContext.request.contextPath}/member/memberDelete.do">
	<input type="hidden" name="password"/>
</form>
<script>
// /* function pwCheck(){
// 	let password = prompt("비밀번호");
//  	if(password.length>0){
//  		document.deleteForm.password.value = password;
//  		$(document.deleteForm).submit();
 		
//  	}
// }; */
	$(delBtn).on("click", function(){
	 	let password = prompt("비밀번호");
	 	if(password.length>0){
	 		document.deleteForm.password.value = password;
	 		$(document.deleteForm).submit();
	 		
	 	}
	});
</script>

