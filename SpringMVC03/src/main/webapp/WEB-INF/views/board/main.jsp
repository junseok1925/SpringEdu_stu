<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>πνμκ²μνπ</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script type="text/javascript">
  	$(document).ready(function(){
  		loadList();
  	});
	
  	function loadList() {
		// μλ²μ ν΅μ  : κ²μν λ¦¬μ€νΈ κ°μ Έμ€κΈ°
			$.ajax({
				url : "board/all",
				type : "get",
				dataType : "json",
				success : makeView,
				error : function() { alert("error"); }
			});
	}
  	function makeView(data) { // data[{ },{ },{ },,,]
        var listHtml="<table class='table table-bordered'>";
        listHtml+="<tr>";
        listHtml+="<td>λ²νΈ</td>";
        listHtml+="<td>μ λͺ©</td>";
        listHtml+="<td>μμ±μ</td>";
        listHtml+="<td>μμ±μΌ</td>";
        listHtml+="<td>μ‘°νμ</td>";
        listHtml+="</tr>";
       $.each(data,function(index,obj){ // obj={"idx":5,"title:","κ²μν"~~}
            listHtml+="<tr>";
            listHtml+="<td>"+ obj.idx +"</td>";
            listHtml+="<td id='t"+obj.idx+"'><a href='javascript:goContent("+obj.idx+")'>"+ obj.title +"</a></td>";
            listHtml+="<td>"+ obj.writer +"</td>";
            listHtml+="<td>"+ obj.indate.split(' ')[0] +"</td>";
            listHtml+="<td id='cnt"+obj.idx+"'>"+ obj.count+ "</td>";
            listHtml+="</tr>";
            
            listHtml+="<tr id='c"+ obj.idx +"' style='display:none'>";
            listHtml+="<td>λ΄μ©</td>";
            listHtml+="<td colspan='4'>";
            listHtml+="<textarea id='ta"+ obj.idx +"' readonly rows='7' class='form-control'></textarea>";
            if("${mvo.memID}" == obj.memID){ //μμ±μ μμ΄λκ° κ°μμΌμ§ μμ ,μμ  κ°λ₯
            listHtml+="<br/>";
            listHtml+="<span id='ub"+obj.idx+"'><button class='btn btn-success btn-sm' onclick='goUpdateForm("+obj.idx+")'>μμ νλ©΄</button></span>&nbsp";
            listHtml+="<button class='btn btn-warning btn-sm' onclick='goDelete("+obj.idx+")'>μ­μ </button>";
            }else{
            listHtml+="<br/>";
            listHtml+="<span id='ub"+obj.idx+"'><button disabled class='btn btn-success btn-sm' onclick='goUpdateForm("+obj.idx+")'>μμ νλ©΄</button></span>&nbsp";
            listHtml+="<button disabled class='btn btn-warning btn-sm' onclick='goDelete("+obj.idx+")'>μ­μ </button>";	
            }
            listHtml+="</td>";
            listHtml+="</tr>";
            
       });
       //λ‘κ·ΈμΈμ ν΄μΌ λ³΄μ΄λ λΆλΆ
       if(${!empty mvo}){
        listHtml+="<tr>";
    	listHtml+="<td colspan='5'>";
    	listHtml+="<button class='btn btn-primary btn-sm' onclick='goForm()'>κΈμ°κΈ°</button>";
    	listHtml+="</td>";
    	listHtml+="</tr>";
       }
        listHtml+="</table>";
         $("#view").html(listHtml);
       

      	$("#view").css("display", "block");
 		$("#wform").css("display", "none");
		
	}
       
  	
  	function goForm() {
		$("#view").css("display", "none");
		$("#wform").css("display", "block");
	}
  	
	function goList() {
		$("#view").css("display", "block");
		$("#wform").css("display", "none");
	}
	
	function goInsert() {
	
		
		var fData=$("#frm").serialize();
 		
			$.ajax({
				url : "board/new",
				type : "post",
				data : fData,
				success : loadList,
				error : function() { alert("error"); }
			});
			
		/* $("#title").val("");
		$("#content").val("");
		$("#writer").val(""); */
		$('#fclear').trigger("click");
		
	}
	
	function goContent(idx) {
		if($("#c"+idx).css("display") == "none") {
			
			$.ajax({
				url : "board/"+idx,
				type : "get",
				dataType : "json",
				success : function (data) {
					$("#ta"+idx).val(data.content);
				},
				error : function() { alert("error"); }
			});
			
			$("#c"+idx).css("display", "table-row");
			$("#ta"+idx).attr("readonly", true);
		} else {
			$("#c"+idx).css("display", "none");
			$.ajax({
				url : "board/count/"+idx,
				type : "put",
				dataType : "json",
				success : function (data) {
					$("#cnt"+idx).text(data.count);
				},
				error : function() { alert("error"); }
			});
		}
	}
	
	function goDelete(idx) {
		$.ajax({
			url : "board/"+idx,
			type : "delete",
			data : {"idx" : idx},
			success : loadList,
			error : function() { alert("error"); }
		});
	}
	
	function goUpdateForm(idx) {
		$("#ta"+idx).attr("readonly", false);
		
		var title = $("#t"+idx).text();
		var newInput="<input type='text' id='nt"+idx+"' class='form-control' value='"+title+"'/>"
		$("#t"+idx).html(newInput);
		
		var newBtn="<button class='btn btn-primary btn-sm' onclick='goUpdate("+idx+")'>μμ </button>";
		$("#ub"+idx).html(newBtn);
	}
	
	function goUpdate(idx) {
		var title = $("#nt"+idx).val();
		var content = $("#ta"+idx).val();
		$.ajax({
			url : "board/update",
			type : "put",
			contentType:'application/json;charset=utf-8',
			data : JSON.stringify({"idx" : idx, "title" : title, "content" : content}),
			success : loadList,
			error : function() { alert("error"); }
		});
	}
	
  	
  	</script>
</head>
<body>

<div class="container">
<jsp:include page="../common/header.jsp"/>
  <h2>πνμκ²μνπ</h2>
  <div class="panel panel-default">
    <div class="panel-heading">BOARD</div>
    <div class="panel-body" id="view">νμμ μ©κ²μνμλλ€ λ‘κ·ΈμΈμ ν΄μ£ΌμΈμ.</div>
    <div class="panel-body" id="wform" style="display: none">
    	<form id="frm">
    	<input type="hidden" name="memID" id="memID" value="${mvo.memID}"/> 
	    	   <table class="table">
                  <tr>
                     <td>μ λͺ©</td>
                     <td><input type="text" id="title" name="title" class="form-control" /></td>
                  </tr>
                  
                  <tr>
                     <td>λ΄μ©</td>
                     <td><textarea rows="7" class="form-control" id="content" name="content"></textarea></td>
                  </tr>
                  
                  <tr>
                     <td>μμ±μ</td> 
                     <td><input type="text" id="writer" name="writer" class="form-control" value="${mvo.memName}" readonly="readonly"/></td>
                  </tr>
                  
                  <tr>
                     <td colspan="2" align="center">
                        <button type="button" class="btn btn-success btn-sm" onclick="goInsert()">λ±λ‘</button>
                        <button type="reset" class="btn btn-warning btn-sm" id="fclear">μ·¨μ</button>
                        <button type="button" class="btn btn-info btn-sm" onclick="goList()">λ¦¬μ€νΈ</button>
                     </td>
                  </tr>   
               </table>
    	</form>
    </div>
    <div class="panel-footer">jun_seok1925</div>
  </div>
</div>

</body>
</html>