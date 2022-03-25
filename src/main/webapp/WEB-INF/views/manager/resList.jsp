<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../includes/header.jsp" %>

<div class="container">
	<button class="btn btn-info btn-bottom-margin list_btn" onclick="location.href='/manager/list'">목록</button>		
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">
			
					<b>시설 예약 목록</b>
					
					<div class="btn-group pull-right" style="margin-top:-8px;">
						<button type="button" class="btn btn-info reg_btn" data-pid='<c:out value="${place.pid}" />'>예악 추가</button>
					</div>
																
				</div>
				<!-- /.panel-heading -->
						
				<div class="panel-body">
				
					<form id='actionForm' action="/manager/resList" method='get'>
				
						<div class="form-group">
							<label>날짜 선택</label>
							&nbsp;&nbsp;
							<label>:</label>
							&nbsp;&nbsp;				
							<input type='date' class="selected_date" name='resDate'>
							<input type="hidden" name="pid" value='<c:out value="${place.pid}" />' />
						</div>
					
						<div class="form-group text-right">
							<button class='btn btn-default add_btn'>검색</button>	
						</div>
					
					</form>
										
					<hr>
					
					<label>
						선택 날짜
						&nbsp;&nbsp;
						:
						&nbsp;&nbsp;	
						<c:out value="${resDate}" />
					</label>
					
					<table class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th style='text-align: center'>예약 번호</th>
								<th style='text-align: center'>팀</th>
								<th style='text-align: center'>예약자 ID</th>
								<th style='text-align: center'>시작 시간</th>
								<th style='text-align: center'>종료 시간</th>
							</tr>
						</thead>						
						
						<c:forEach items="${res}" var="res">
							<tr>
								<td style='text-align: center'>
									<a class="manager_get_res" href='<c:out value="${res.rid}" />'>
										<c:out value="${res.rid}" />
									</a>	
								</td>
								<td style='text-align: center'>
									<c:out value="${res.team}" />
								</td>
								<td style='text-align: center'>
									<a class="manager_get_user_info" href='<c:out value="${res.userId}" />'>
										<c:out value="${res.userId}" />
									</a>
								</td>
								<td style='text-align: center'>
									<c:out value="${res.startHour}" /> : <c:out value="${res.startMinute}" />
								</td>
								<td style='text-align: center'>
									<c:out value="${res.finishHour}" /> : <c:out value="${res.finishMinute}" />
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
				
		var moveForm = $("#moveForm");
		
		$(".reg_btn").on("click",function(e) {
			e.preventDefault();
			moveForm.append("<input type='hidden' name='pid' value='" + $(this).attr("data-pid") + "'>");
			moveForm.attr("action", "/manager/resRegister");
			moveForm.submit();
		});
		
		$(".manager_get_res").on("click",function(e) {
			e.preventDefault();
			moveForm.append("<input type='hidden' name='rid' value='" + $(this).attr("href") + "'>");
			moveForm.attr("action", "/manager/getRes");
			moveForm.submit();
		});
		
		$(".manager_get_user_info").on("click",function(e) {
			e.preventDefault();
			window.open("/manager/getUserInfo?id=" + $(this).attr("href"), "", width=800, height=556);
		});
		
		// Set max and min date
		
		var today = new Date();		
		var todayYear = today.getFullYear();
		var todayMonth = today.getMonth() + 1;
		var todayDay = today.getDate();
		
		if(todayMonth < 10) todayMonth = "0" + todayMonth;
		if(todayDay < 10) todayDay = "0" + todayDay;
		
		var todayDate = todayYear + "-" + todayMonth + "-" + todayDay;
		
		var max = new Date();
		max.setDate(max.getDate() + 28);
		var maxYear = max.getFullYear();
		var maxMonth = max.getMonth() + 1;
		var maxDay = max.getDate();
		
		if(maxMonth < 10) maxMonth = "0" + maxMonth;
		if(maxDay < 10) maxDay = "0" + maxDay;
		
		var maxDate = maxYear + "-" + maxMonth + "-" + maxDay;
		
		$(".selected_date").attr("max", maxDate);
		
	});
	
</script>

<%@include file="../includes/footer.jsp"%>


