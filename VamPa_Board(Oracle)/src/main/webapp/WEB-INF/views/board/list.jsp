<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 라이브러리 코드 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
   <style>
  a{
  	text-decoration : none;
  }
  table{
 	border-collapse: collapse;
 	width: 1000px;    
 	margin-top : 20px;
 	text-align: center;
  }
  td, th{
  	border : 1px solid black;
  	height: 50px;
  }
  th{
  	font-size : 17px;
  }
  thead{
  	font-weight: 700;
  }
  .table_wrap{
  	margin : 50px 0 0 50px;
  }
  .bno_width{
  	width: 12%;
  }
  .writer_width{
  	width: 20%;
  }
  .regdate_width{
  	width: 15%;
  }
  .updatedate_width{
  	width: 15%;
  }
  .top_btn{
  	font-size: 20px;
    padding: 6px 12px;
    background-color: #fff;
    border: 1px solid #ddd;
    font-weight: 600;
  }
  </style>
</head>
<body>
<h1>list 페이지 입니다.</h1>

<div class="table_wrap">
	<a href="/board/enroll" class="top_btn">게시판 등록</a>
	<table>
		<thead>
			<tr>
				<th class="bno_width">번호</th>
				<th class="title_width">제목</th>
				<th class="writer_width">작성자</th>
				<th class="regdate_width">작성일</th>
				<th class="updatedate_width">수정일</th>
			</tr>
		</thead>
		<!-- 반복 -->
		<c:forEach items="${list}" var="list">
            <tr>
                <td><c:out value="${list.bno}"/></td>
                <td>
	                <a class="move" href='<c:out value="${list.bno}"/>'>
	        			<c:out value="${list.title}"/>
	    			</a>
	    		</td>
                <%-- <td><c:out value="${list.title}"/></td> --%>
                <td><c:out value="${list.writer}"/></td>
                <!-- 날짜 포맷 -->
                <td><fmt:formatDate pattern="yyyy/MM/dd" value="${list.regdate}"/></td>
                <td><fmt:formatDate pattern="yyyy/MM/dd" value="${list.updateDate}"/></td>
            </tr>
        </c:forEach>
	</table>
	<form id="moveForm" method="get">    
    </form>
</div>


<script>
    $(document).ready(function(){
    	
    	let result = '<c:out value="${result}"/>';
    	
    	// 함수 호출
    	checkAlert(result);
    	// 뒤로가기를 진행 한 경우 처음 초기 값이 그대로 세팅 되는 문제 해결

    	
    	// 함수 생성
    	function checkAlert(result){
    		if(result === "" ){
    			return;
    		}
    		
    		if(result === "enroll success"){
    			alert("등록이 완료되었습니다.");
    		}
    		
    		if(result === "modify success"){
    			alert("수정이 완료되었습니다.");
    		}
    		
    		if(result === "delete success"){
    			alert("삭제가 완료되었습니다.");
    		}
    	} 
 
    });
    
    
    /* a 태그가 동작 되도록 하는 자바스크립트 코드 */
    let moveForm = $("#moveForm");
 	/* a 태그(class move인 제목)가 클릭이 되면 이 함수를 실행한다. */
    $(".move").on("click", function(e){
    	// 이벤트 버블링 막기
    	// 자식의 이벤트를 부모에서도 인식해서 실행하는 문제가 있다, ( in javaScript )
    	// 그래서 이벤트를 부모에서 실행되지 않도록 막는 역할
        e.preventDefault();
        
    	// Dom요소 추가 > 정적인 컨텐츠가 아니라 동적인 컨텐츠로 변환
    	// 비어있는 moveForm에 동적으로 hidden input으로 bno 추가
    	// 이것만 있으면 뒤로가기 했을 때 bno가 누적되는 현상 발생
    	// -> moveForm에서 dom적 제거 진행 해준다.
    	
    	// jquery name 받아와서 내용을 제거해주기
    	let nameEle = $("input[name=bno]");
    	// name 불러온 값 제거 > reset
    	//nameEle.remove();
    	moveForm.empty();
    	// 위는 Form 안을 비워주기.
    	// vanila js는 부모.removeChild(자식)으로 지우고
    	// jquery는 자기.remove()로 지운다.
    	
        moveForm.append("<input type='hidden' name='bno' value='"+ $(this).attr("href")+ "'>");
        moveForm.attr("action", "/board/get");
        moveForm.submit();
    });
    
</script>



</body>
</html>