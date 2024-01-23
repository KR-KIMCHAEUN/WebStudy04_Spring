<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<table>
	<thead>
		<tr>
			<th>NO</th>
			<th>제조사코드</th>
			<th>제조사명</th>
			<th>상품분류명</th>
			<th>상품분류코드</th>
			<th>주소</th>
		</tr>
	</thead>
	<tbody>
		<c:if test="${not empty buyerList}">
			<c:forEach items="${buyerList}" var="buyer">
				<tr>
					<td>${buyer.rnum}</td>
					<td>${buyer.buyerId}</td>
					<td>
	                     <c:url value="/buyer/buyerView.do" var="viewUrl">
	                        <c:param name="what" value="${buyer.buyerId }" />
	                     </c:url>
	                     <a href="${viewUrl }">${buyer.buyerName }</a>
                  	</td>
					<td>${buyer.lprod.lprodNm}</td>
					<td>${buyer.lprod.lprodGu}</td>
					<td>${buyer.buyerAdd1}</td>
				</tr>
			</c:forEach>
		 </c:if>
     	 <c:if test="${empty buyerList}">
     	  <tr>
            <td colspan="4">상품 없음.</td>
         </tr>
      </c:if>
	</tbody>
	 <tfoot>
      <tr>
         <td colspan="6">
			<form id ="searchForm"  action="<c:url value = '/buyer/buyerList.do'/>" >
			  	<input type = "hidden"  name = "page"  />
			  	<input type = "text" name = "prodLgu" value="${condition.prodLgu}" />
			  	<input type = "text" name = "buyerId" value="${condition.buyerId}" />
				<input type = "text"  name = "buyerAdd1" value="${condition.buyerAdd1}" />
			</form>
			<div data-pg-role="searchUI" data-pg-target="#searchForm">
				<select name="prodLgu" data-pg-init-value="${condition.prodLgu}">
					 <option>분류코드</option>
					<c:forEach items="${lprodList}" var="lprod">
						<option value="${lprod.lprodGu}">${lprod.lprodNm}</option>
					</c:forEach>
				</select>
				<select name="buyerId" data-pg-init-value="${condition.buyerId }">
					<option>제조사선택</option>
					<c:forEach items="${buyerLists}" var="buyers">
						<option value="${buyers.buyerId}" class="${buyers.buyerLgu}">${buyers.buyerName}</option>
					</c:forEach>
				</select>
				<input type ="text" name="buyerAdd1" value="${condition.buyerAdd1}" placeholder="주소" />
				<button type="button" data-pg-role="searchBtn">검색</button>
			</div>
            ${pagingHTML }
         </td>
      </tr>
   </tfoot>
</table>
<script src = "<c:url value ='/resources/js/app/common/paging.js' />"></script>
<script type="text/javascript">
   let $prodBuyer = $('select[name="prodBuyer"]');
   $('select[name="prodLgu"]').on("change",(event)=>{
	   let $prodLgu = $(event.target);
	   let selectedLgu = $prodLgu.val();
	   $prodBuyer.find("option:gt(0)").each((i,o)=>{
		   let $o =$(o);
		   let showFlag = (selectedLgu && $o.hasClass(selectedLgu)) || (!selectedLgu);
		   $o.toggle(showFlag);
	   });
// 	   $prodBuyer.find(`option.\${selectedLgu}`).show();
   });
</script>
