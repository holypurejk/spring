<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.book.model.BookVO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.book.model.BookDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%
	request.setCharacterEncoding("utf-8");

	String searchCondition = request.getParameter("searchCondition");
	String searchKeyword = request.getParameter("searchKeyword");

	//2) 페이징 처리의 경우 파라미터
	//list.jsp?currentPage=2
	String sCurPage = request.getParameter("currentPage");

	//2.
	BookDAO dao = new BookDAO();
	List<BookVO> list = null;
	try {
		list = dao.selectAll(searchCondition, searchKeyword);
	} catch (SQLException e) {
		e.printStackTrace();
	}

	//3.
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

	if (searchKeyword == null)
		searchKeyword = "";

	//페이징 처리 관련 변수
	int currentPage = 1; //현재 페이지 번호
	if (sCurPage != null && !sCurPage.isEmpty()) {
		currentPage = Integer.parseInt(sCurPage);
	}
	int pageSize = 5; //한 페이지에 보여줄 레코드 개수
	int blockSize = 10; //블럭 크기, 1~10
	int totalRecord = list.size(); //전체 레코드 개수-예)17
	int totalPage = (int) (Math.ceil((float) totalRecord / pageSize));
	//=> 전체 페이지 수 , 예)4            20/10

	//현재 페이지를 이용하여 계산하는 변수
	int firstPage = currentPage - ((currentPage - 1) % blockSize);
	//=> 시작 페이지 1,11,21..
	int lastPage = firstPage + (blockSize - 1); //마지막 페이지 10,20,30..
	int curPos = (currentPage - 1) * pageSize;
	//=> ArrayList에서의 시작index 0,5,10,15 ...
	int num = totalRecord - curPos; //페이지당 글 리스트 시작번호
	//예)17,12,7,2
%>
<!DOCTYPE HTML>
<html lang="ko">
<head>
<title>자유게시판 글 목록 - 허브몰</title>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css" href="../css/mainstyle.css" />
<link rel="stylesheet" type="text/css" href="../css/clear.css" />
<link rel="stylesheet" type="text/css" href="../css/formLayout.css" />
<link rel="stylesheet" type="text/css" href="../css/mystyle.css" />

<script type="text/javascript">
	
</script>
<style type="text/css">
body {
	padding: 5px;
	margin: 5px;
}
</style>
</head>
<body>
	<h2>자유게시판</h2>
	<%if(searchKeyword!=null && !searchKeyword.isEmpty()){ %>
	<!-- 검색의 경우 -->
	<p>
		검색어 :
		<%=searchKeyword %>,
		<%=list.size() %>건 검색되었습니다.
	</p>
	<%}else{ %>
	<!-- 전체 조회의 경우 -->
	<p>
		전체 조회 결과,
		<%=list.size() %>건 조회되었습니다.
	</p>
	<%}//if %>

	<div class="divList">
		<table class="box2"
			summary="기본 게시판에 관한 표로써, 번호, 제목, 지은이, 가격, 등록일에 대한 정보를 제공합니다.">
			<caption>기본 게시판</caption>
			<colgroup>
				<col style="width: 10%;" />
				<col style="width: 45%;" />
				<col style="width: 15%;" />
				<col style="width: 15%;" />
				<col style="width: 15%;" />
			</colgroup>
			<thead>
				<tr>
					<th scope="col">번호</th>
					<th scope="col">책 제목</th>
					<th scope="col">지은이</th>
					<th scope="col">가격</th>
					<th scope="col">등록일</th>
				</tr>
			</thead>
			<tbody>
				<%if(list==null || list.isEmpty()){ %>
				<tr>
					<td colspan="5">해당하는 데이터가 없습니다.</td>
				</tr>
				<%}else{ %>
				<!--게시판 내용 반복문 시작  -->
				<%for(int i=0;i<pageSize;i++){
	  		if(num<1) break;
	  		
	  		BookVO vo = list.get(curPos++);		  		
	  	%>
				<tr style="text-align: center">
					<td><%=num-- %></td>
					<td style="text-align: left"><a
						href="detail.jsp?no=<%=vo.getNo()%>"> <%=vo.getTitle() %></a>
					</td>
					<td><%=vo.getPublisher() %></td>
					<td><%=vo.getPrice() %></td>
					<td><%=sdf.format(vo.getJoindate()) %></td>
				</tr>
				<%}//for %>
				<!--반복처리 끝  -->
				<%}//if %>
			</tbody>
		</table>
	</div>
	<div class="divPage">
		<!-- 페이지 번호 추가 -->

		<!-- [1][2][3][4][5][6][7][8][9][10] -->
		<%
	for(int i=firstPage;i<=lastPage;i++){
		if(i>totalPage) break;
		
		if(i==currentPage){ %>
		<span style="font-weight: bold; color: blue"><%=i %></span>
		<%	}else{	%>
		<a href="list.jsp?currentPage=<%=i%>">[<%=i %>]
		</a>
		<%		}//if
	}//for	%>

		<!--  페이지 번호 끝 -->
	</div>
	<div class="divSearch">
		<form name="frmSearch" method="post" action='list.jsp'>
			<select name="searchCondition">
				<option value="title" <%if("title".equals(searchCondition)){ %>
					selected <%} %>>책 제목</option>
				<option value="publisher" <%if("publisher".equals(searchCondition)){ %>
					selected <%} %>>지은이</option>
			</select> <input type="text" name="searchKeyword" title="검색어 입력"
				value="<%=searchKeyword %>"> <input type="submit" value="검색">
		</form>
	</div>

	<div class="divBtn">
		<a href='write.jsp'>글쓰기</a>
	</div>

</body>
</html>

