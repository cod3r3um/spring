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

						<form role="form" method="post">
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

							<button type="submit" class="btn btn-default">Submit</button>
							<button type="reset" class="btn btn-default">Reset</button>
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