<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../includes/header.jsp"%>

<div class="container">
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<p>
						<b>예약자 정보 조회</b>
					</p>
				</div>
				<!-- /.panel-heading -->
				<div class="panel-body user_get_panel_content_hidden">
									
					<div class="form-group">
						<label>예약자 ID</label>
						<input class="form-control" name='pid' value='<c:out value="${mem.id}"/>' readonly="readonly">
					</div>
										        						
					<div class="form-group">
						<label>예약자 성명</label>
						<input class="form-control" name='name' value='<c:out value="${mem.name}"/>' readonly="readonly">
					</div>
												
					<div class="form-group">
						<label>예약자 생년월일</label>
						<input class="form-control" name='birthDate' value='<c:out value="${mem.birthDate}"/>' readonly="readonly">
					</div>
						
					<div class="form-group">
						<label>예약자 연락처</label>
						<input class="form-control" name='phoneNumber' value='<c:out value="${mem.phoneNumber}"/>' readonly="readonly">
					</div>
						
					<div class="form-group">
						<label>예약자 이메일</label>
						<input class="form-control" name='email' value='<c:out value="${mem.email}"/>' readonly="readonly">
					</div>
						
					<div class="form-group">
						<label>예약자 주소</label>
						<textarea class="form-control" name="address" rows="2" style="resize: none;" readonly="readonly"><c:out value="${mem.address}"/></textarea>
					</div>
								          		
				</div>
				<!--  end panel-body -->
								
			</div>
			<!--  end panel-body -->
		</div>
		<!-- end panel -->
	</div>
	<!-- /.row -->
</div>	
<!-- /.container -->

<%@include file="../includes/footer.jsp"%>