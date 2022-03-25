<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%@ include file="../includes/header.jsp" %>

<div class="container">
	<button class="btn btn-info btn-bottom-margin list_btn" onclick="location.href='/common/list'">전체 목록</button>		
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">
			
					<b>개인 예약 목록</b>
																
				</div>
				<!-- /.panel-heading -->
						
				<div class="panel-body">

					<table class="table table-striped table-bordered table-hover">						
						
						<thead>
							<tr>
								<th style='text-align: center'>예약 번호</th>
								<th style='text-align: center'>예약 정보</th>
							</tr>
						</thead>
						
						<c:forEach items="${res}" var="res">
							<tr>
								<td style='text-align: center; vertical-align: middle'>														
									<a class="user_get_res" href='<c:out value="${res.rid}" />'>
										<c:out value="${res.rid}" />			
									</a>
								</td>
								<td style='text-align: center'>									
									<c:out value="${res.pname}" />													
									
									<br>
									
									<c:out value="${res.resDate}" />				
									&nbsp;								
									<c:out value="${res.startHour}" /> : <c:out value="${res.startMinute}" /> ~
									<c:out value="${res.finishHour}" /> : <c:out value="${res.finishMinute}" />
									&nbsp;
									<c:out value="${res.team}" />팀
								</td>
							</tr>
						</c:forEach>
												
					</table>
				
					<form id='moveForm' method='get'></form>
																			
				</div>
				<!--  end panel-body -->
			</div>
			<!-- end panel -->
		</div>
	</div>
	<!-- /.row -->
</div>
<!-- /.container -->

<script type="text/javascript">
	
	$(document).ready(function(){
		
		var actionForm = $("#moveForm");
		
		$(".user_get_res").on("click",function(e) {		
			e.preventDefault();
			actionForm.append("<input type='hidden' name='rid' value='" + $(this).attr("href") + "'>");
			actionForm.attr("action", "/common/getRes");
			actionForm.submit();			
		});	
		
	});
	
</script>

<%@include file="../includes/footer.jsp"%>


