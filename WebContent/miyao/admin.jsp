<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<meta charset="utf-8">
<title>Insert title here</title>
</head>

<script type="text/javascript">
	$(document).ready(function() {
		$("#addbtn").click(function() {

			var goodscategory = $("#category option:selected").val();
			var goodsname = $("#goodsname").val();
			var goodsprice = $("#goodsprice").val();
			var goodsqtt = $("#goodsqtt").val();
			var goodspic = $("#goodspic").val();
			var goodsdpic = $("#goodsdpic").val();
			var goodsdtext = $("#goodsdtext").val();
		
			if (goodscategory == "선택하세요") {
				alert("카테고리를 선택해주세요")
			} else if (goodsname == "") {
				alert("상품명을 입력해주세요")
			} else if (goodsprice == "") {
				alert("상품가격을 입력해주세요")
			} else if (goodsqtt == "") {
				alert("상품수량을 입력해주세요")
			} else if (goodspic == "") {
				alert("사진을 선택해주세요")
			} else {
				document.form1.action = "${path}upload.do";
				document.form1.submit();
			}

		});
		//$("#addbtn").click(function() {
		//	location.href = '${path}main.do';
		//});
	});
</script>
<style>
table, th, td {
	border: 1px solid #bcbcbc;
}

table {
	width: 50%;
	height: 250px;
}
</style>
<body>


	<h2>상품등록</h2>

	<form id="form1" name="form1" method="post"
		enctype="multipart/form-data">
		<table border="1">

			<tr>
				<td>상품카테고리</td>
				<td><select class="category" id="category" name="category">
						<option value="선택하세요">선택하세요</option>
						<option value="장난감">장난감</option>
						<option value="사료">사료</option>
						<option value="간식">간식</option>
						<option value="건강보조제">건강보조제</option>
						<option value="모래">모래</option>

				</select></td>
			</tr>

			<tr>
				<td>상품명</td>
				<td><input type="text" size="40" name="goodsname"
					id="goodsname"></td>
			</tr>

			<tr>
				<td>가격</td>
				<td><input type="text" name="goodsprice" id="goodsprice"></td>
			</tr>
			<tr>
				<td>수량</td>
				<td><input type="text" name="goodsqtt" id="goodsqtt"></td>
			</tr>
			<tr>
				<td>사진등록</td>
				<td><input type="file" name="goodspic" id="goodspic"></td>
			</tr>
			<tr>
				<td>상세페이지 사진등록</td>
				<td><input type="file" name="goodsdpic" id="goodsdpic"></td>
			</tr>
			
			<tr>
				<td>상품설명</td>
				<td><input type="text" name="goodsdtext" id="goodsdtext"></td>
			</tr>
			
			<tr>

				<td colspan="2" align="center"><input type="button" value="등록"
					id="addbtn"> <input type="button" value="목록" id=""></td>


			</tr>
		</table>
	</form>



</body>
</html>