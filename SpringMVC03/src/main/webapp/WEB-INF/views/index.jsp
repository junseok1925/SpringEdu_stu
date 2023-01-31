<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script type="text/javascript">
  $(document).ready(function() {
      if(${!empty msgType}){
            $("#messageType").attr("class","modal-content panel-success");
            $("#myMessage").modal("show");
      }
  });
  </script>
</head>
<body>
	<div class="container">
	<jsp:include page="common/header.jsp"/>
	
	  <c:if test="${empty mvo}"> <!-- 로그인을 하지않았을때 -->
	  <h3>준석이의 스프링으로 웹사이트구현하기</h3>
	  </c:if>
	   <c:if test="${!empty mvo}"> <!-- 로그인을 하지않았을때 -->
	  <h3>[사진]${mvo.memName}님 방문을 환영합니다.</h3>
	  </c:if>
	  
	  <p>In this example, the navigation bar is hidden on small screens and replaced by a button in the top right corner (try to re-size this window).
	  <p>jun_seok1925 게시판,로그인,회원가입구현하기</p>
	</div>
	
			<!-- 회원가입성공 메세지를 출력(modal) -->
		<div id="myMessage" class="modal fade" role="dialog">
		  <div class="modal-dialog">
		    <!-- Modal content-->
		    <div id="messageType" class="modal-content panel-info">
		      <div class="modal-header panel-heading">
		        <button type="button" class="close" data-dismiss="modal">&times;</button>
		        <h4 class="modal-title">${msgType}</h4>
		      </div>
		      <div class="modal-body">
		        <p>${msg}</p>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		      </div>
		    </div>
		  </div>
		</div>
	
</body>
</html>
