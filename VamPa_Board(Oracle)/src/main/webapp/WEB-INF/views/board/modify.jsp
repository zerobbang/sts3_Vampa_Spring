<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jquery  -->
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
  <style>
<style type="text/css">
.input_wrap{
	padding: 5px 20px;
}
label{
    display: block;
    margin: 10px 0;
    font-size: 20px;	
}
input{
	padding: 5px;
    font-size: 17px;
}
textarea{
	width: 800px;
    height: 200px;
    font-size: 15px;
    padding: 10px;
}
.btn{
  	display: inline-block;
    font-size: 22px;
    padding: 6px 12px;
    background-color: #fff;
    border: 1px solid #ddd;
    font-weight: 600;
    width: 140px;
    height: 41px;
    line-height: 39px;
    text-align : center;
    margin-left : 30px;
    cursor : pointer;
}
.btn_wrap{
	padding-left : 80px;
	margin-top : 50px;
}
.delete_btn{
	background-color: #f3e3e7;
}
</style>
</head>

<body>
<h1>수정 페이지</h1>
<form id="modifyForm" action="/board/modify" method="post">
	<div class="input_wrap">
		<label>게시판 번호</label>
		<input name="bno" readonly="readonly" value='<c:out value="${pageInfo.bno}"/>' >
	</div>
	<div class="input_wrap">
		<label>게시판 제목</label>
		<input name="title"  value='<c:out value="${pageInfo.title}"/>' >
	</div>
	<div class="input_wrap">
		<label>게시판 내용</label>
		<textarea rows="3" name="content" ><c:out value="${pageInfo.content}"/></textarea>
	</div>
	<div class="input_wrap">
		<label>게시판 작성자</label>
		<input name="writer" readonly="readonly" value='<c:out value="${pageInfo.writer}"/>' >
	</div>
	<div class="input_wrap">
		<label>게시판 등록일</label>
		<input name="regdater" readonly="readonly" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${pageInfo.regdate}"/>' >
	</div>
	<div class="input_wrap">
		<label>게시판 수정일</label>
		<input name="updateDate" readonly="readonly" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${pageInfo.updateDate}"/>' >
	</div>		
	<div class="btn_wrap">
		<a class="btn" id="list_btn">목록 페이지</a> 
		<a class="btn" id="modify_btn">수정 완료</a>
		<a class="btn" id="cancel_btn">수정 취소</a>
		<a class="btn" id="delete_btn">삭제</a>
	</div>
	</form>
	
	
	<!-- 다양한 상황을 처리하기 위해 form tag를 통해 유연하게 바꿀 수 있도록 한다.  -->
	<form id="infoForm" action="/board/modify" method="get">
		<input type="hidden" id="bno" name="bno" value='<c:out value="${pageInfo.bno}"/>'>
	</form>
	
<!-- 버튼 동작 script tag와 js코드 작성 -->
<script>
	let form = $("#infoForm");
	let mForm = $("#modifyForm");   
	
	$("#list_btn").on("click", function(e){
		form.find("#bno").remove();
		// 게시글 목록으로 가면은 게시글 상세 조회 시 받아온 pageInfo.bno를 remove
		form.attr("action", "/board/list");
		form.submit();
	});
	
	$("#modify_btn").on("click", function(e){
		mForm.submit();

	});	
	
	$("#cancel_btn").on("click", function(e){
		form.attr("action", "/board/get");
		form.submit();
	});	
	
	$("#delete_btn").on("click", function(e){
		form.attr("action", "/board/delete");
		form.attr("method","post");
		form.submit();
	});	
</script>

	
</body>
</html>