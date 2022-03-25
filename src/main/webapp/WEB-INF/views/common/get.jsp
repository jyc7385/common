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
						<b>시설 조회</b>
					</p>
				</div>
				<!-- /.panel-heading -->
				<div class="panel-body user_get_panel_content_hidden">
				
					<form role="form" action="/manager/modify" method="post">
					
						<%-- For paging with pageNum and amount --%>
						<input type='hidden' class="pagenum_input" name='pageNum' value='<c:out value="${cri.pageNum}" />'>
						<input type='hidden' class="amount_input" name='amount' value='<c:out value="${cri.amount}" />'>
						<input type='hidden' class="type_input" name='type' value='<c:out value="${cri.type}" />'>
						<input type='hidden' class="keyword_input" name='keyword' value='<c:out value="${cri.keyword}" />'>

						<div class="form-group">
							<label>시설 ID</label>
							<input class="form-control" name='pid' value='<c:out value="${place.pid}"/>' readonly="readonly">
						</div>
										        						
						<div class="form-group">
							<label>시설명</label>
							<input class="form-control name_input" name='name' value='<c:out value="${place.name}"/>' readonly="readonly">
						</div>
												
						<div class="form-group">
							<label>관리자</label>
							<input class="form-control" name='nickName' value='<c:out value="${place.nickName}"/>' readonly="readonly">
						</div>
						
						<div class="form-group">
							<label>시설 주소</label>
							<textarea class="form-control" name="address" rows="2" style="resize: none;" readonly="readonly"><c:out value="${place.address}"/></textarea>
						</div>
						
						<div class="form-group">
							<label>공지사항</label>
							<textarea class="form-control" name="notice" rows="10" style="resize: none;" readonly="readonly"><c:out value="${place.notice}"/></textarea>
						</div>								          	

					</form>
	
				</div>
				<!--  end panel-body -->
				
				<div class="panel-body user_get_panel_content_display">
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
		
		var preName = $('.name_input').val();
		
		if(preName == '') {
			$('.user_get_panel_content_hidden').css('display', 'none');
			$('.user_get_panel_content_display').css('display', 'block');
		}
		
		$('.list_button').on("click", function(e){
		    
			e.preventDefault(); 
		    
			formObj.attr("action", "/common/list").attr("method", "get");
		      
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
					
	});
		
</script>

<%@include file="../includes/footer.jsp"%>