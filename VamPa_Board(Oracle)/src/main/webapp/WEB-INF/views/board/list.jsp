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
  .pageInfo{
      list-style : none;
      display: inline-block;
    margin: 50px 0 0 100px;      
  }
  .pageInfo li{
      float: left;
    font-size: 20px;
    margin-left: 18px;
    padding: 7px;
    font-weight: 500;
  }
 a:link {color:black; text-decoration: none;}
 a:visited {color:black; text-decoration: none;}
 a:hover {color:black; text-decoration: underline;}
 .active{
      background-color: #cdd5ec;
  }
   .search_area{
    display: inline-block;
    margin-top: 30px;
    margin-left: 260px;
  }
  .search_area input{
      height: 30px;
    width: 250px;
  }
  .search_area button{
     width: 100px;
    height: 36px;
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

	<!-- 검색 영역 -->
	<div class="search_wrap">
        <div class="search_area">
            <input type="text" name="keyword" value="${pageMaker.cri.keyword }">
            <button>Search</button>
        </div>
    </div> 

	<!-- 번호 페이지 구현 -->
	<div class="pageInfo_wrap" >
		<div class="pageInfo_area">
			<ul id="pageInfo" class="pageInfo">
			
				<!-- 이전 페이지 버튼 -->
				<c:if test="${pageMaker.prev}">
					<li class ="pageInfo_btn previous"><a href="${pageMaker.startPage-1}">Previous</a></li>
				</c:if>
			
				<!-- 각 번호 페이지 버튼 -->
				<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
					<!-- 컨트롤러에서 넘겨준 번호가 반복분을 돌다가 동일한 번호이면 active 동적 추가 -->
                    <li class="pageInfo_btn ${pageMaker.cri.pageNum == num ? "active":"" }"><a href="${num}">${num}</a></li>
                </c:forEach>
                
                <!-- 이후 페이지 버튼 -->
				<c:if test="${pageMaker.next}">
					<li class ="pageInfo_btn next"><a href="${pageMaker.endPage + 1}">Next</a></li>
				</c:if>
				
			</ul>
		</div>
	</div>
	
	<form id="moveForm" method="get">    
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
        <input type="hidden" name="amount" value="${pageMaker.cri.amount }">
        <input type="hidden" name="keyword" value="${cri.keyword}">
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
    	nameEle.remove();
    	// 위는 Form 안을 비워주기.
    	// vanila js는 부모.removeChild(자식)으로 지우고
    	// jquery는 자기.remove()로 지운다.
    	
        moveForm.append("<input type='hidden' name='bno' value='"+ $(this).attr("href")+ "'>");
        moveForm.attr("action", "/board/get");
        moveForm.submit();
    });
 	
 	// class pageIngo의 a 태그
	$(".pageInfo a").on("click", function(e){
		
		e.preventDefault();
		
		// name이 pageNum인 input 태그의 값을 href(선택한번호 번호)로 바꿔라
        moveForm.find("input[name='pageNum']").val($(this).attr("href"));
        moveForm.attr("action", "/board/list");
        moveForm.submit();
        
    });
 	
 	
 	
 	/* 검색 */
 	$(".search_area button").on("click", function(e){
        e.preventDefault();
        
       
        let val = $("input[name='keyword']").val();
        
        // 사용자가 입력한 keyword 데이터를 form 태그 내부에 있는 name속성이 keyword인 input 태그에 저장
        moveForm.find("input[name='keyword']").val(val);
        // form 태그 내부 name 속성이 pageNum인 <input>에 저장되어 있는 값을 1로 변경 후 서버 전송
        // 검색한 리스트의 결과는 pgaeNum을 1부터 다시 시작
        moveForm.find("input[name='pageNum']").val(1);
        moveForm.submit();
    });
    
</script>



</body>
</html>