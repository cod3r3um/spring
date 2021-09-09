<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/views/includes/header.jsp"%>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Forms</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">

			<div class="panel-heading">Board Register</div>
			<div class="panel-body">

				<div class="row">
					<div class="col-lg-6">

						<form role="form" method="post" action="register" id="frm">
							<div class="form-group" action="register" method="post">
								<label>Title</label> <input class="form-control" name='title'
									placeholder="Enter title">
							</div>

							<div class="form-group">
								<label>Text area</label>
								<textarea class="form-control" row="3" name='content'
									placeholder="Enter text"></textarea>
							</div>

							<div class="form-group">
								<label>Writer</label> <input class="form-control" name='writer'
									placeholder="Enter writer">
							</div>

							<button type="submit" id="btnRegister" class="btn btn-default">Submit</button>
							<button type="reset" class="btn btn-default">Reset</button>

							<div class="row">
								<div class="panel panel-default">
									<div class="panel-heading">File Attach</div>
									<!-- /.panel-heading -->
									<div class="panel-body">
										<div class="form-group uploadDiv">
										</div>
									</div>
								</div>
							</div>
						</form>
						
						<input type="file" name='uploadFile' multiple />
						<button type="button" id="uploadBtn">첨부파일등록</button>
						<ul id="uploaded"></ul>
						
					</div>
					
				</div>

			</div>
			<!-- /.panel-body -->
		</div>
		<!-- /.panel -->
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<!-- jQuery -->
<script	src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>

<script>
	$(function() {
		
		var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");	
		var maxSize = 5242880; //5MB

		function checkExtension(fileName, fileSize) {

			if (fileSize >= maxSize) {
				alert("파일 사이즈 초과");
				return false;
			}

			if (regex.test(fileName)) {
				alert("해당 종류의 파일은 업로드할 수 없습니다.");
				return false;
			}
			return true;
		}
		
		$("#uploadBtn").on("click", function() {
			var formData = new FormData(document.frm);
			var inputFile = $('[name="uploadFile"]');
			var files = inputFile[0].files;
			for(i=0; i<files.length; i++) {
				if(! checkExtension(files[i].name, files[i].size)) {
					return;
				} else {
					formData.append("uploadFile", files[i]);
				}
			}
			$.ajax({
				processData: false,	// formData
				contentType: false,
				url: "../uploadAjaxAction",
				method: "post",
				data: formData,	// 첨부파일을 보낼 때는 폼데이터로 묶어서 보냄
				success: function(datas) {
					var str = "";
					for (i=0; i<datas.length; i++) {
						var obj = datas[i];
						var fileCallPath =  encodeURIComponent( obj.uploadPath+"/"+ obj.uuid +"_"+obj.fileName);			      
					    var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
					      
						str += "<li "
						str += "data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"' ><div>";
						str += "<span> "+ obj.fileName+"</span>";
						str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' " 
						str += "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
						str += "<img src='../resources/img/attach.png'></a>";
						str += "</div>";
						str +"</li>";
					}
					$("#uploaded").html(str);
					alert("uploaded!");
				}
			});
		});
		
		// 등록 버튼 이벤트
		$("#btnRegister").on("click", function() {
			var str = "";
			$("#uploaded li").each(function(i, obj){
			var jobj = $(obj);
			str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
		    str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
		    str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
		    str += "<input type='hidden' name='attachList["+i+"].fileType' value='1'>";	// "+ jobj.data("type")+"
			});
		$("#frm").append(str).submit();
		})
	});
</script>

<%@ include file="/WEB-INF/views/includes/footer.jsp"%>