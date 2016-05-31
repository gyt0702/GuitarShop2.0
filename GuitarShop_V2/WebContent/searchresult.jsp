<%@page import="java.util.Iterator"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.guitarshop_v2.util.DBUtil" %>
<%@ page import="com.guitarshop_v2.model.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>结果</title>
</head>
<body>
<h2>搜索结果如下：</h2>
<style>
body{text-align: center}
</style>
<table style="text-align:center ;" border="1">
		<thead>
			<tr >

				<th style="width:100px;"><h5 ><strong><font style="color:red" >系列号</font></strong></h5></th>
				<th style="width:100px;"><h5 ><strong><font style="color:red">价格</font></strong></h5></th>
				<th style="width:100px;"><h5 ><strong><font style="color:red">制造商</font></strong></h5></th>
				<th style="width:100px;"><h5 ><strong><font style="color:red">模型</font></strong></h5></th>
				<th style="width:100px;"><h5 ><strong><font style="color:red">种类</font></strong></h5></th>
				<th style="width:100px;"><h5 ><strong><font style="color:red">背木</font></strong></h5></th>
				<th style=";width:100px;"><h5 ><strong><font style="color:red">上木</font></strong></h5></th>
			</tr>
		</thead>
		<tbody>
	<% 
		Inventory inventory = new Inventory();
		inventory = (Inventory)request.getAttribute("result");
		List guitars = new ArrayList();
		guitars = inventory.getGuitars();
		System.out.print(guitars.size());
		if(guitars.size()>0){
		Iterator i = guitars.iterator();
		while(i.hasNext()){
			Guitar guitar = (Guitar) i.next();
		 %>
		 <tr  >

		 <td >
		 <%=guitar.getSerialNumber() %>
		 </td>
		 
		 <td>
		 <%=guitar.getPrice() %>
		 </td>
		 
		 <td>
		 <%=guitar.getGuitarSpec().getBuilder() %>
		 </td>
		 
		 <td>
		 <%=guitar.getGuitarSpec().getModel() %>
		 </td>
		 
		 <td>
		 <%=guitar.getGuitarSpec().getType() %>
		 </td>
		 
		 <td>
		 <%=guitar.getGuitarSpec().getBackWood() %>
		 </td>
		 
		 <td>
		 <%=guitar.getGuitarSpec().getTopWood() %>
		 </td>
		 </tr>
		 
		
		 <%
			}
		%>
		
		 <%
		}else{
		%>
		抱歉！ 并没有符合的吉他。
		<% 	
		}
	%>
	</tbody>
</table>

<a href="SearchGuitar.jsp" style="display:inline-block;margin-top:20px;">返回重新搜索</a>
</body>
</html>