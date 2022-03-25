<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%@ include file="../includes/header.jsp"%>

<div class="container">
	<button class="btn btn-info btn-bottom-margin" onclick="location.href='/common/personalResList'">개인 예약 목록</button>	
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<p>
						<b>예약 상세조회</b>
						<button type="submit" class="btn btn-danger pull-right cancel_button common_get_res_panel_content_hidden">예약 취소</button>
					</p>
				</div>
				<!-- /.panel-heading -->
				<div class="panel-body common_get_res_panel_content_hidden">
				
					<form role="form" action="/common/cancelRes" method="post">
													
						<div class="form-group">
							<label>예약 번호</label>
							<input class="form-control rid_fix" name="rid" value='<c:out value="${res.rid}"/>' readonly="readonly">
						</div>
						
						<input type="hidden" name="userId" value='<sec:authentication property="principal.username"/>'>
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					
					</form>	
		        						
					<div class="form-group">
						<label>시설명</label>
						<input class="form-control" name='pname' value='<c:out value="${res.pname}"/>' readonly="readonly">
					</div>
					
					<div class="form-group">
						<label>예약자 ID (본인 ID)</label>
						<input class="form-control" name='userId' value='<c:out value="${res.userId}"/>' readonly="readonly">
					</div>
					
					<div class="form-group">
						<label>예약일</label>
						<input class="form-control reg_date_fix" name='resDate' value='<c:out value="${res.resDate}"/>' readonly="readonly">
					</div>
					
					<div class="form-group">
						<label>예약 시간</label>
						<input class="form-control" name='resTime' value='<c:out value="${res.startHour} : ${res.startMinute} ~ ${res.finishHour} : ${res.finishMinute}"/>' readonly="readonly">
					</div>
					
					<div class="form-group">
		     			<div class="cus-readonly-cycle-form-group">
		     				<label>팀 번호</label>
		     				&nbsp;&nbsp;
		     				<label>:</label>
		     				&nbsp;&nbsp;
		     				<input class="team_fix" value='<c:out value="${res.team}"/>' size="2" maxlength="1" readonly="readonly">
							<label>팀</label>
							<br>
		     			</div>
		     		</div>
					
					<div class="form-group">
						<label>예약 신청 시간</label>
						<input class="form-control" name='regDateTime' value='<c:out value="${res.regDateTime}"/>' readonly="readonly">
					</div>							          		
	
				</div>
				<!--  end panel-body -->
				
				<div class="panel-body common_get_res_panel_content_display">
					삭제 등의 이유로 존재하지 않는 예약입니다.
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

<script>

	var formObj = $("form");

	$(document).ready(function() {
		
		var rid = $('.rid_fix').val();
		
		if(rid == '') {
			$('.common_get_res_panel_content_hidden').css('display', 'none');
			$('.common_get_res_panel_content_display').css('display', 'block');
		}
					
		$('.cancel_button').on("click", function(e){
		    
			if(confirm("정말 예약을 취소하시겠습니까?") == true) {			
				e.preventDefault();  			 
				formObj.submit();				
			}
			else return;

		
		});
		
		// When regDate <= today, Can not use cancel button
		
		var today = new Date();		
		var todayYear = today.getFullYear();
		var todayMonth = today.getMonth() + 1;
		var todayDay = today.getDate();		
		
		var reg = $('.reg_date_fix').val();		
		var regYear = Number(reg.split("-")[0]);
		var regMonth = Number(reg.split("-")[1]);
		var regDay = Number(reg.split("-")[2]);
		
		if(todayYear > regYear) $('.cancel_button').css('display', 'none');
		else if(todayYear == regYear) {
			
			if(todayMonth > regMonth) $('.cancel_button').css('display', 'none');
			else if(todayMonth == regMonth) {
				
				if(todayDay >= regDay) $('.cancel_button').css('display', 'none');
				else $('.cancel_button').css('display', 'block');
				
			}
			else $('.cancel_button').css('display', 'block');
			
		}
		else $('.cancel_button').css('display', 'block');
		
	});
		
</script>

<%@include file="../includes/footer.jsp"%>