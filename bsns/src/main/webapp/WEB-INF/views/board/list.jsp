<%@include file="../include/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<section class="newsfeed">
	<div class="container">
		<div class="row one-row">
			<div class="col-lg-12">
				<h4>Explore Section</h4>
			</div>
		</div>

		<div class="row list-new">
			<c:forEach items="${list }" var="item">

				<div class="col-lg-4">
					<a href="#myModal" data-toggle="modal">
						<div class="explorebox" data-bno="${item.bno}"
							style="background: linear-gradient( rgba(34,34,34,0.2), rgba(34,34,34,0.2)), url('/display?fileName=${item.pvo[0].ppath}/${item.pvo[0].uuid}_${item.pvo[0].pname }') no-repeat;
		          background-size: cover;
                  background-position: center center;
                  -webkit-background-size: cover;
                  -moz-background-size: cover;
                  -o-background-size: cover;">
							<div class="explore-top">
								<div class="explore-like">
									<i class="fa fa-heart"></i>
								</div>

							</div>

						</div>
					</a>
				</div>
				<!--/ col-lg-4 -->
			</c:forEach>
		</div>
		<!--/ row -->

	</div>
	<!--/ container -->
</section>
<!--/ newsfeed -->

<!-- ==============================================
	 Modal Section
	 =============================================== -->
<div id="myModal" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-body">

				<div class="row">
					
					<div class="col-md-8 modal-image">
						<img class="img-responsive" src="https://www.fmkorea.com/files/attach/new/20180417/486616/41170129/1021006724/554449902566a4417eee09a4fdb7bd79.jpg">
					</div>
					<!--/ col-md-8 -->
					<div class="col-md-4 modal-meta">
						<div class="modal-meta-top">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">
								<span aria-hidden="true">×</span><span class="sr-only">Close</span>
							</button>
							<!--/ button -->
							<div class="img-poster clearfix">
								<a href=""><img class="img-responsive img-circle"
									src="assets/img/users/18.jpg" alt="Image" /></a> <strong><a
									href="">Benjamin</a></strong> <span>12 minutes ago</span><br /> <a
									href="" class="kafe kafe-btn-mint-small"><i
									class="fa fa-check-square"></i> Following</a>
							</div>
							<!--/ img-poster -->

							<ul class="img-comment-list">
								<li>
									<div class="comment-img">
										<img src="assets/img/users/17.jpeg"
											class="img-responsive img-circle" alt="Image" />
									</div>
									<div class="comment-text">
										<strong><a href="">Anthony McCartney</a></strong>
										<p>Hello this is a test comment.</p>
										<span class="date sub-text">on December 5th, 2016</span>
									</div>
								</li>
								<!--/ li -->
								<li>
									<div class="comment-img">
										<img src="assets/img/users/15.jpg"
											class="img-responsive img-circle" alt="Image" />
									</div>
									<div class="comment-text">
										<strong><a href="">Vanessa Wells</a></strong>
										<p>Hello this is a test comment and this comment is
											particularly very long and it goes on and on and on.</p>
										<span>on December 5th, 2016</span>
									</div>
								</li>
								<!--/ li -->
								<li>
									<div class="comment-img">
										<img src="assets/img/users/14.jpg"
											class="img-responsive img-circle" alt="Image" />
									</div>
									<div class="comment-text">
										<strong><a href="">Sean Coleman</a></strong>
										<p class="">Hello this is a test comment.</p>
										<span class="date sub-text">on December 5th, 2016</span>
									</div>
								</li>
								<!--/ li -->
								<li>
									<div class="comment-img">
										<img src="assets/img/users/13.jpeg"
											class="img-responsive img-circle" alt="Image" />
									</div>
									<div class="comment-text">
										<strong><a href="">Anna Morgan</a></strong>
										<p class="">Hello this is a test comment.</p>
										<span class="date sub-text">on December 5th, 2016</span>
									</div>
								</li>
								<!--/ li -->
								<li>
									<div class="comment-img">
										<img src="assets/img/users/3.jpg"
											class="img-responsive img-circle" alt="Image" />
									</div>
									<div class="comment-text">
										<strong><a href="">Allison Fowler</a></strong>
										<p class="">Hello this is a test comment.</p>
										<span class="date sub-text">on December 5th, 2016</span>
									</div>
								</li>
								<!--/ li -->
							</ul>
							<!--/ comment-list -->

							<div class="modal-meta-bottom">
								<ul>
									<li><a class="modal-like" href="#"><i
											class="fa fa-heart"></i></a><span class="modal-one">
											786,286</span> | <a class="modal-comment" href="#"><i
											class="fa fa-comments"></i></a><span> 786,286</span></li>
									<li><span class="thumb-xs"> <img
											class="img-responsive img-circle"
											src="assets/img/users/13.jpeg" alt="Image">
									</span>
										<div class="comment-body">
											<input class="form-control input-sm" type="text"
												placeholder="Write your comment...">
										</div>
										<!--/ comment-body --></li>
								</ul>
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
<!--/ modal -->

<script
  src="https://code.jquery.com/jquery-3.3.1.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous"></script>
<script>
var bno="";
var imageStr="";
var imageStr2="";
$(".explorebox").on("click", function(){
	console.log("눌렀다ㅋ");
	bno = $(".explorebox").attr("data-bno");
	
	
	
	
	$.getJSON("/boardrest/list?bno="+bno, function(data){
		console.log(data.bno);
		console.log(data.pvo[0].ppath);
		
		console.log(data.pvo[0].uuid);
		console.log(data.pvo[0].pname);
		
		imageStr2 += "<div class='explorebox'"
			+ "style='background: linear-gradient( rgba(34,34,34,0.2), rgba(34,34,34,0.2))," 
			+ "url('/display?fileName="+data.pvo[0].ppath+"/"+data.pvo[0].uuid+"_"+data.pvo[0].pname+"')>";
  		
		imageStr += "<img src='/display?fileName="+data.pvo[0].ppath+"/"+data.pvo[0].uuid+"_"+data.pvo[0].pname+"'  background-size: cover;background-position: center center;-webkit-background-size: cover;-moz-background-size: cover;-o-background-size: cover;>";
		console.log(imageStr2);
		$(".col-md-8").html(imageStr2);
		
		
	});
	
	
	
	
});
</script>



<%@include file="../include/footer.jsp"%>

