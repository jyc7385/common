<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%@ include file="../includes/header.jsp" %>

<div class="container">
	<button class="btn btn-info btn-bottom-margin list_btn" onclick="location.href='/common/list'">목록</button>		
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">
			
					<b>시설 예약 조회/신청</b>
																
				</div>
				<!-- /.panel-heading -->
						
				<div class="panel-body">
				
					<form id='actionForm' action="/common/resList" method='get'>
				
						<div class="form-group">
						
							<label>시설명</label>
							&nbsp;&nbsp;
							<label>:</label>
							&nbsp;&nbsp;
							<label><c:out value="${place.name}" /></label>
							
							<br>
							
							<label>예약 주기</label>
							&nbsp;&nbsp;
							<label>:</label>
							&nbsp;&nbsp;
							<label><c:out value="${place.reRegCycle}" /> 일</label>
							
							<br>
							
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
								<th style='text-align: center'>팀</th>
								<th style='text-align: center'>예약 가능 여부</th>
								<th style='text-align: center'>시작 시간</th>
								<th style='text-align: center'>종료 시간</th>
							</tr>
						</thead>						
						
						<c:forEach items="${res}" var="res">
							<tr>
								<td style='text-align: center'>
									<c:out value="${res.team}" />
								</td>
								<td style='text-align: center'>									
									<c:choose>
										<c:when test="${empty res.userId}">
											<a class="apply_button" href='#' data-rid='<c:out value="${res.rid}" />' data-pid='<c:out value="${res.pid}" />' data-res-date='<c:out value="${res.resDate}" />' data-user-id='<c:out value="${res.userId}" />'>
												예약 가능
											</a>
										</c:when>
										<c:otherwise>
											<div style='color: red'>
												예약 불가능
											</div>
										</c:otherwise>
									</c:choose>	
									
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
						
					<form id='user_apply_form' action="/common/applyRes" method='post'>	
						<input type="hidden" name='pid' value='<c:out value="${place.pid}" />'>
						<input type="hidden" name='resDate' value='<c:out value="${resDate}" />'>
						<input type="hidden" name='userId' value='<sec:authentication property="principal.username" />'>
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					</form>
				
					<form id='moveForm' method='get'>
					</form>
						
					<input type="hidden" class="csrf_token" value = "${_csrf.token}" />
	          		<input type="hidden" class="csrf_header" value = "${_csrf.headerName}" />
					<input type="hidden" class="form-control user-id-fix" name='userId' value='<sec:authentication property="principal.username" />'>
					<input type="hidden" class="csrf_token re-reg-cycle-fix" value = '<c:out value="${place.reRegCycle}" />' />
																								
				</div>
				<!--  end panel-body -->
			</div>
			<!-- end panel -->
		</div>
	</div>
	<!-- /.row -->
</div>
<!-- /.container -->

<script>
	
	$(document).ready(function(){
				
		var moveForm = $("#moveForm");
		
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
		
		$(".selected_date").attr("min", todayDate);
		$(".selected_date").attr("max", maxDate);
		
		// Apply for a reservation
		
		var token = $('.csrf_token').val();
		var header = $('.csrf_header').val();
		
		$('.apply_button').click(function() {			
			
			var rid = $(this).attr("data-rid");
			var pid = $(this).attr("data-pid");
			var resDate = $(this).attr("data-res-date");
			var userId = $(".user-id-fix").val();
			var reRegCycle = $(".re-reg-cycle-fix").val();
				
			var resDateYear = Number(resDate.split("-")[0]);
			var resDateMonth = Number(resDate.split("-")[1]);
			var resDateDay = Number(resDate.split("-")[2]);
			
			var startDate = new Date(resDateYear, resDateMonth - 1, resDateDay);
			var finishDate = new Date(resDateYear, resDateMonth - 1, resDateDay);
			
			startDate.setDate(startDate.getDate() - (reRegCycle - 1));
			finishDate.setDate(finishDate.getDate() + (reRegCycle - 1));
			
			startDateYear = String(startDate.getFullYear());
			startDateMonth = String(startDate.getMonth() + 1);
			startDateDay = String(startDate.getDate());
			
			if(startDateMonth < 10) startDateMonth = "0" + startDateMonth;
			if(startDateDay < 10) startDateDay = "0" + startDateDay;
			
			var startDate = startDateYear + "-" + startDateMonth + "-" + startDateDay;
			
			finishDateYear = String(finishDate.getFullYear());
			finishDateMonth = String(finishDate.getMonth() + 1);
			finishDateDay = String(finishDate.getDate());
			
			if(finishDateMonth < 10) finishDateMonth = "0" + finishDateMonth;
			if(finishDateDay < 10) finishDateDay = "0" + finishDateDay;
			
			var finishDate = finishDateYear + "-" + finishDateMonth + "-" + finishDateDay;
			
			var data = { "startDate" : startDate,
						"finishDate" : finishDate,
						"userId" : userId,
						"pid" : pid };
			
			$.ajax({
				
				headers : { 
			        'Accept': 'application/json',
			        'Content-Type': 'application/json' 
			    },
				type : "POST",
				url : "/common/checkRes",
				dataType : 'text',
				data : JSON.stringify(data),
				beforeSend : function(xhr) {				
					xhr.setRequestHeader(header, token);					
				},
				success : function(result){
					
					if(result != "fail") {
												
						if(confirm("예약하시겠습니까?") == true) {						
							$("#user_apply_form").append("<input type='hidden' name='rid' value='" + rid + "'>");
							$("#user_apply_form").append("<input type='hidden' name='regDateTime' value='" + new Date().toLocaleString() + "'>");
							$("#user_apply_form").submit();							
						}
						else return;
						
					}
					else {					
						alert("예약할 수 없습니다.\n해당 시설의 예약 주기와 개인 예약 기록을 확인하세요.");
						return;						
					}
					
				}
				
			});
			
		});
		
	});
	
</script>

<%@include file="../includes/footer.jsp"%>


