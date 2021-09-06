<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
									value='<c:out value="${board.title}"/>' placeholder="Enter title" />
							</div>
							<div class="form-group">
								<label>Text area</label>
								<textarea class="form-control" rows="3" name='content'><c:out value="${board.content}" /></textarea>
							</div>
							<div class="form-group">
								<label>Writer</label> <input class="form-control" name='writer'
									value='<c:out value="${board.writer}" />' placeholder="Enter writer"/>
							</div>

							<button data-oper='modify' class="btn btn-default">Modify</button>
							<a class="btn btn-success" href="list?pageNum=${cri.pageNum}&amount=${cri.amount}">목록으로</a>
							
							<input type="hidden" name="pageNum" value="${cri.pageNum}">
							<input type="hidden" name="amount" value="${cri.amount}">

						</form>

					</div>
					<!-- /.panel-body -->
				</div>
				<!-- /.panel -->
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->

		<%@ include file="/WEB-INF/views/includes/footer.jsp"%>