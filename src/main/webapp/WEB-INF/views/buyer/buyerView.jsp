<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<table class="table table-bordered">
   <tr>
      <th>제조사코드</th>
      <td>${buyer.buyerId}</td>
   <tr>
   <tr>
      <th>제조사명</th>
      <td>${buyer.buyerName}</td>
   <tr>
   <tr>
      <th>제조사분류</th>
      <td>${buyer.lprod.lprodNm}</td>
   <tr>
   <tr>
      <th>은행</th>
      <td>${buyer.buyerBank}</td>
   <tr>
   <tr>
      <th>계좌번호</th>
      <td>${buyer.buyerBankno}</td>
   <tr>
   <tr>
      <th>계좌주</th>
      <td>${buyer.buyerBankname}</td>
   <tr>
   <tr>
      <th>우편번호</th>
      <td>${buyer.buyerZip}</td>
   <tr>
   <tr>
      <th>주소11</th>
      <td>${buyer.buyerAdd1}</td>
   <tr>
   <tr>
      <th>주소2</th>
      <td>${buyer.buyerAdd2}</td>
   <tr>
   <tr>
      <th>전화번호</th>
      <td>${buyer.buyerComtel}</td>
   <tr>
   <tr>
      <th>팩스번호</th>
      <td>${buyer.buyerFax}</td>
   <tr>
   <tr>
      <th>이메일</th>
      <td>${buyer.buyerMail}</td>
   <tr>
   <tr>
      <th>담당자</th>
      <td>${buyer.buyerCharger}</td>
   <tr>
   <tr>
      <th>거래품목</th>
      <td>
         <table class="table table-bordered">
            <thead>
               <tr>
                  <th>상품명</th>
                  <th>구매가</th>
                  <th>판매가</th>
                  <th>세일가</th>
                  <th>마일리지</th>
               </tr>
            </thead>
            <tbody>
               <!-- 없으면 아직은 거래 품목이 없다. 없는지는 size -->
               <c:if test="${not empty buyer.prodList }">
                  <c:forEach items="${buyer.prodList }" var="prod">
                     <tr>
                        <td>
                            <c:url value="/prod/prodView.do" var="viewUrl">
		               	   		<c:param name="what" value="${prod.prodId}"/>
               	  			</c:url>
                        	<a href="${viewUrl}">${prod.prodName }</a>
                        </td>
                        <td>${prod.prodCost }</td>
                        <td>${prod.prodPrice }</td>
                        <td>${prod.prodSale }</td>
                        <td>${prod.prodMileage }</td>
                     </tr>
                  </c:forEach>
               </c:if>
               <c:if test="${empty buyer.prodList }">
                  <tr>
                     <td colspan="5">거래 품목 없음.</td>
                  <tr>
               </c:if>
            </tbody>
         </table>
      </td>
   <tr>
</table>'