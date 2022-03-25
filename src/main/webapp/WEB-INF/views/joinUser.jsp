<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="./includes/header.jsp"%>

<div class="container">
	<button class="btn btn-info btn-bottom-margin" onclick="location.href='/joinType'">선택 화면으로</button>
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<b>일반 사용자 가입</b>
				</div>
				<!-- /.panel-heading -->
				<div class="panel-body">
				
					<form role="form" id="join_user_form" method="post">
					
						<div class="form-group">
							<label>아이디</label> <input class="form-control id_input" name='id' maxlength="20">
							<span class="join_user_id_poss">사용 가능한 아이디입니다.</span>
							<span class="join_user_id_imposs">사용할 수 없는 아이디입니다.</span>
							<span class="join_user_id_ck">아이디를 입력해주세요.</span>
							<span class="join_user_id_val">아이디는 영소문자로 시작하여 영소문자와 숫자 조합으로 5~20자리 사용해야 합니다.</span>
						</div>
	
						<div class="form-group">
							<label>비밀번호</label>
							<input class="form-control pw_input" type="password" name='pw' maxlength="20">
							<span class="join_user_pw_ck">비밀번호를 입력해주세요.</span>
							<span class="join_user_pw_val">
								비밀번호는 영문자와 숫자로 총 8~20자리 사용해아 합니다.<br>
								특수문자는 !@#$%^*+=-를 사용할 수 있습니다.
	            			</span>
						</div>
	          
						<div class="form-group">
							<label>비밀번호 확인</label>
							<input class="form-control pwck_input" type="password" name='pwck' maxlength="20">
							<span class="join_user_pwck_ck">비밀번호를 입력해주세요.</span>
							<span class="join_user_pwck_same">비밀번호가 일치합니다.</span>
							<span class="join_user_pwck_diff">비밀번호가 틀립니다.</span>
						</div>
	
						<div class="form-group">
							<label>이름</label>
							<input class="form-control name_input" name='name' maxlength="20">
							<span class="join_user_name_ck">이름을 입력해주세요.</span>
							<span class="join_user_name_val">이름을 한글이나 영문자로 2~20자리 사용해야 합니다.</span>
						</div>					
						
						<div class="form-group">
							<label>생년월일</label>
							<input class="form-control birth_input" type="date" name='birthDate'>
							<span class="join_user_birth_ck">생년월일을 알맞게 입력해주세요.</span>
						</div>
												
						<div class="form-group">
							<label>성별</label>
							<select class="form-control gender_input" name="gender">
								<option value=''>성별 선택</option>
								<option value='m'>남자</option>
								<option value='f'>여자</option>
							</select>
							<span class="join_user_gender_ck">성별을 선택해주세요.</span>
						</div>
						
						<div class="form-group">
							<label>전화번호</label>
							<input class="form-control phone_number_input" name='phoneNumber' maxlength="20">
							<span class="join_user_phone_number_ck">전화번호를 입력해주세요.</span>
							<span class="join_user_phone_number_val">전화번호 양식이 올바르지 않습니다. -을 포함해주세요.</span>
						</div>   

						<div class="form-group">
							<label>이메일</label>
							<input class="form-control email_input" name='email' maxlength="30">
							<span class="join_user_email_ck">이메일을 입력해주세요.</span>
							<span class="join_user_email_val">이메일 양식이 올바르지 않습니다.</span>
						</div>
						
						<div class="form-group">
							<label>주소</label>
							<textarea class="form-control address_input" name="address" rows="2" maxlength="100" style="resize: none;"></textarea>
							<span class="join_user_address_ck">시설 주소를 입력해주세요.</span>
							<span class="join_user_address_val">사용할 수 없는 문자가 있습니다.</span>
						</div>  
							          	          
						<input type="button" value="가입하기" class="btn btn-default pull-right join_button" />	          
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						<input type="hidden" name='nickName' value="">
	          			
					</form>
	
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

	var idckCheck = false;
	var idCheck = false;
	var pwCheck = false;
	var pwckCheck = false;
	var pwckcorCheck = false;
	var nameCheck = false;
	var birthCheck = false;
	var genderCheck = false;
	var phoneNumberCheck = false;
	var emailCheck = false;
	var addressCheck = false;
		
	$('.join_button').click(function() {
		
		var id = $('.id_input').val();
		var idVal = /^[a-z]+[a-z0-9]{4,19}$/g;
		
		var pw = $('.pw_input').val();
		var pwVal = /^(?=.*[a-zA-Z])(?=.*[0-9])[a-zA-Z0-9!@#$%^*+=-]{8,20}$/;
		
		var pwck = $('.pwck_input').val();
		
		var name = $('.name_input').val();
		var nameVal = /^[a-zA-Z가-힣]+[a-zA-Z가-힣 ]{1,19}$/;
		
		var phoneNumber = $('.phone_number_input').val();
		var phoneNumberVal = /^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$/;
		
		var email = $('.email_input').val();
		var emailVal = /^[a-zA-Z0-9-_\.]{1,}@[a-zA-Z0-9]{1,}\.[a-zA-Z0-9]{2,3}$/;
		
		var address = $('.address_input').val();
		var addressVal = /^[0-9a-zA-Zㄱ-힣\n\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\" ]*$/;
		
		if(idckCheck && idCheck && pwCheck && pwckCheck && pwckcorCheck && nameCheck && birthCheck && genderCheck && phoneNumberCheck && emailCheck && addressCheck) {
			$("#join_user_form").attr("action", "/joinUser");
			$("#join_user_form").submit();
		}
		else {
			
			if(id == '') $('.join_user_id_ck').css('display', 'block');
			else if(!idVal.test(id)) $('.join_user_id_val').css('display', 'block');
			
			if(pw == '') $('.join_user_pw_ck').css('display', 'block');
			else if(!pwVal.test(pw)) $('.join_user_pw_val').css('display', 'block');
			
			if(pwck == '') $('.join_user_pwck_ck').css('display', 'block');
			
			if(name == '') $('.join_user_name_ck').css('display', 'block');
			else if(!nameVal.test(name)) $('.join_user_name_val').css('display', 'block');
			
			if(!birthCheck) $('.join_user_birth_ck').css('display', 'block');
			
			if(!genderCheck) $('.join_user_gender_ck').css('display', 'block');
			
			if(phoneNumber == '') $('.join_user_phone_number_ck').css('display', 'block');
			else if(!phoneNumberVal.test(phoneNumber)) $('.join_user_phone_number_val').css('display', 'block');

			if(email == '') $('.join_user_email_ck').css('display', 'block');
			else if(!emailVal.test(email)) $('.join_user_email_val').css('display', 'block');

			if(address == '') $('.join_user_address_ck').css('display', 'block');
			else if(!addressVal.test(address)) $('.join_user_address_val').css('display', 'block');
			
		}
		
		return false;
		
	});
	
	// ID check & validate
	
	$('.id_input').on("propertychange change keyup paste input", function(){
		
		var memberId = $('.id_input').val();
		var data = {memberId : memberId};
		
		var idval = /^[a-z]+[a-z0-9]{4,19}$/g;
		
		if(memberId == '') {
			$('.join_user_id_ck').css('display', 'block');
			$('.join_user_id_val').css('display', 'none');
			idCheck = false;
		}
		else {
			
			if(!idval.test(memberId)) {
				$('.join_user_id_ck').css('display', 'none');
				$('.join_user_id_val').css('display', 'block');
				idCheck = false;
			}
			else {
				$('.join_user_id_ck').css('display', 'none');
				$('.join_user_id_val').css('display', 'none');
				idCheck = true;
			}
			
		}
		
		if(idCheck == true) {
			
			$.ajax({
				type : "get",
				url : "/memberIdChk",
				data : data,
				success : function(result){
					if(result != "fail") {
						$('.join_user_id_poss').css("display", "inline-block");
						$('.join_user_id_imposs').css("display", "none");
						idckCheck = true;
					}
					else {
						$('.join_user_id_imposs').css("display", "inline-block");
						$('.join_user_id_poss').css("display", "none");
						idckCheck = false;
					}
				}
			});
			
		}
		else {
			
			$('.join_user_id_poss').css("display", "none");
			$('.join_user_id_imposs').css("display", "none");
			idckCheck = false;
			
		}
			
	});
	
	// Password validate
	
	$('.pw_input').on("propertychange change keyup paste input", function(){
		
		var pw = $('.pw_input').val();
		var pwval = /^(?=.*[a-zA-Z])(?=.*[0-9])[a-zA-Z0-9!@#$%^*+=-]{8,20}$/;
		
		if(pw == '') {
			$('.join_user_pw_ck').css('display', 'block');
			$('.join_user_pw_val').css('display', 'none');
			pwCheck = false;
		}
		else {
			
			if(!pwval.test(pw)) {
				$('.join_user_pw_ck').css('display', 'none');
				$('.join_user_pw_val').css('display', 'block');
				pwCheck = false;
			}
			else {
				$('.join_user_pw_ck').css('display', 'none');
				$('.join_user_pw_val').css('display', 'none');
				pwCheck = true;
			}
			
		}
				
	});
	
	// Password check
	
	$('.pwck_input').on("propertychange change keyup paste input", function(){
		
		var pwck = $('.pwck_input').val();
		
		$('.join_user_pwck_ck').css('display', 'none');
		
		if(pwck == '') {
			$('.join_user_pwck_ck').css('display', 'block');
			pwckCheck = false;
		}
		else {
			$('.join_user_pwck_ck').css('display', 'none');
			pwckCheck = true;
		}    
		
	});
	
	$('.pw_input, .pwck_input').on("propertychange change keyup paste input", function(){
		
		var pw = $('.pw_input').val();
		var pwck = $('.pwck_input').val();
		
		if(pwckCheck == true) {
			
		    if(pw == pwck){
		        $('.join_user_pwck_same').css('display', 'block');
		        $('.join_user_pwck_diff').css('display', 'none');
		        pwckcorCheck = true;
		    }
		    else {
		        $('.join_user_pwck_same').css('display', 'none');
		        $('.join_user_pwck_diff').css('display', 'block');
		        pwckcorCheck = false;
		    } 
		    
		}
		else {
			$('.join_user_pwck_same').css('display', 'none');
			$('.join_user_pwck_diff').css('display', 'none');
			pwckcorCheck = false;
		}
		
	});
	
	// Name validate
	
	$('.name_input').on("propertychange change keyup paste input", function(){
		
		var name = $('.name_input').val();
		var nameval = /^[a-zA-Z가-힣]+[a-zA-Z가-힣 ]{1,19}$/;
		
		if(name == '') {
			$('.join_user_name_ck').css('display', 'block');
			$('.join_user_name_val').css('display', 'none');
			nameCheck = false;
		}
		else {
			
			if(!nameval.test(name)) {
				$('.join_user_name_ck').css('display', 'none');
				$('.join_user_name_val').css('display', 'block');
				nameCheck = false;
			}
			else {
				$('.join_user_name_ck').css('display', 'none');
				$('.join_user_name_val').css('display', 'none');
				nameCheck = true;
			}
			
		}
				
	});
	
	// Birth date check & validate
	
	$('.birth_input').on("propertychange change keyup paste input", function(){
		
		var birth = $('.birth_input').val();
		
		var birthYear = Number(birth.split("-")[0]);
		var birthMonth = Number(birth.split("-")[1]);
		var birthDay = Number(birth.split("-")[2]);
	
		var today = new Date();
		
		var todayYear = today.getFullYear();
		var todayMonth = today.getMonth() + 1;
		var todayDay = today.getDate();
		
		// console.log("birth year : " + birthYear);	// Default : 0
		// console.log("birth month : " + birthMonth);	// Default : NaN
		// console.log("birth day : " + birthDay);		// Default : NaN
		
		if((birthYear == 0) || (isNaN(birthMonth)) || (isNaN(birthDay))) {
			$('.join_user_birth_ck').css('display', 'block');
			birthCheck = false;
		}
		else {
			
			// Do not allow future
			
			if(birthYear > todayYear) {
				$('.join_user_birth_ck').css('display', 'block');
				birthCheck = false;
			}
			else if(birthYear == todayYear) {
				
				if(birthMonth > todayMonth) {
					$('.join_user_birth_ck').css('display', 'block');
					birthCheck = false;
				}
				else if(birthMonth == todayMonth) {
					
					if(birthDay > todayDay) {
						$('.join_user_birth_ck').css('display', 'block');
						birthCheck = false;
					}
					else {
						$('.join_user_birth_ck').css('display', 'none');
						birthCheck = true;
					}
					
				}
				else {
					$('.join_user_birth_ck').css('display', 'none');
					birthCheck = true;
				}
			}
			
			else {
				if(birthYear < 1900) {
					$('.join_user_birth_ck').css('display', 'block');
					birthCheck = false;
				}
				else {
					$('.join_user_birth_ck').css('display', 'none');
					birthCheck = true;
				}
			}
			
		}
				
	});
	
	// Gender check
	
	$('.gender_input').on("propertychange change keyup input", function(){
		
		var gender = $('.gender_input').val();
		
		if(gender == '') {
			$('.join_user_gender_ck').css('display', 'block');
			genderCheck = false;
		}
		else {
			$('.join_user_gender_ck').css('display', 'none');
			genderCheck = true;
		}
		
	});
	
	// Phone Number validate
	
	$('.phone_number_input').on("propertychange change keyup paste input", function(){
		
		var phoneNumber = $('.phone_number_input').val();
		var phoneNumberVal = /^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$/;
		
		if(phoneNumber == '') {
			$('.join_user_phone_number_ck').css('display', 'block');
			$('.join_user_phone_number_val').css('display', 'none');
			phoneNumberCheck = false;
		}
		else {
			
			if(!phoneNumberVal.test(phoneNumber)) {
				$('.join_user_phone_number_ck').css('display', 'none');
				$('.join_user_phone_number_val').css('display', 'block');
				phoneNumberCheck = false;
			}
			else {
				$('.join_user_phone_number_ck').css('display', 'none');
				$('.join_user_phone_number_val').css('display', 'none');
				phoneNumberCheck = true;
			}
			
		}
				
	});
	
	// Email validate
	
	$('.email_input').on("propertychange change keyup paste input", function(){
		
		var email = $('.email_input').val();
		var emailVal = /^[a-zA-Z0-9-_\.]{1,}@[a-zA-Z0-9]{1,}\.[a-zA-Z0-9]{2,3}$/;
		
		if(email == '') {
			$('.join_user_email_ck').css('display', 'block');
			$('.join_user_email_val').css('display', 'none');
			emailCheck = false;
		}
		else {
			
			if(!emailVal.test(email)) {
				$('.join_user_email_ck').css('display', 'none');
				$('.join_user_email_val').css('display', 'block');
				emailCheck = false;
			}
			else {
				$('.join_user_email_ck').css('display', 'none');
				$('.join_user_email_val').css('display', 'none');
				emailCheck = true;
			}
			
		}
				
	});

	// Address validate
	
	$('.address_input').on("propertychange change keyup paste input", function(){
		
		var address = $('.address_input').val();
		var addressVal = /^[0-9a-zA-Zㄱ-힣\n\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\" ]*$/;
		
		if(address == '') {
			$('.join_user_address_ck').css('display', 'block');
			$('.join_user_address_val').css('display', 'none');
			addressCheck = false;
		}
		else {
			
			if(!addressVal.test(address)) {
				$('.join_user_address_ck').css('display', 'none');
				$('.join_user_address_val').css('display', 'block');
				addressCheck = false;
			}
			else {
				$('.join_user_address_ck').css('display', 'none');
				$('.join_user_address_val').css('display', 'none');
				addressCheck = true;
			}
			
		}
				
	});
	
</script>

<%@include file="./includes/footer.jsp"%>