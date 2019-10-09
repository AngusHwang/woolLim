<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>


<script src="/webapp/js/jquery.tablesorter.min.js"></script>
<script src="/webapp/js/widget-scroller.js"></script>




<meta charset="UTF-8">
<title>Insert title here</title>

</head>



<body>

	<jsp:include page="adminMenubar.jsp"/>
	
	<div class="container-fluid">
      <div class="row">
      
	<jsp:include page="adminAside.jsp" />
	<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
	<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
            <h1 class="h2">공지사항 관리</h1>
            
          </div>
	
	<div class="my-4 w-100" id="myChart" width="900" height="380" >
	
	<button onclick="location='nboardListAll.kh'">이전으로</button>
	
	<!--  width="1000" -->
	<table align="center" border="1" cellspacing="0" width="800" id="tb" class="tablesorter">
	
	
	<tr>
			<th><input type="checkbox" name="checkAll" id="th_checkAll"/></th>
			<th>번호</th>
			<th>제목</th>
			<th>날짜</th>
			<th>조회수</th>
			<th>status</th>
		</tr>
	
		
		 <c:forEach var="n" items="${ list }">
	
		<tr>
			<td><input type="checkbox" name="chBox" class="chBox" value="${n.nNo}" /></td>
			<td align="center">${ n.nNo }</td>
				
			<td align="center">	${ n.pnoticeTitle }</td>
			
			
			<td align="center">${ n.pnoticeCreateDate }</td>
			
			<td align="center">${ n.pnoticeViewCount }</td>
			<td align="center">${ n.pnoticeStatus }</td>
		</tr>
			
		</c:forEach>
		
		
		
		
		<!-- 페이징 처리 -->
		<tr align="center" height="20">
			<td colspan="6">
			
				<!-- [이전] -->
				<c:if test="${ pi.currentPage <= 1 }">
					[이전] &nbsp;
				</c:if>
				<c:if test="${ pi.currentPage > 1 }">
					<c:url var="before" value="nboardListN.kh">
						<c:param name="page" value="${ pi.currentPage - 1 }"/>
					</c:url>
					<a href="${ before }">[이전]</a> &nbsp;
				</c:if>
				
				<!-- 페이지 -->
				<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
					<c:if test="${ p eq currentPage }">
						<font color="red" size="4"><b>[${ p }]</b></font>
					</c:if>
					
					<c:if test="${ p ne currentPage }">
						<c:url var="pagination" value="nboardListN.kh">
							<c:param name="page" value="${ p }"/>
						</c:url>
						<a href="${ pagination }">${ p }</a> &nbsp;
					</c:if>
				</c:forEach>
				
				<!-- [다음] -->
				<c:if test="${ pi.currentPage >= pi.maxPage }">
					[다음]
				</c:if>
				<c:if test="${ pi.currentPage < pi.maxPage }">
					<c:url var="after" value="nboardListN.kh">
						<c:param name="page" value="${ pi.currentPage + 1 }"/>
					</c:url> 
					<a href="${ after }">[다음]</a>
				</c:if>
			</td>
			
		</tr>
	
		</table>
		
   
		
		
		<!-------------- 게시물 검색하기 --------------->
	<div id="searchArea" align="center">
		<form action="nsearch.kh" name="searchForm" method="get">
			
			<select id="searchCondition" name="searchCondition">
				<option value="all" <c:if test="${search.searchCondition == 'all'}">selected</c:if> >전체</option>
				<option value="title" <c:if test="${search.searchCondition == 'title'}">selected</c:if> >제목</option>
				<option value="content" <c:if test="${search.searchCondition == 'content'}">selected</c:if> >내용</option>
			</select>
			
			<input type="search" name="searchValue" value="${search.searchValue}">
			<button>검색</button><br>
			첨부파일 있는 게시물만
			<input type="checkbox" name="existFile" <c:if test="${!empty search.existFile }">checked</c:if> >
			
		</form>
	</div>
		
	</div>
	
	<p align="center">
		<c:url var="home" value="admin.kh"/>
		<a href="${ home }">시작 페이지로 이동</a> &nbsp;
		<c:url var="blist" value="nboardList.kh"/>
		<a href="${ blist }">목록 전체 보기</a>
	</p>
	<br><br><br><br><br><br><br><br><br><br><br><br>
	
	<button id="reviveBtn">선택복구</button> 
	
	


	
	
	<script>
	
	
	
	$(function(){
		
		
		
	
			$("#th_checkAll").on("change",function(){
			if($(this).prop("checked")){
				$("input[name='chBox']").prop("checked",true);				
			}else{
				$("input[name='chBox']").prop("checked",false);				
				
			}
			});
			
			
			$("#reviveBtn").on("click",function(){
				var checkArray= new Array();
				if(window.confirm("정말 복구하시겠습니까?")){
					$("input[name='chBox']:checked").each(function(){
						checkArray.push($(this).val());
					});
					console.log(checkArray);
					$.ajax({
						url:"reviveNBoard.kh",
						data:{checkArray:checkArray},
						type:"post",
						success:function(result){
							console.log(result);
						}
						
					});
				}
			});
			
			
	});
	
	
	
	
	</script>
	
	
	
	
	
</body>
</html>