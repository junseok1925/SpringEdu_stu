<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
  <jsp:include page="../common/header.jsp"/>
  <h2>@jun_seok1925</h2>
  <div class="panel panel-default">
    <div class="panel-heading">로그인화면</div>
    <div class="panel-body">

   	<form method="post" action="${contextPath}/memLogin.do">
    	<input type="hidden" id="memPassword" name="memPassword" value=""/>
    		<table class="table table-bordered" style="text-align: center; border: 1px solic #dddddd;">
    			<tr>
    				<td style="width: 110px; vertical-align: middle;">아이디</td>
    				<td><input id="memID" name="memID" class="form-control" type="text" maxlength="20" placeholder="아이디를 입력하세요."/></td>
    		 	</tr>
    			<tr>
    				<td style="width: 110px; vertical-align: middle;">비밀번호</td>
    				<td colspan="2"><input id="memPassword1" name="memPassword1" onkeyup="passwordCheck()" class="form-control" type="password" maxlength="20" placeholder="비밀번호를 입력하세요."/></td>
    			</tr>
    			<td colspan="2" style="text-align: left;">
    				<input type="submit" class="btn btn-primary btn-sm pull-right" value="로그인"/>
    				
    			</td>
    			</tr>
    		</table>
    	</form>

    </div>
    <div class="panel-footer">junseok_Spring01</div>
  </div>
</div>

</body>
</html>
