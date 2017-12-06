<%@page import="com.book.model.BookVO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.book.model.BookDAO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%

	String no =request.getParameter("no");
	if(no==null || no.isEmpty()){%>
		<script type="text/javascript">
			alert("잘못된 url입니다");
			location.href="list.jsp";
		</script>	
		
	<%return;
	}
	
	//2.
	BookDAO dao = new BookDAO();
	BookVO vo=null;
	try{
		vo=dao.selectByNo(Integer.parseInt(no));	
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	//3.
	/* String content = vo.getContent();
	if(content==null) content="";
	
	String email=vo.getEmail();
	if(email==null) email=""; */
%>
    
<!DOCTYPE html>
<html lang="ko">
<head>
<title>자유게시판 글 수정 - 허브몰</title>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css" href="../css/mainstyle.css" />
<link rel="stylesheet" type="text/css" href="../css/clear.css" />
<link rel="stylesheet" type="text/css" href="../css/formLayout.css" />
<link rel="stylesheet" type="text/css" href="../css/mystyle.css" />

<script type="text/javascript">
	function send(form){		
		if(form.title.value==""){
			alert("제목을 입력하세요");
			form.title.focus();
			return false;
		}else if(form.name.value.length<1){
			alert("지은이를 입력하세요");
			form.name.focus();
			return false;			
		}else if(!form.price.value){
			alert("가격을 입력하세요");
			form.price.focus();
			return false;			
		}
		
		return true;		
	}
</script>
</head>
<body>
	<div class="divForm">
<form name="frmEdit" method="post" action="edit_ok.jsp"
	onsubmit="return send(this)"> 
	<!-- 수정 처리시 필요한 no를 hidden 필드에 넣는다 -->
	<input type="hidden" name="no" value="<%=no%>">
	
    <fieldset>
	<legend>책 내용 수정</legend>
        <div class="firstDiv">
            <label for="title">제목</label>
            <input type="text" id="title" name="title" 
            	value="<%=vo.getTitle() %>" />
        </div>
        <div>
            <label for="publisher">지은이</label>
            <input type="text" id="publisher" name="publisher" />
        </div>
        <div>
            <label for="price">가격</label>
            <input type="text" id="price" name="price"/>
        </div>
        <div class="center">
            <input type = "submit" value="수정"/>
            <input type = "Button" value="목록" onclick="location.href	='list.jsp'" />         
        </div>
	</fieldset>
</form>    
</div>
</body>
</html>