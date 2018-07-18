<%@include file="../include/header.jsp"%>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
​



	
	<!-- ==============================================
	 Modal Section
	 =============================================== -->
	<section class="single-post">
		<div class="container">
			<div class="row">
				<div>
					<div class="modal-content">
						<div class="modal-body">
							<div class="row">
								<div class="col-md-8 modal-image">
								<a href="/board/list?page=${param.page }"><button>Back</button></a>
								<div align="center">
								<a href="#" id="prev"><button><<</button></a>
								<a href="#" id="next"><button>>></button></a>
								</div>
									
									<div class="cycle-slideshow"  data-cycle-fx="scrollHorz" data-cycle-timeout="0" data-cycle-prev="#prev" data-cycle-next="#next">
										<c:forEach items="${vo.pvo}" var="photo">
										<img class="img-responsive"
											src="/display?fileName=${photo.ppath}/${photo.uuid}_${photo.pname }" />
										</c:forEach>
									</div>
									
								</div>
								
								<!--/ col-md-8 -->


								<div class="col-md-4 modal-meta">
									<div class="modal-meta-top">
										<button type="button" class="close" data-dismiss="modal"
											aria-hidden="true">
											
										</button>
										<!--/ button -->

										<div class="img-poster clearfix">
											<a href=""><img class="img-responsive img-circle"
												src="/resources/image/1.png"  /></a> <strong><a
												href="">${vo.writer }</a></strong> <span>12 minutes ago</span><br />
											<a href="" class="kafe kafe-btn-mint-small"><i
												class="fa fa-check-square"></i> Favorite</a><br>
											<div>${vo.content }</div>
											<c:forEach items="${vo.hvo }" var="tag">
											<c:set var="keyword" value="${tag.tagname }"/>
												<c:forEach items="${fn:split(keyword,'#')}" var="tag2">
													<span><a href="/board/hlist?tagname=${tag2}">${tag.tagname }</a></span>
												</c:forEach>
											</c:forEach>
										</div>
										<!--/ img-poster -->


										<ul class="img-comment-list">
											
										</ul>
										<!--/ comment-list -->

										<div class="modal-meta-bottom">
											<ul>
												<li><a class="modal-comment" href="#"><i
														class="fa fa-comments"></i></a><span> 786,286</span></li>
												<li>
													<div class="comment-body">
														<input class="form-control input-sm" type="text"
															placeholder="Write your name..." id="commenter" data-bno="${param.bno }">
														<input class="form-control input-sm" type="text"
															placeholder="Write your comment..." id="comment">
													</div>
												</li>
											</ul>
											<button id="sendBtn">Send</button>
										</div>
										<!--/ modal-meta-bottom -->

									</div>
									<!--/ modal-meta-top -->
								</div>
								<!--/ col-md-4 -->

							</div>
							<!--/ row -->
						</div>
						<!--/ modal-body -->

					</div>
					<!--/ modal-content -->
				</div>
				<!--/ modal-dialog -->

			</div>
			<!--/ modal-dialog -->
		</div>
		<!--/ modal-dialog -->
	</section>
	<!--/ modal -->

	
	<script src="http://malsup.github.io/jquery.cycle2.js"></script>
	
	<script type="text/javascript">
		$('#Slim,#Slim2').slimScroll({
			height : "auto",
			position : 'right',
			railVisible : true,
			alwaysVisible : true,
			size : "8px",
		});
	</script>
	<script>
		
		$(document).ready(function(){
			getAllList();
		});
		var comment = $("#comment");
		var commenter = $("#commenter");
		var bno = commenter.data("bno");
		var str = "";
		
		$("#sendBtn").on("click", function(){
			
			$.ajax({
				url : "/comment/register/"+bno,
				type : "POST",
				dataType : "text",
				headers : {
					"Content-Type" : "application/json"
				},
				data : JSON.stringify({
					comment : comment.val(),
					commenter : commenter.val(),
				}),
				success : function (result) {
					if(result == 'rsuccess'){
						alert("댓글 작성 성공");
						getAllList();
					}
				}
			});
		});
		
		function getAllList(){
			$.getJSON("/comment/list/"+bno, function(data){
				$(data).each(function(){
					str += "<li><div class='comment-img'>"
						+"<img src='/resources/image/1.png' class='img-responsive img-circle' />"
						+"</div>"
						+"<div class='comment-text'>"
						+"<strong><a href=''>"+this.commenter+"</a></strong>"
						+"<p>"+this.comment+"</p>"
						+"<span class='date sub-text'>"+this.regdate+"</span>"
						+"</div></li>";
				});
				$(".img-comment-list").html(str);
			});
		}
	</script>
	

<%@include file="../include/footer.jsp"%>
