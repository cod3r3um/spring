<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<style>
	.require {
		color: red;
	}
	.emp {
		cursor: pointer;
	}
	.emp: hover {
		color: blue;
	}
</style>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>

<script>
$(function() {
	function validation(){
		if(frm.lastName.value == "" ) {
			alert("이름을 입력하세요.");
			frm.lastName.focus();
			return false;
		}
		return true;
	}
	
	// 등록 버튼
	$("#btnRegister").on("click", function(){
		if(validation()) {
			frm.submit();
		}
	})
	
	// 매니저 검색
	$("#btnEmpSearch").on("click", function(){
		// 검색 페이지를 ajax로 가져옴 -> 모달 바디에 넣음 -> 모달을 띄움
		$.ajax({
			url: "empSearch",
			success: function(data){
				$("#empModal .modal-body").html(data);
				$('#empModal').modal('show');
			}
		});
	});
	
	// 매니저 단건검색
	$("#managerId").on("keydown", function(e){
		$('name').val("");
		if( $("#managerId").val() == "")
			return;
		if(e.keyCode == 13) {
			e.preventDefault();
		}
		$.ajax({
			url: "ajaxEmp",
			data: { employeeId : $("#managerId").val() },
			success: function(data){
				if(data) {
					$("#name").val(data.lastName)
				} else {
					$("#btnEmpSearch").click();
				}
			}
		});
	});
	
	document.
	
});
</script>

<h1> 사원등록이니? </h1>
<form name="frm" action="${not empty emp ? 'updateEmp' : 'insertEmp'}" method="post">
	<c:if test="${not empty emp}">
		<input name="employeeId" value="${emp.employeeId}">
	</c:if>
	First Name<span class="require">*</span><input name="firstName" value="${emp.firstName}"><br>
	Last Name<input name="lastName"><br>
	Email<span class="require">*</span><input name="email" value="${emp.email}"><span id="result"></span><br>
	Phone Number<input name="phoneNumber" value="${emp.phoneNumber}"><br>
	Hire Date<span class="require">*</span><input name="hireDate" value="${emp.hireDate}"><br>
	Job Id<span class="require">*</span><select name="jobId">
 		 	<option value="">선택이니?</option>
 		 	<c:forEach items="${opt.jobs}" var="job">
 		 		<option value="${job.jobId}">${job.jobTitle}</option>
 		 	</c:forEach>
 		 </select><br>
	Salary<input name="salary"><br>
	Commission Pct<input name="commissionPct" value="${emp.commissionPct}"><br>
	Manager Id<input name="managerId" id="managerId" value="${emp.managerId}"><input id="name">
	<button type="button" class="btn btn-primary" id="btnEmpSearch">검색이니?</button><br>
	Department Id<select name="departmentId">
					<option value="">선택이니?</option>
					<c:forEach items="${opt.dept}" var="dept">
						<option value="${dept.departmentId}">${dept.departmentName}</option>
					</c:forEach>
				</select><br>
	<button type="button" id="btnRegister">등록</button>

</form>

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
        <p>모달이니?</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기니?</button>
        <button type="button" class="btn btn-primary">저장이니?</button>
      </div>
    </div>
  </div>
</div>
