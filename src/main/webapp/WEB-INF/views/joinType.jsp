<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%@ include file="./includes/header.jsp" %>

<div class="container">
	<button class="btn btn-info btn-bottom-margin" onclick="location.href='/login'">로그인 화면으로</button>
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">
						<b>어떤 형태로 가입하시겠습니까?</b>
				</div>
				<div class="panel-body">
					<a href="/joinUser" class="btn btn-lg btn-success btn-block">일반 사용자 가입</a>
					<br>
					<a href="/joinManager" class="btn btn-lg btn-success btn-block">시설 관리자 가입</a>
				</div>
			</div>
		</div>
	</div>
</div>

<%@include file="./includes/footer.jsp"%>
