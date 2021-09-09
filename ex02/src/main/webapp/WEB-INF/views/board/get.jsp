<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="/WEB-INF/views/includes/header.jsp"%>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">게시글 상세보기와 수정이니?</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">

			<div class="panel-heading">Board Read Page</div>
			<div class="panel-body">

				<div class="row">
					<div class="col-lg-6">

						<form role="form" action="modify" method="post">

							<div class="form-group">
								<label>Bno</label> <input class="form-control" name='bno'
									value='<c:out value="${board.bno}" />' readonly="readonly">
							</div>
							<div class="form-group">
								<label>Title</label> <input class="form-control" name='title'
									value='<c:out value="${board.title}"/>'
									placeholder="Enter title" />
							</div>
							<div class="form-group">
								<label>Text area</label>
								<textarea class="form-control" rows="3" name='content'><c:out
										value="${board.content}" /></textarea>
							</div>
							<div class="form-group">
								<label>Writer</label> <input class="form-control" name='writer'
									value='<c:out value="${board.writer}" />'
									placeholder="Enter writer" />
							</div>

							<button data-oper='modify' class="btn btn-default">수정이</button>
							<a class="btn btn-success"
								href="list?pageNum=${cri.pageNum}&amount=${cri.amount}">목록으로</a>

							<input type="hidden" name="pageNum" value="${cri.pageNum}">
							<input type="hidden" name="amount" value="${cri.amount}">

						</form>
						<!-- 첨부파일 -->
						<div>
							<c:forEach items="${board.attachList}" var="attach">
								<a href="download?uuid=${attach.uuid}">${attach.fileName}</a>
							</c:forEach>
						</div>
					</div>
					
					<!-- 댓글 등록 -->
					<div>
						<form id="replyForm">
							<input type="hidden" name="bno" value="${board.bno}"> 
								<input name="replyer" value="papaya"> 
								<input name="reply">
							<button type="button" id="saveReply">comment</button>
						</form>
					</div>
					<!-- 댓글 목록 -->
					<div>
						<div class="panel-footer">댓글</div>
						<div>
							<ul class="chat"></ul>
						</div>
						<div ></div>
					</div>
					
					<script>
						let bno = "${board.bno}";
						// 등록 처리
						$("#saveReply").on("click", function() {
							$.ajax({
								url : "../reply/",
								method : "post",
								data : $("#replyForm").serialize(),
								dataType : "json",
								success : str = function(data) {
									$(".chat").append(makeLi(data));
								}
							});
						});

						function makeLi(data) {
							return '<li class="left clearfix">' + '<div>'
									+ '<div class="header">'
									+ '<strong class="primary-font">'
									+ data.replyer + '</strong>'
									+ '<small class="pull-right text-muted">'
									+ data.replyDate + '</small>' + '</div>'
									+ '<p>' + data.reply + '</p>' 
									+ '<button type="button" class="btnreplyUpdate">수정</button>'
									+ '<button type="button" class="btnreplyDelete">삭제</button>'
									+ '</div>'
									+ '</li>';
						}

						// 목록 조회
						$.ajax({
							url : "../reply/", // method: "get"
							data : {
								bno : bno
							}, // "bno=186"
							dataType : "json", // 응답결과: json
							success : function(datas) {
								// console.log(datas);
								str = "";
								for (i = 0; i < datas.list.length; i++) {
									console.log(datas);
									str += makeLi(datas.list[i]);
								}
								$(".chat").html(str);
							}
						});
						
					</script>
				</div>
				<!-- /.panel-body -->
			</div>
			<!-- /.panel -->
		</div>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<%@ include file="/WEB-INF/views/includes/footer.jsp"%>