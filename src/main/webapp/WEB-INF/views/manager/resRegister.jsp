<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%@ include file="../includes/header.jsp" %>

<div class="container">
	<button class="btn btn-info btn-bottom-margin list_btn" data-pid='<c:out value="${place.pid}" />'>목록</button>	
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<b>예약 추가</b>
				</div>
				<!-- /.panel-heading -->
						
				<div class="panel-body">						
					
					<input type="hidden" class="form-control mid_fix" name='mid' value='<c:out value="${place.mid}"/>' >
					<input type="hidden" class="form-control pid_fix" name='pid' value='<c:out value="${place.pid}"/>' >
																																				
					<div class="form-group">
						<label>시설명</label>
						<input class="form-control pname_fix" name='pname' value='<c:out value="${place.name}"/>' readonly="readonly" />
					</div>
					
		     		<div class="form-group">
		     			<div class="cus-readonly-cycle-form-group">
		     				<label>예약 주기</label><br>
		     				<input class="re_reg_cycle_input" name="reRegCycle" value='<c:out value="${place.reRegCycle}"/>' size="3" maxlength="2" readonly="readonly">
							<label>일</label>
							<br>
		     			</div>
		     		</div>
		     		
		     		<div class="form-group">
		     			<div class="cus-readonly-cycle-form-group">
		     				<label>동 시간대 예약 가능한 팀의 수</label><br>
		     				<input class="team_fix" value='<c:out value="${place.team}"/>' size="2" maxlength="1" readonly="readonly">
							<label>팀</label>
							<br>
		     			</div>
		     		</div>

					<div class="form-group">
						<div class="cus-readonly-cycle-form-group">
							<label>예약 건수별 적용 시간</label>
							<br>
							<input type="text" class="reg_cycle_hour_fix" name="regCycleHour" value='<c:out value="${place.regCycleHour}"/>' size="2" maxlength="1" readonly="readonly">
							<label>시간</label>
							&nbsp;&nbsp;
							<input type="text" class="reg_cycle_minute_fix" name="regCycleMinute" value='<c:out value="${place.regCycleMinute}"/>' size="2" maxlength="2" readonly="readonly">
							<label>분</label>
							&nbsp;&nbsp;
							<label>:</label>
							&nbsp;&nbsp;
							<input type="text" class="reg_cycle_total_minute_fix" size="4" readonly="readonly">
							<label>분</label>
						</div>
					</div>
					
					<hr>
					
					<div class="form-group">
						<label>시작 일자 ~ 마지막 일자</label>
						<br>
						<label></label>
						<input type="date" class="start_date_select" name="startDateSelect" />
						&nbsp;~&nbsp;
						<label></label>
						<input type="date" class="finish_date_select" name="finishDateSelect" />						
						<span class="manager_reservation_register_date_select_ck">시작 일자와 마지막 일자를 선택하세요.</span>
						<span class="manager_reservation_register_date_select_val">모든 일자는 오늘부터 28일 이후까지 선택할 수 있습니다.<br>마지막 일자는 시작 일자보다 늦거나 같아야 합니다.</span>
					</div>
					
					<div class="form-group">
						<div class="cus-cycle-form-group">
							<label>예약 시작 시간 ~ 마지막 예약 종료 시간 (0시 ~ 24시)</label>
							<br>
							<input class="start_hour_select" name="startHourSelect" size="2" maxlength="2" style="text-align:center;" />
							<label>시</label>
							&nbsp;&nbsp;
							<input class="start_minute_select" name="startMinuteSelect" size="2" maxlength="2" style="text-align:center;" />
							<label>분</label>
							&nbsp;&nbsp;~&nbsp;&nbsp;
							<input class="finish_hour_select" name="finishHourSelect" size="2" maxlength="2" style="text-align:center;" />
							<label>시</label>
							&nbsp;&nbsp;
							<input class="finish_minute_select" name="finishMiniteSelect" size="2" maxlength="2" style="text-align:center;" />
							<label>분</label>
							&nbsp;&nbsp;
							<label>:</label>
							&nbsp;&nbsp;
							<input class="sf_total_minute_fix" size="4" readonly="readonly" style="background-color: #eee;" />
							<label>분</label>
							<span class="manager_reservation_register_time_select_ck">0 이상의 숫자만 입력하세요.</span>
							<span class="manager_reservation_register_time_select_val">시간 단위는 0~24, 분 단위는 0~55까지 입력할 수 있습니다.<br>분 단위는 5분 단위로 입력할 수 있습니다.</span>
							<span class="manager_reservation_register_time_select_div">종료 시간에서 시작 시간을 뺀 시간을 예약 건수별 적용 시간으로 나누었을 때 나머지가 없어야 합니다.</span>						
						</div>
					</div>
					
					<div class="form-group text-right">
						<button class='btn btn-default add_btn'>추가</button>	
					</div>
					
					<hr>
					
					<div class="form-group text-right">
						<button class='btn btn-default remove_btn'>삭제</button>	
					</div>
					
					<table class="table table-striped table-bordered table-hover reg_table">
					
						<thead>
						
							<tr>
								<th style='text-align: center'>일자</th>
								<th style='text-align: center'>시작 시간</th>
								<th style='text-align: center'>종료 시간</th>
								<th style='text-align: center'><input type='checkbox' class='check_all_button' name='regTableChkAll'></th>
							</tr>
							
						</thead>
						
						<tbody>
						
						</tbody>
					
					</table>

					<form role="form" id="res_register_form" action="/manager/resRegister" method="post"></form>
					
					<button type="submit" class="btn btn-default pull-right submit_button">등록</button>	
	          		
	          		<input type="hidden" class="csrf_token" value = "${_csrf.token}" />
	          		<input type="hidden" class="csrf_header" value = "${_csrf.headerName}" />
	
				</div>
				<!-- end panel-body -->
		    </div>
		    <!-- end panel panel-default -->
		</div>
		<!-- end col-lg-12 -->
	</div>
	<!-- /.row -->
