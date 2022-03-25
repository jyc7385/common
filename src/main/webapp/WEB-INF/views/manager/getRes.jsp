<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%@ include file="../includes/header.jsp"%>

<div class="container">
	<button class="btn btn-info btn-bottom-margin list_button" data-pid='<c:out value="${res.pid}" />' data-res-date='<c:out value="${res.resDate}" />'>시설 예약 목록</button>	
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<p>
						<b>예약 상세조회</b>
						<button type="submit" class="btn btn-warning pull-right cancel_button manager_get_res_panel_content_hidden">예약 취소</button>
					</p>
				</div>
				<!-- /.panel-heading -->
				<div class="panel-body manager_get_res_panel_content_hidden">
				
					<form role="form" action="/manager/cancelRes" method="post">
													
						<div class="form-group">
							<label>예약 번호</label>
							<input class="form-control rid_fix" name="rid" value='<c:out value="${res.rid}"/>' readonly="readonly">
						</div>
						
						<input type="hidden" name="mid" value='<sec:authentication property="principal.username"/>'>
						<input type="hidden" name="pid" value='<c:out value="${res.pid}"/>'>
						<input type="hidden" name="resDate" value='<c:out value="${res.resDate}"/>'>
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					
					</form>	
		        						
					<div class="form-group">
						<label>시설명</label>
						<input class="form-control" name='pname' value='<c:out value="${res.pname}"/>' readonly="readonly">
					</div>
					
					<div class="form-group">
						<label>예약자 ID</label>
						<input class="form-control user_id_fix" name='userId' value='<c:out value="${res.userId}"/>' readonly="readonly">
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
						<label>예약 신청 시간</label>
						<input class="form-control" name='regDateTime' value='<c:out value="${res.regDateTime}"/>' readonly="readonly">
					</div>							          		

					
					<button type="submit" class="btn btn-danger pull-right remove_button manager_get_panel_content_hidden">예약 삭제</button>							          		
	
				</div>
				<!--  end panel-body -->
				
				<div class="panel-body manager_get_res_panel_content_display">
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
			$('.manager_get_res_panel_content_hidden').css('display', 'none');
			$('.manager_get_res_panel_content_display').css('display', 'block');
		}
			
		$(".list_button").on("click",function(e) {		
			e.preventDefault();
			formObj.empty();
			formObj.append("<input type='hidden' name='pid' value='" + $(this).attr("data-pid") + "'>");
			formObj.append("<input type='hidden' name='resDate' value='" + $(this).attr("data-res-date") + "'>");
			formObj.attr("method", "get");
			formObj.attr("action", "/manager/resList");
			formObj.submit();			
		});
		
		$('.cancel_button').on("click", function(e){
		    
			if(confirm("정말 예약을 취소하시겠습니까?") == true) {				
				e.preventDefault();
				formObj.submit();
				
			}
			else return;
	
		});
		
		$('.remove_button').on("click", function(e){
		    
			if(confirm("정말 예약을 삭제하시겠습니까?") == true) {			
				e.preventDefault();
				formObj.attr("action", "/manager/removeRes");
				formObj.submit();			
			}
			else return;

		
		});
		
		// When userId is null, Can't use cancel button
		
		var userId = $('.user_id_fix').val();
		
		if(userId == '') $('.cancel_button').css('display', 'none');
		else $('.cancel_button').css('display', 'block');
			
	});
		
</script>

<%@include file="../includes/footer.jsp"%>