<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../includes/header.jsp" %>

<div class="container">
	<div class="panel-body" style="padding-top: 0px;">
		<button id="userBtn" type="button" class="btn btn-primary pull-right" onclick="location.href='/common/info'">계정</button>
	</div>
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">
			
					<b>시설 목록</b>
					
					<div class="btn-group pull-right" style="margin-top:-8px;">
						<button type="button" class="btn btn-info" onclick="location.href='/common/personalResList'">개인 예약 조회</button>
					</div>
																					
				</div>
				<!-- /.panel-heading -->
						
				<div class="panel-body">
				
					<table class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th style="text-align:center;">시설명</th>
								<th style="text-align:center;">예약</th>
							</tr>
						</thead>
						
						<c:forEach items="${place}" var="place">
							<tr>
								<td>
									<a class="move_place" href='<c:out value="${place.pid}" />'>
										<c:out value="${place.name}" />	
									</a>						
								</td>
								<td style="text-align:center;">
									<a class="move_res" href='<c:out value="${place.pid}" />'>
										>>>					
									</a>
								</td>
							</tr>
						</c:forEach>
					</table>
					
					<div class='row'>
						<div class="col-lg-12">
						
							<form id='searchForm' action="/common/list" method='get'>
							
								<select name='type'>
									<option value="T"
									<c:out value="${pageMaker.cri.type eq 'T' ? 'selected' : ''}" />>
										종류
									</option>
								</select> 
								
								<input type='text' name='keyword' value='<c:out value="${pageMaker.cri.keyword}" />' />
								<input type='hidden' name='pageNum' value='<c:out value="${pageMaker.cri.pageNum}"/>' />
								<input type='hidden' name='amount' value='<c:out value="${pageMaker.cri.amount}"/>' />
								
								<button class='btn btn-default'>검색</button>
								
							</form>
							
						</div>
					</div>
					
					
					<div class='pull-right'>
						<ul class="pagination">
	
							<c:if test="${pageMaker.prev}">
								<li class="paginate_button previous">
									<a href="${pageMaker.startPage - 1}">이전</a>
								</li>
							</c:if>
	
							<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
								<li class="paginate_button ${pageMaker.cri.pageNum == num ? "active" : ""}" >
									<a href="${num}">${num}</a>
								</li>
							</c:forEach>
	
							<c:if test="${pageMaker.next}">
								<li class="paginate_button next">
									<a href="${pageMaker.endPage + 1}">다음</a>
								</li>
							</c:if>
	
						</ul>
					</div>
					<!--  end Pagination -->
					
					<form id='actionForm' action="/common/list" method='get'>
						<input type='hidden' name='pageNum' value='<c:out value="${pageMaker.cri.pageNum}" />'>
						<input type='hidden' name='amount' value='<c:out value="${pageMaker.cri.amount}" />'>
						<input type='hidden' name='type' value='<c:out value="${pageMaker.cri.type}" />'>
						<input type='hidden' name='keyword' value='<c:out value="${pageMaker.cri.keyword}" />'>
					</form>
																					
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
						
		// For paging
		
		var actionForm = $("#actionForm");

		$(".paginate_button a").on("click", function(e) {
			
			e.preventDefault();
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.submit();
			
		});
		
		// Get one board page
		
		$(".move_place").on("click",function(e) {
			
			e.preventDefault();
			actionForm.append("<input type='hidden' name='pid' value='" + $(this).attr("href") + "'>");
			actionForm.attr("action", "/common/get");
			actionForm.submit();
			
		});
		
		// Get one reservation page
		
		$(".move_res").on("click",function(e) {
			
			e.preventDefault();
			actionForm.append("<input type='hidden' name='pid' value='" + $(this).attr("href") + "'>");
			actionForm.attr("action", "/common/resList");
			actionForm.submit();
			
		});
		
		// For search
		
		var searchForm = $("#searchForm");
		
		$("#searchForm button").on("click", function(e) {
	 
			if(!searchForm.find("input[name='keyword']").val()) {
				alert("키워드를 입력하세요");
				return false;
			}

			searchForm.find("input[name='pageNum']").val("1");
			e.preventDefault();

			searchForm.submit();

		});

	});
	
</script>

<%@include file="../includes/footer.jsp"%>


