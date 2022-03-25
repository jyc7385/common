<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../includes/header.jsp" %>

<div class="container">
	<button class="btn btn-info btn-bottom-margin" onclick="location.href='/common/list'">목록</button>
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">
						<b>계정 정보</b>
				</div>
				<div class="panel-body">
					<form role="form" method='post' action="/logout">
						<fieldset>
							<a class="btn btn-lg btn-warning btn-block logout_btn">로그아웃</a>
						</fieldset>
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					</form>
											
				</div>
			</div>
		</div>
	</div>
</div>

 	
<script>

	var formObj = $("form");

	$(".logout_btn").on("click", function(e){
		
		e.preventDefault();
		$("form").submit();
		
	});
	
</script>  

<%@include file="../includes/footer.jsp"%>
