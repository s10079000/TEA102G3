<%@page import="java.util.*"%>
<%@page import="com.orderdetail.model.*"%>
<%@page import="com.orderlist.model.*"%>
<%@page import="com.product.model.*"%>
<%@page import="com.productPicture.model.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
        
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:useBean id="productSvc" scope="page" class="com.product.model.ProductService"></jsp:useBean>
<jsp:useBean id="productPicSvc" scope="page" class="com.productPicture.model.ProductPictureService"></jsp:useBean>

<%
	OrderdetailService orderdetailSvc =new OrderdetailService();
	String o_id =request.getParameter("o_id");
    String od_id =request.getParameter("od_id");
    
    OrderdetailVO orderdetailVO =orderdetailSvc.getOneOrderdetail(od_id);
	OrderlistService orderlistSvc =new OrderlistService();
	OrderlistVO orderlistVO =orderlistSvc.getOneOrderlist(o_id);
	
	System.out.println(request.getParameter("o_id")); 

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>orderdetail</title>

<style>
  table#table-1 {
	background-color: #CCCCFF;
    border: 2px solid black;
    text-align: center;
  }
  table#table-1 h4 {
    color: red;
    display: block;
    margin-bottom: 1px;
  }
  h4 {
    color: blue;
    display: inline;
  }
</style>

<style>

</style>

</head>
<body>
<table id="table-1">
	<tr><td>
		 <h3>所有訂單資料 - listAllorderdetail.jsp</h3>
		 <h4><a href="<%= request.getContextPath() %>/Back_end/OrderDetail/select_page.jsp"><img src="<%= request.getContextPath() %>/Back_end/images/back1.gif" width="100" height="32" border="0">回首頁</a></h4>
	</td></tr>
</table>
<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>


<table>
<h1><%=orderlistVO.getO_id()%></h1>
<h1><%=orderlistVO.getO_status()%></h1>

	<tr>
<!-- 		<th>流水號</th> -->
<!-- 		<th>訂單編號</th> -->
		<th>商品名稱</th>
		<th>產品數量</th>
<!-- 		<th>修改</th> -->
<!-- 		<th>刪除</th> -->
		
	</tr>
	<c:forEach var="orderdetailVO" items="${list}">
		<tr>
		    
<%-- 			<td>${orderdetailVO.od_id}</td> --%>
<%-- 			<td>${orderdetailVO.o_id}</td> --%>
<%--             <td><%=productSvc.oneProduct(orderdetailVO.getP_id())%></td> --%>
           <td><img src="data:image/jpg;base64,${productPicSvc.findFirstOneProductPicture(orderdetailVO.p_id).pp_picture64}" width="100px" height="100px";></td> 

<%--        <td><img src="data:image/jpg;base64,<%=((ProductPictureVO)(productPicSvc.findFirstOneProductPicture(orderdetailVO.getP_id()))).getPp_picture64()%>" width="100px" height="100px";></td> --%>
			<td>${orderdetailVO.p_id} ${productSvc.oneProduct(orderdetailVO.p_id).p_name}</td>
			<td>${orderdetailVO.od_count}</td>
			
<!-- 			<td> -->
<%-- 				<FORM METHOD="post" ACTION="<%= request.getContextPath() %>/OrderdetailServlet" style="margin-bottom: 0px;"> --%>
<!-- 			     <input type="submit" value="修改"> -->
<%-- 			     <input type="hidden" name="od_id"  value="${orderdetailVO.od_id}"> --%>
<!-- 			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM> -->
<!-- 			</td> -->
<!-- 			<td> -->
<%-- 			  <FORM METHOD="post" ACTION="<%= request.getContextPath() %>/OrderdetailServlet" style="margin-bottom: 0px;"> --%>
<!-- 			     <input type="submit" value="刪除"> -->
<%-- 			     <input type="hidden" name="od_id"  value="${orderdetailVO.od_id}"> --%>
<!-- 			     <input type="hidden" name="action" value="delete"></FORM> -->
<!-- 			</td> -->
		</tr>	
	</c:forEach>
</table>

</body>
</html>