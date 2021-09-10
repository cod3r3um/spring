<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부서관리</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>

</head>
<body>
	<h3>부서관리</h3>
	<div id="list"></div>
	
	<!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#empModal">
  부서등록이니?
</button>
	
	
	<div class="modal" tabindex="-1" id="empModal">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title">Modal title</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <form>
	        	부서번호<input name="departmentId"><br>
	        	부서명<input name="departmentName"><br>
	        	관리자번호<input name="managerId"><br>
	        	지역번호<input name="locationId"><br>
	        </form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기니?</button>
	        <button type="button" class="btn btn-primary">저장이니?</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	
	<script>
	 $(function(){
		 deptList();
		 
		// 등록
		
		// 수정
		
		// 목록조회
		function deptList() {
			$.ajax({
				url: "deptList",
				dataType: "json",
				success: function(datas){
					$.each(datas, function(i, data){
						$("<div>").append($("<span>").html(data.departmentId))
								  .append($("<span>").html(data.departmentName))
								  .appendTo($("#list"));
					})
				}
			});
		}
	 });
	</script>
	
</body>
</html>