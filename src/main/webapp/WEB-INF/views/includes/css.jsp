<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    
    <style type="text/css">
    
		body {
			margin-top: 10px;
		}
		
		.btn-bottom-margin {
			margin-bottom: 10px;
		}
		
		@media (min-width: 600px) {
    		.container{
    		    max-width: 600px;
			}
    	}
    	
    	hr {
			border: none;
			height: 1px;
			color: #ccc; /* old IE */
			background-color: #ccc; /* Modern Browsers */
    	}
		
		.join_manager_id_imposs,	
		.join_manager_id_ck,
		.join_manager_id_val,
		.join_manager_pw_ck,
		.join_manager_pw_val,
		.join_manager_pwck_ck,
		.join_manager_pwck_diff,
		.join_manager_name_ck,
		.join_manager_name_val,
		.join_manager_nickname_ck,
		.join_manager_nickname_val,
		.join_manager_birth_ck,
		.join_manager_gender_ck,
		.join_manager_phone_number_ck,
		.join_manager_phone_number_val,
		.join_manager_email_ck,
		.join_manager_email_val,
		.join_manager_address_ck,
		.join_manager_address_val {
			font-size: 0.85em;
			color: red;
			display: none;
		}
		
		.join_manager_id_poss,
		.join_manager_pwck_same {
			font-size: 0.85em;
			color: green;
			display: none;
		}
		
		.join_user_id_imposs,	
		.join_user_id_ck,
		.join_user_id_val,
		.join_user_pw_ck,
		.join_user_pw_val,
		.join_user_pwck_ck,
		.join_user_pwck_diff,
		.join_user_name_ck,
		.join_user_name_val,
		.join_user_birth_ck,
		.join_user_gender_ck,
		.join_user_phone_number_ck,
		.join_user_phone_number_val,
		.join_user_email_ck,
		.join_user_email_val,
		.join_user_address_ck,
		.join_user_address_val {
			font-size: 0.85em;
			color: red;
			display: none;
		}
		
		.join_user_id_poss,
		.join_user_pwck_same {
			font-size: 0.85em;
			color: green;
			display: none;
		}
		
		.manager_place_register_name_imposs,
		.manager_place_register_name_ck,
		.manager_place_register_name_val,
		.manager_place_register_address_ck,
		.manager_place_register_address_val,
		.manager_place_register_notice_val,
		.manager_place_register_re_reg_cycle_val,
		.manager_place_register_team_val,
		.manager_place_register_reg_cycle_time_ck,
		.manager_place_register_reg_cycle_time_val {
			font-size: 0.85em;
			color: red;
			display: none;
		}
		
		.cycle-form-group input {
			text-align: center;
			<%-- background-color: #e2e2e2; --%>
			border: 1px solid #ccc;
			border-radius: 4px;
          	box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
		}
		.cycle-form-group input:focus {
  			border-color: #66afe9;
  			outline: 0;
  			-webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075), 0 0 8px rgba(102, 175, 233, .6);
          			box-shadow: inset 0 1px 1px rgba(0,0,0,.075), 0 0 8px rgba(102, 175, 233, .6);
		}
		
		.manager_place_register_name_poss {
			font-size: 0.85em;
			color: green;
			display: none;		
		}
		
		.manager_place_modify_name_imposs,
		.manager_place_modify_name_ck,
		.manager_place_modify_name_val,
		.manager_place_modify_address_ck,
		.manager_place_modify_address_val,
		.manager_place_modify_notice_val,
		.manager_place_modify_re_reg_cycle_val,
		.manager_place_modify_team_val,
		.manager_place_modify_reg_cycle_time_ck,
		.manager_place_modify_reg_cycle_time_val {
			font-size: 0.85em;
			color: red;
			display: none;
		}
		
		.manager_place_modify_name_poss {
			font-size: 0.85em;
			color: green;
			display: none;		
		}
		
				
		.manager_get_panel_content_hidden,
		.user_get_panel_content_hidden {
			display: block;
		}
		
		.manager_get_panel_content_display,
		.user_get_panel_content_display {
			display: none;
		}
		
		.cus-cycle-form-group input {
			text-align: center;
			border: 1px solid #ccc;
			border-radius: 4px;
          	box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
		}
		.cus-cycle-form-group input:focus {
  			border-color: #66afe9;
  			outline: 0;
  			-webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075), 0 0 8px rgba(102, 175, 233, .6);
          			box-shadow: inset 0 1px 1px rgba(0,0,0,.075), 0 0 8px rgba(102, 175, 233, .6);
		}
		
		.cus-readonly-cycle-form-group input {
			background-color: #eee;
			text-align: center;
			border: 1px solid #ccc;
			border-radius: 4px;
          	box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
		}
		.cus-readonly-cycle-form-group input:focus {
  			border-color: #66afe9;
  			outline: 0;
  			-webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075), 0 0 8px rgba(102, 175, 233, .6);
          			box-shadow: inset 0 1px 1px rgba(0,0,0,.075), 0 0 8px rgba(102, 175, 233, .6);
		}
		
		.manager_reservation_register_date_select_ck,
		.manager_reservation_register_date_select_val,
		.manager_reservation_register_time_select_ck,
		.manager_reservation_register_time_select_val,
		.manager_reservation_register_time_select_div {
			font-size: 0.85em;
			color: red;
			display: none;
		}
		
		.common_get_res_panel_content_hidden {
			display: block;
		}
		
		.common_get_res_panel_content_display {
			display: none;
		}
		
		.manager_get_res_panel_content_hidden {
			display: block;
		}
		
		.manager_get_res_panel_content_display {
			display: none;
		}
				   	    	
	</style>