</div>
<!-- /.container -->

<script>
	
	$(document).ready(function(){
				
		var actionForm = $("#res_register_form");
		
		$(".list_btn").on("click",function(e) {		
			e.preventDefault();
			actionForm.append("<input type='hidden' name='pid' value='" + $(this).attr("data-pid") + "'>");
			actionForm.attr("method", "get");
			actionForm.attr("action", "/manager/resList");
			actionForm.submit();		
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
		
		$(".start_date_select").attr("min", todayDate);
		$(".start_date_select").attr("max", maxDate);
		$(".finish_date_select").attr("min", todayDate);
		$(".finish_date_select").attr("max", maxDate);
		
		// Set reg' cycle total minute
		
		var regCycleHourFix = Number($('.reg_cycle_hour_fix').val());
		var regCycleMinuteFix = Number($('.reg_cycle_minute_fix').val());
		
		$('.reg_cycle_total_minute_fix').val(regCycleHourFix * 60 + regCycleMinuteFix);
		
		// Validation
		// *** sf : Start and Finish
		
		var sfDateSelectCheck = false;
		var sfTimeSelectCheck = false;
		
		// Start and finish date validation
		
		$('.start_date_select, .finish_date_select').on("propertychange change keyup paste input", function(){
			
			sfDateSelectFunc();
					
		});
		
		function sfDateSelectFunc() {
			
			var sfDateSelectTempCheck = false;
			sfDateSelectCheck = false;
			
			var startDateSelect = $('.start_date_select').val();			
			var startDateSelectYear = Number(startDateSelect.split("-")[0]);
			var startDateSelectMonth = Number(startDateSelect.split("-")[1]);
			var startDateSelectDay = Number(startDateSelect.split("-")[2]);
			
			var finishDateSelect = $('.finish_date_select').val();			
			var finishDateSelectYear = Number(finishDateSelect.split("-")[0]);
			var finishDateSelectMonth = Number(finishDateSelect.split("-")[1]);
			var finishDateSelectDay = Number(finishDateSelect.split("-")[2]);
			
			if((startDateSelectYear == 0) || (isNaN(startDateSelectMonth)) ||
			   (isNaN(startDateSelectDay)) || (finishDateSelectYear == 0) ||
			   (isNaN(finishDateSelectMonth)) || (isNaN(finishDateSelectDay))) {
				
				$('.manager_reservation_register_date_select_ck').css('display', 'block');
				$('.manager_reservation_register_date_select_val').css('display', 'none');
				
			}
			else {
				
				$('.manager_reservation_register_date_select_ck').css('display', 'none');
				$('.manager_reservation_register_date_select_val').css('display', 'block');
				
				// Start date >= Today
								
				if(startDateSelectYear < todayYear) sfDateSelectTempCheck = false;	
				else if(startDateSelectYear == todayYear) {
					
					if(startDateSelectMonth < todayMonth) sfDateSelectTempCheck = false;
					else if(startDateSelectMonth == todayMonth) {
					
						if(startDateSelectDay < todayDay) sfDateSelectTempCheck = false;
						else sfDateSelectTempCheck = true;
						
					}
					else sfDateSelectTempCheck = true;
					
				}
				else sfDateSelectTempCheck = true;	
				
				// Finish date >= Today
				
				if(sfDateSelectTempCheck == true) {
					
					if(finishDateSelectYear < todayYear) sfDateSelectTempCheck = false;	
					else if(finishDateSelectYear == todayYear) {
						
						if(finishDateSelectMonth < todayMonth) sfDateSelectTempCheck = false;
						else if(finishDateSelectMonth == todayMonth) {
						
							if(finishDateSelectDay < todayDay) sfDateSelectTempCheck = false;
							else sfDateSelectTempCheck = true;
							
						}
						else sfDateSelectTempCheck = true;
						
					}
					else sfDateSelectTempCheck = true;					
					
				}
				
				// Start date <= Maximum date (Today + 28days)
				
				if(sfDateSelectTempCheck == true) {
					
					if(startDateSelectYear > maxYear) sfDateSelectTempCheck = false;	
					else if(startDateSelectYear == maxYear) {
						
						if(startDateSelectMonth > maxMonth) sfDateSelectTempCheck = false;
						else if(startDateSelectMonth == maxMonth) {
						
							if(startDateSelectDay > maxDay) sfDateSelectTempCheck = false;
							else sfDateSelectTempCheck = true;
							
						}
						else sfDateSelectTempCheck = true;
						
					}
					else sfDateSelectTempCheck = true;					
					
				}
				
				// Finish date <= Maximum date (Today + 28days)
				
				if(sfDateSelectTempCheck == true) {
					
					if(finishDateSelectYear > maxYear) sfDateSelectTempCheck = false;	
					else if(finishDateSelectYear == maxYear) {
						
						if(finishDateSelectMonth > maxMonth) sfDateSelectTempCheck = false;
						else if(finishDateSelectMonth == maxMonth) {
						
							if(finishDateSelectDay > maxDay) sfDateSelectTempCheck = false;
							else sfDateSelectTempCheck = true;
							
						}
						else sfDateSelectTempCheck = true;
						
					}
					else sfDateSelectTempCheck = true;					
					
				}
				
				// Start date <= Finish date
				
				if(sfDateSelectTempCheck == true) {
					
					if(startDateSelectYear > finishDateSelectYear) sfDateSelectTempCheck = false;	
					else if(startDateSelectYear == finishDateSelectYear) {
						
						if(startDateSelectMonth > finishDateSelectMonth) sfDateSelectTempCheck = false;
						else if(startDateSelectMonth == finishDateSelectMonth) {
						
							if(startDateSelectDay > finishDateSelectDay) sfDateSelectTempCheck = false;
							else sfDateSelectTempCheck = true;
							
						}
						else sfDateSelectTempCheck = true;
						
					}
					else sfDateSelectTempCheck = true;					
					
				}
				
				// Pass all condition
				
				if(sfDateSelectTempCheck == true) {				
					$('.manager_reservation_register_date_select_val').css('display', 'none');
					sfDateSelectCheck = true;						
				}
				
			}			
			
		}
		
		// Start and finish time validation
		
		$('.start_hour_select, .start_minute_select, .finish_hour_select, .finish_minute_select').on("propertychange change keyup paste input", function() {						
			sfTimeSelectFunc();					
		});
		
		function sfTimeSelectFunc() {
			
			sfTimeSelectCheck = false;
			var sfTimeSelectTempCheck = false;
			
			var startHourSelect = $('.start_hour_select').val();
			var startMinuteSelect = $('.start_minute_select').val();
			var finishHourSelect = $('.finish_hour_select').val();			
			var finishMinuteSelect = $('.finish_minute_select').val();	
			
			var sfTimeVal = /^[0-9]{1,2}$/;
			
			if((startHourSelect == '') || (startMinuteSelect == '') ||
			   (finishHourSelect == '') || (finishMinuteSelect == '') ||
			   (!sfTimeVal.test(startHourSelect)) || (!sfTimeVal.test(startMinuteSelect)) ||
			   (!sfTimeVal.test(finishHourSelect)) || (!sfTimeVal.test(finishMinuteSelect))) {
				
				$('.manager_reservation_register_time_select_ck').css('display', 'block');
				$('.manager_reservation_register_time_select_val').css('display', 'none');
				
			}
			else {
				
				$('.manager_reservation_register_time_select_ck').css('display', 'none');
				$('.manager_reservation_register_time_select_val').css('display', 'block');
				
				// 0 <= hour <= 24
				// 0 <= minute <= 55
				// minute % 5 == 0
				
				if((startHourSelect >= 0) && (startHourSelect <= 24) &&
				   (startMinuteSelect >= 0) && (startMinuteSelect <= 55) &&
				   (finishHourSelect >= 0) && (finishHourSelect <= 24) &&
				   (finishMinuteSelect >= 0) && (finishMinuteSelect <= 55) &&
				   (startMinuteSelect % 5 == 0) && (finishMinuteSelect % 5 == 0)) {					
					sfTimeSelectTempCheck = true;					
				}
				else {					
					sfTimeSelectTempCheck = false;					
				}
				
				// if hour == 24 -> only 0 minute
				
				if(sfTimeSelectTempCheck == true) {
				
					if(startHourSelect == 24) {				
						if(startMinuteSelect == 0) sfTimeSelectTempCheck = true;
						else sfTimeSelectTempCheck = false;				
					}
				
				}
				
				if(sfTimeSelectTempCheck == true) {
				
					if(finishHourSelect == 24) {					
						if(finishMinuteSelect == 0) sfTimeSelectTempCheck = true;
						else sfTimeSelectTempCheck = false;						
					}
				
				}
				
				// Start Time < Finish Time
				
				if(sfTimeSelectTempCheck == true) {
					
					if(Number(startHourSelect) > Number(finishHourSelect)) sfTimeSelectTempCheck = false;
					else if(Number(startHourSelect) == Number(finishHourSelect)) {
						
						if(Number(startMinuteSelect) >= Number(finishMinuteSelect)) sfTimeSelectTempCheck = false;
						else sfTimeSelectTempCheck = true;
						
					}
					else sfTimeSelectTempCheck = true;
					
				}
				
				// Calcurate total minute
				
				if(sfTimeSelectTempCheck == true) {				
					$('.sf_total_minute_fix').val((Number(finishHourSelect) - Number(startHourSelect)) * 60 + (Number(finishMinuteSelect) - Number(startMinuteSelect)));
					$('.manager_reservation_register_time_select_val').css('display', 'none');					
				}
				else {					
					$('.sf_total_minute_fix').val('');
					$('.manager_reservation_register_time_select_val').css('display', 'block');				
				}
				
				if(sfTimeSelectTempCheck == true) {
										
					if(Number($('.sf_total_minute_fix').val()) % Number($('.reg_cycle_total_minute_fix').val()) == 0) {					
						sfTimeSelectCheck = true;
						$('.manager_reservation_register_time_select_div').css('display', 'none');						
					}
					else {						
						$('.manager_reservation_register_time_select_div').css('display', 'block');						
					}
					
				}
																				
			}			
			
		}
		
		// Add button
		
		var resArr = new Array();
		var timeArr = new Array();
		
		var cycleMinute = Number($('.reg_cycle_total_minute_fix').val());
		
		var token = $('.csrf_token').val();
		var header = $('.csrf_header').val();
		
		$('.add_btn').click(function(){
			
			sfDateSelectFunc();
			sfTimeSelectFunc();
			
			if(sfDateSelectCheck && sfTimeSelectCheck) {
			
				var pid = $('.pid_fix').val();
				var teamMax = parseInt($('.team_fix').val());
				var startDate = $('.start_date_select').val();
				var finishDate = $('.finish_date_select').val();
				
				var data = { "startDate" : startDate,
							"finishDate" : finishDate,
							"pid" : pid };
				
				$.ajax({
					
					headers : { 
				        'Accept': 'application/json',
				        'Content-Type': 'application/json' 
				    },
					type : "POST",
					url : "/manager/checkRes",
					dataType : 'text',
					data : JSON.stringify(data),
					beforeSend : function(xhr) {				
						xhr.setRequestHeader(header, token);					
					},
					success : function(result){
						
						if(result != "fail") {
														
							table = $('.reg_table');
							
							var startHourSelect = Number($('.start_hour_select').val());
							var startMinuteSelect = Number($('.start_minute_select').val());
							var finishHourSelect = Number($('.finish_hour_select').val());			
							var finishMinuteSelect = Number($('.finish_minute_select').val());
							
							timeArr = getTimeList(startHourSelect, startMinuteSelect, finishHourSelect, finishMinuteSelect, cycleMinute);
							
							var startHourSelectStr = "";
							var startMinuteSelectStr = "";
							var finishHourSelectStr = "";
							var finishMinuteSelectStr = "";
							
							if(startHourSelect < 10) startHourSelectStr = "0" + startHourSelect;
							else startHourSelectStr = String(startHourSelect);
							if(startMinuteSelect < 10) startMinuteSelectStr = "0" + startMinuteSelect;
							else startMinuteSelectStr = String(startMinuteSelect);
							if(finishHourSelect < 10) finishHourSelectStr = "0" + finishHourSelect;
							else finishHourSelectStr = String(finishHourSelect);
							if(finishMinuteSelect < 10) finishMinuteSelectStr = "0" + finishMinuteSelect;
							else finishMinuteSelectStr = String(finishMinuteSelect);
								
							var startTime = startHourSelectStr + " : " + startMinuteSelectStr;
							var finishTime = finishHourSelectStr + " : " + finishMinuteSelectStr;
							
							var startDateSelect = $('.start_date_select').val();			
							var startDateSelectYear = Number(startDateSelect.split("-")[0]);
							var startDateSelectMonth = Number(startDateSelect.split("-")[1]);
							var startDateSelectDay = Number(startDateSelect.split("-")[2]);
							
							var finishDateSelect = $('.finish_date_select').val();			
							var finishDateSelectYear = Number(finishDateSelect.split("-")[0]);
							var finishDateSelectMonth = Number(finishDateSelect.split("-")[1]);
							var finishDateSelectDay = Number(finishDateSelect.split("-")[2]);
							
							var startDate = new Date(startDateSelectYear, startDateSelectMonth - 1, startDateSelectDay);
							var finishDate = new Date(finishDateSelectYear, finishDateSelectMonth - 1, finishDateSelectDay);
							
							var dateArray = getDates(startDate, finishDate);
							
							for(i = 0; i < dateArray.length; i++) {
								
								var currentYear = dateArray[i].getFullYear();
								var currentMonth = dateArray[i].getMonth() + 1;
								var currentDay = dateArray[i].getDate();
								
								if(currentMonth < 10) currentMonth = "0" + currentMonth;					
								if(currentDay < 10) currentDay = "0" + currentDay;
								
								var currentDate = currentYear + "-" + currentMonth + "-" + currentDay;
								
								if($(".reg_table #row1-" + currentDate).text() == '') {
									
									table.append("<tr>" +
											"<td id='row1-" + currentDate + "' style='text-align: center'></td>" + 
											"<td id='row2-" + currentDate + "' style='text-align: center'></td>" + 
											"<td id='row3-" + currentDate + "' style='text-align: center'></td>" + 
											"<td style='text-align: center'><input type='checkbox' name='regTableChk'></td>" +
											"</tr>");
								
								}
								else {
															
									resArr = RemoveNode(currentDate);
									
								}
																
								$(".reg_table #row1-" + currentDate).text(currentDate);
								$(".reg_table #row2-" + currentDate).text(startTime);
								$(".reg_table #row3-" + currentDate).text(finishTime);
								
								for(var j = 0; j<timeArr.length; j++) {
									
									var jsonObj = new Object();
									
									var startHour = timeArr[j][0];
									var startMinute = timeArr[j][1];
									var finishHour = timeArr[j][2];
									var finishMinute = timeArr[j][3];
									
									if(startHour < 10) startHour = "0" + startHour;
									else startHour = String(startHour);
									if(startMinute < 10) startMinute = "0" + startMinute;
									else startMinute = String(startMinute);
									if(finishHour < 10) finishHour = "0" + finishHour;
									else finishHour = String(finishHour);
									if(finishMinute < 10) finishMinute = "0" + finishMinute;
									else finishMinute = String(finishMinute);					
									
									for(var k = 1; k <= teamMax; k++) {
										
										var jsonObj = new Object();
										
										jsonObj.resDate = String(currentDate);
										jsonObj.team = k;
										jsonObj.startHour = String(startHour);
										jsonObj.startMinute = String(startMinute);
										jsonObj.finishHour = String(finishHour);
										jsonObj.finishMinute = String(finishMinute);
										
										resArr.push(jsonObj);
										
									}									
									
								}
													
							}
							
							$('.start_hour_select').val('');
							$('.start_minute_select').val('');
							$('.finish_hour_select').val('');
							$('.finish_minute_select').val('');
							$('.start_date_select').val('');
							$('.finish_date_select').val('');
							$('.sf_total_minute_fix').val('');
							
						}
						else {
							
							alert("시작 날짜와 마지막 날짜 사이에 등록된 예약이 있습니다.\n해당 기간 사이의 예약을 모두 삭제하고 다시 등록해야 합니다.");
							return;
							
						}
						
					}
					
				});
								
			}
			
			return false;
			
		});
		
		// Add date array elements
		
		Date.prototype.addDays = function(days) {
			
		    var date = new Date(this.valueOf());
		    date.setDate(date.getDate() + days);
		    
		    return date;
		    
		}
		
		function getDates(startDate, finishDate) {
			
		    var dateArray = new Array();
		    var currentDate = startDate;
		    
		    while(currentDate <= finishDate) {
		    	
		        dateArray.push(new Date (currentDate));
		        currentDate = currentDate.addDays(1);
		        
		    }
		    
		    return dateArray;
		    
		}
		
		// Split time
				
		function getTimeList(startHour, startMinute, finishHour, finishMinute, cycleMinute) {
			
			var startTimeConv = startHour * 60 + startMinute;
			var finishTimeConv = finishHour * 60 + finishMinute;
			var currentTimeConv = startTimeConv;
			
			var arrayLength = (finishTimeConv - startTimeConv) / cycleMinute;			
			var timeList = new Array(arrayLength);
						
			for(var i = 0; i < timeList.length; i++) {
				
				timeList[i] = new Array(4);
				timeList[i][0] = parseInt(currentTimeConv / 60);
				timeList[i][1] = currentTimeConv % 60;
				timeList[i][2] = parseInt((currentTimeConv + cycleMinute) / 60);
				timeList[i][3] = (currentTimeConv + cycleMinute) % 60;
				
				currentTimeConv += cycleMinute;
				
			}
			
			return timeList
						
		}
		
		// Remove button
				
		$('.remove_btn').click(function(){
						
			var checkRows = $("[name='regTableChk']:checked");
			
			for(var i = checkRows.length - 1; i > -1; i--) {			
				var curDate = String(checkRows.eq(i).closest('tr').text().slice(0, 10));
				resArr = RemoveNode(curDate);
				checkRows.eq(i).closest('tr').remove();			
			}
			
		});
		
		function RemoveNode(date){
			
		    return resArr.filter(function(e) {		    	
		        return e.resDate !== date;		        
		    });
		    
		}

		// Check all button
		
		$('.check_all_button').click(function(){			
			if($(".check_all_button").is(":checked")) $("input[name='regTableChk']").prop("checked", true);
			else $("input[name='regTableChk']").prop("checked", false);			
		});
		
		// Submit button
		
		var token = $('.csrf_token').val();
		var header = $('.csrf_header').val();
		
		$('.submit_button').click(function() {
			
			if(resArr.length == 0) {				
				alert("예약 일정을 표에 추가하고 눌러주세요.");
				return;				
			}
			else {
				
				var mid = $('.mid_fix').val();
				var pid = $('.pid_fix').val();
				var pname = $('.pname_fix').val();
				
				var data = { "mid" : mid,
							"pid" : pid,
							"pname" : pname,
							"userId" : "",
							"regDateTime" : "",
							"resArr" : resArr };
				
				$.ajax({
					
					headers : { 
				        'Accept': 'application/json',
				        'Content-Type': 'application/json' 
				    },
					type : "POST",
					url : "/manager/resRegister",
					dataType : 'json',
					data : JSON.stringify(data),
					beforeSend : function(xhr) {				
						xhr.setRequestHeader(header, token);			
					},
				    success : function() {				    	
				    	location.href = "/manager/resList?pid=" + pid;				    	
				    }
					
				});
				
			}
			
		});
		
	});
	
</script>

<%@include file="../includes/footer.jsp"%>