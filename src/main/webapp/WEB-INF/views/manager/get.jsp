<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%@ include file="../includes/header.jsp"%>

<div class="container">
	<button type="submit" class="btn btn-info btn-bottom-margin list_button">목록</button>	
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<p>
						<b>시설 조회/변경/삭제</b>
						<button type="submit" class="btn btn-danger pull-right remove_button manager_get_panel_content_hidden">삭제</button>
					</p>
				</div>
				<!-- /.panel-heading -->
				<div class="panel-body manager_get_panel_content_hidden">
				
					<form role="form" action="/manager/modify" method="post">
					
						<%-- For paging with pageNum and amount --%>
						<input type='hidden' class="pagenum_input" name='pageNum' value='<c:out value="${cri.pageNum}" />'>
						<input type='hidden' class="amount_input" name='amount' value='<c:out value="${cri.amount}" />'>
						<input type='hidden' class="type_input" name='type' value='<c:out value="${cri.type}" />'>
						<input type='hidden' class="keyword_input" name='keyword' value='<c:out value="${cri.keyword}" />'>
								
						<div class="form-group">
							<label>시설 ID</label>
							<input class="form-control pid_input" name="pid" value='<c:out value="${place.pid}"/>' readonly="readonly">
						</div>
		        						
						<div class="form-group">
							<label>시설명</label>
							<input class="form-control name_input" name='name' value='<c:out value="${place.name}"/>' data-existing='<c:out value="${place.name}"/>' maxlength="50">
							<span class="manager_place_modify_name_poss">사용 가능한 시설명입니다.</span>
							<span class="manager_place_modify_name_imposs">사용할 수 없는 시설명입니다.</span>
							<span class="manager_place_modify_name_ck">시설명을 입력해주세요.</span>
							<span class="manager_place_modify_name_val">시설명은 한글이나 영문자, 숫자 조합으로 5자리 이상 입력해야 합니다.</span>					
						</div>
						
						<div class="form-group">
							<label>시설 주소</label>
							<textarea class="form-control address_input" name="address" rows="2" maxlength="100" style="resize: none;"><c:out value="${place.address}"/></textarea>
							<span class="manager_place_modify_address_ck">시설 주소를 입력해주세요.</span>
							<span class="manager_place_modify_address_val">사용할 수 없는 문자가 있습니다.</span>
						</div>
						
						<div class="form-group">
							<label>공지사항</label>
							<textarea class="form-control notice_input" name="notice" rows="10" maxlength="500" placeholder="사용자가 참고할만한 내용이나 운영 시간, 예약 가능 시간 등을 적어주세요." style="resize: none;"><c:out value="${place.notice}"/></textarea>
							<span class="manager_place_modify_notice_val">사용할 수 없는 문자가 있습니다.</span>
						</div>						

			     		<div class="form-group">
			     			<div class="cycle-form-group">
			     				<label>예약 주기</label><br>
			     				<input class="re_reg_cycle_input" name="reRegCycle" value='<c:out value="${place.reRegCycle}"/>' size="3" maxlength="2" />
								<label>일</label>
								<br>
								<span class="manager_place_modify_re_reg_cycle_val">1~99 사이의 숫자만 입력해주세요.</span>								
			     			</div>
			     		</div>
			     		
			     		<div class="form-group">
							<div class="cus-cycle-form-group">
								<label>동 시간대 예약 가능한 팀의 수</label>
								<br>
								<input type="text" class="team_input" name="team" value='<c:out value="${place.team}"/>' size="2" maxlength="1">
								<label>팀</label>
								<span class="manager_place_modify_team_val">1~9 사이의 숫자만 입력하세요.</span>
							</div>
						</div>

						<div class="form-group">
							<div class="cus-cycle-form-group">
								<label>예약 건수별 적용 시간</label>
								<br>
								<input type="text" class="reg_cycle_hour_input" name="regCycleHour" value='<c:out value="${place.regCycleHour}"/>' size="2" maxlength="1" >
								<label>시간</label>
								&nbsp;&nbsp;
								<input type="text" class="reg_cycle_minute_input" name="regCycleMinute" value='<c:out value="${place.regCycleMinute}"/>' size="2" maxlength="2">
								<label>분</label>
								<span class="manager_place_modify_reg_cycle_time_ck">0 이상의 숫자만 입력하세요.</span>
								<span class="manager_place_modify_reg_cycle_time_val">분 단위는 5분 단위로 0~55까지 입력할 수 있습니다.<br>최소 시간은 0시간 5분입니다.</span>	
							</div>
						</div>
								          
						<button type="submit" data-oper="modify" class="btn btn-default pull-right modify_button">적용</button>
	
						<input type="hidden" class="mid_input" name="mid" value='<sec:authentication property="principal.username"/>'>
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	
					</form>
	
				</div>
				<!--  end panel-body -->
				
				<div class="panel-body manager_get_panel_content_display">
					삭제 등의 이유로 존재하지 않는 시설입니다.
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

		var nameCheck = true;
		var nameCkCheck = true;
		var addressCheck = true;
		var noticeCheck = true;
		var reRegCycleCheck = true;
		var teamCheck = true;
		var regCycleTimeCheck = true;
		
		var preName = $('.name_input').val();
		
		if(preName == '') {
			$('.manager_get_panel_content_hidden').css('display', 'none');
			$('.manager_get_panel_content_display').css('display', 'block');
		}
		
		$('.list_button').on("click", function(e){
		    
			e.preventDefault(); 
		    
			formObj.attr("action", "/manager/list").attr("method", "get");
		      
			// For remember page
			var pageNumTag = $("input[name='pageNum']").clone();
			var amountTag = $("input[name='amount']").clone();
			// For search
			var keywordTag = $("input[name='keyword']").clone();
			var typeTag = $("input[name='type']").clone();    
						      
			formObj.empty(); 
		      
			// For remember page
			formObj.append(pageNumTag);
			formObj.append(amountTag);
			// For search
			formObj.append(keywordTag);
			formObj.append(typeTag);     
			
			formObj.submit();
		
		});
		
		$('.modify_button').click(function() {
			
			nameCheckFunc();
			addressCheckFunc();
			noticeCheckFunc();
			reRegCycleCheckFunc();
			teamCheckFunc();
			regCycleTimeCheckFunc();
			
			if(nameCheck && nameCkCheck && addressCheck && noticeCheck && reRegCycleCheck && teamCheck && regCycleTimeCheck) {
				formObj.attr("action", "/manager/modify");
				formObj.submit();
			}
			
			return false;
			
		});
			
		$('.remove_button').on("click", function(e){
		    
			if(confirm("정말 삭제하시겠습니까?") == true) {				
				e.preventDefault();  			 
				formObj.attr("action", "/manager/remove");				
				formObj.submit();				
			}
			else return;
		
		});
			
		// Name validate
		
		$('.name_input').on("propertychange change keyup paste input", function(){			
			nameCheckFunc();				
		});
		
		function nameCheckFunc() {
			
			var name = $('.name_input').val();
			var nameVal = /^[a-zA-Zㄱ-힣0-9]+[a-zA-Zㄱ-힣0-9 ]{4,49}$/;
			
			var data = {name : name};
			
			var existingName = $('.name_input').attr("data-existing");
			
			if(name == existingName) {			
				$('.manager_place_modify_name_ck').css('display', 'none');
				$('.manager_place_modify_name_val').css('display', 'none');
				$('.manager_place_modify_name_imposs').css("display", "none");
				$('.manager_place_modify_name_poss').css("display", "none");
				nameCheck = true;
				nameCkCheck = true;			
			}
			else {
										
				if(name == '') {				
					$('.manager_place_modify_name_ck').css('display', 'block');
					$('.manager_place_modify_name_val').css('display', 'none');
					nameCheck = false;				
				}
				else {
					
					if(!nameVal.test(name)) {					
						$('.manager_place_modify_name_ck').css('display', 'none');
						$('.manager_place_modify_name_val').css('display', 'block');
						nameCheck = false;					
					}
					else {				
						$('.manager_place_modify_name_ck').css('display', 'none');
						$('.manager_place_modify_name_val').css('display', 'none');
						nameCheck = true;					
					}
					
				}
				
				if(nameCheck == true) {
					
					$.ajax({
						type : "get",
						url : "/manager/checkPlaceName",
						data : data,
						success : function(result){
							if(result != "fail") {
								$('.manager_place_modify_name_poss').css("display", "inline-block");
								$('.manager_place_modify_name_imposs').css("display", "none");
								nameCkCheck = true;
							}
							else {
								$('.manager_place_modify_name_imposs').css("display", "inline-block");
								$('.manager_place_modify_name_poss').css("display", "none");
								nameCkCheck = false;
							}
						}
					});
				}
				else {					
					$('.manager_place_modify_name_poss').css("display", "none");
					$('.manager_place_modify_name_imposs').css("display", "none");
					nameCkCheck = false;					
				}
			
			}
			
		}
		
		// Address validate
		
		$('.address_input').on("propertychange change keyup paste input", function(){		
			addressCheckFunc();					
		});
			
		function addressCheckFunc() {
			
			var address = $('.address_input').val();
			var addressVal = /^[0-9a-zA-Zㄱ-힣\n\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\" ]*$/;
			
			if(address == '') {		
				$('.manager_place_modify_address_ck').css('display', 'block');
				$('.manager_place_modify_address_val').css('display', 'none');
				addressCheck = false;			
			}
			else {
				
				if(!addressVal.test(address)) {				
					$('.manager_place_modify_address_ck').css('display', 'none');
					$('.manager_place_modify_address_val').css('display', 'block');
					addressCheck = false;			
				}
				else {			
					$('.manager_place_modify_address_ck').css('display', 'none');
					$('.manager_place_modify_address_val').css('display', 'none');
					addressCheck = true;			
				}
				
			}
			
		}
		
		// Notice validate
		
		$('.notice_input').on("propertychange change keyup paste input", function(){	
			noticeCheckFunc();				
		});
			
		function noticeCheckFunc() {
			
			var notice = $('.notice_input').val();
			var noticeVal = /^[0-9a-zA-Zㄱ-힣\n\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\" ]*$/;
			
			if(!noticeVal.test(notice)) {			
				$('.manager_place_modify_notice_val').css('display', 'block');
				noticeCheck = false;			
			}
			else {			
				$('.manager_place_modify_notice_val').css('display', 'none');
				noticeCheck = true;			
			}
			
		}
			
		// Re-register cycle (day) validate
		
		$('.re_reg_cycle_input').on("propertychange change keyup paste input", function(){		
			reRegCycleCheckFunc();				
		});
		
		function reRegCycleCheckFunc() {
			
			var reRegCycle = $('.re_reg_cycle_input').val();		
			var reRegCycleVal = /^[0-9]{1,2}$/;
			
			reRegCycleCheck = false;
			
			if((reRegCycle != '') && (reRegCycleVal.test(reRegCycle)) && (reRegCycle >= 1)) {			
				$('.manager_place_modify_re_reg_cycle_val').css('display', 'none');
				reRegCycleCheck = true;			
			}
			else {			
				$('.manager_place_modify_re_reg_cycle_val').css('display', 'block');
				reRegCycleCheck = false;			
			}
			
		}
		
		// Team validate
		
		$('.team_input').on("propertychange change keyup paste input", function(){		
			teamCheckFunc();					
		});
		
		function teamCheckFunc() {
			
			var team = $('.team_input').val();		
			var teamVal = /^[0-9]{1}$/;
			
			if((team != '') && (teamVal.test(team)) && (team >= 1)) {
				$('.manager_place_modify_team_val').css('display', 'none');
				teamCheck = true;
			}
			else {
				$('.manager_place_modify_team_val').css('display', 'block');
				teamCheck = false;
			}
			
		}
		
		// Cycle hour and minute validate
		
		var regCycleTimeTempCheck = false;
		
		$('.reg_cycle_hour_input, .reg_cycle_minute_input').on("propertychange change keyup paste input", function(){						
			regCycleTimeCheckFunc();					
		});
		
		function regCycleTimeCheckFunc() {
			
			var regCycleHour = $('.reg_cycle_hour_input').val();
			var regCycleMinute = $('.reg_cycle_minute_input').val();
			
			var regCycleHourVal = /^[0-9]{1}$/;
			var regCycleMinuteVal = /^[0-9]{1,2}$/;
			
			regCycleTimeCheck = false;
			
			if((regCycleHour == '') || (regCycleMinute == '') ||
			   (!regCycleHourVal.test(regCycleHour)) || (!regCycleMinuteVal.test(regCycleMinute))) {
				
				$('.manager_place_modify_reg_cycle_time_ck').css('display', 'block');
				$('.manager_place_modify_reg_cycle_time_val').css('display', 'none');
				regCycleTimeCheck = false;
				
			}
			else {
				
				$('.manager_place_modify_reg_cycle_time_ck').css('display', 'none');
				$('.manager_place_modify_reg_cycle_time_val').css('display', 'block');
						
				if((regCycleMinute % 5 == 0) && (regCycleMinute >= 0) &&
				   (regCycleMinute <= 55)) regCycleTimeTempCheck = true;
				else regCycleTimeTempCheck = false;
				
				if(regCycleTimeTempCheck == true) {				
					if((regCycleHour == 0) && (regCycleMinute == 0)) regCycleTimeTempCheck = false;				
				}
				
				if(regCycleTimeTempCheck == true) {					
					$('.manager_place_modify_reg_cycle_time_val').css('display', 'none');
					regCycleTimeCheck = true;				
				}
				
			}
			
		}
		
	});
		
</script>

<%@include file="../includes/footer.jsp"%>