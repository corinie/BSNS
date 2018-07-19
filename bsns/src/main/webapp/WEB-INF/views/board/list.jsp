
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<%@include file="../include/header.jsp"%>
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
					<div align="center">
						<a href="#" id="prev"><button>prev</button></a>
						<a href="#" id="next"><button>next</button></a>
					</div>
					<div class="cycle-slideshow"  data-cycle-fx="scrollHorz" data-cycle-timeout="0" data-cycle-prev="#prev" data-cycle-next="#next">
					
					</div>
					</div>
					<div class="col-md-4 modal-meta">
						<div class="modal-meta-top">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
							<div class="img-poster clearfix">
							</div>
							<ul class="img-comment-list">
							</ul>
							<div class="modal-meta-bottom">
								<ul>
									<li><a class="modal-comment" href="#">
									<i class="fa fa-comments"></i></a><span> 786,286</span></li>
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
						</div>
					</div>
				</div>
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
<script src="http://malsup.github.io/jquery.cycle2.js"></script>
<script>
	var csrftoken = "${_csrf.token}";
	var userName = "${userName}";

	function setCSRF(tokenValue) {

		$.ajaxSetup({
			headers : {
				'X-CSRF-TOKEN' : tokenValue
			}
		});
	}
</script>
<script>



var bno="";
var imageStr="";
var imageStr2="";
var imageStr3="";

$(".col-lg-4").on("click", ".explorebox", function(){
	
	bno = $(this).attr("data-bno");
	
	$.getJSON("/boardrest/list?bno="+bno, function(data){
	
		
		for(var i=0; i<data.pvo.length; i++){
			imageStr += "<img class='img-responsive' src='/display?fileName="+data.pvo[i].ppath+"/"+data.pvo[i].uuid+"_"+data.pvo[i].pname+"'>"; 
		}
		
		imageStr +="</div></div>";
		
		
		imageStr2 +="<a href=''><img class='img-responsive img-circle' src='assets/img/users/18.jpg' alt='Image' /></a> "
				 +"<strong><a href=''>"+data.writer+"</a></strong> <span>12 minutes ago</span><br />"
				 +"<a href='' class='kafe kafe-btn-mint-small'>"
				 +"<i class='fa fa-check-square'></i> Following</a><br>";
				 +"<div><p>"+data.content+"</p></div>"
				 for(var i=0; i<data.hvo.length; i++){
					 imageStr2 += "<span>"+data.hvo[i].tagname+"</span>";
				 }
				 
		imageStr2 +="</div>";
	
		$(".cycle-slideshow").html(imageStr);
		$(".img-poster").html(imageStr2);
		
		getAllList();
		
		imageStr = "";
		imageStr2 = "";
	});
});

var comment = $("#comment");
var commenter = $("#commenter");

$("#sendBtn").on("click", function(e){
	
	setCSRF(csrftoken);
	
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
		str = "";
	});
	
}

</script>
<script>
	
	var page = 1;
	var str = ""
	
	$(window).scroll(function() {
		
		if($(window).scrollTop() == $(document).height() - $(window).height()) {
			
			page++;
			
			$.getJSON("/boardrest/scrolllist/"+page, function(data){
			
				$(data).each(function () {
					
					var url = "/display?fileName="+this.pvo[0].ppath+"/"+this.pvo[0].uuid+"_"+this.pvo[0].pname;
					
					console.log("/display?fileName="+this.pvo[0].ppath+"/"+this.pvo[0].uuid+"_"+this.pvo[0].pname);
					
					str  += "<div class='col-lg-4'>"
						 +"<a href='#myModal' data-toggle='modal'>"
						 +"<div class='explorebox' data-bno='"+this.bno+"' style='background: linear-gradient( rgba(34,34,34,0.2), rgba(34,34,34,0.2)), url("+url+") no-repeat;"
          		         +"background-size: cover; "
                         +"background-position: center center; "
                         +"-webkit-background-size: cover; "
                         +"-moz-background-size: cover; "
                         +"-o-background-size: cover;'>"
                         +"<div class='explore-top'>"
                         +"<div class='explore-like'><i class='fa fa-heart'></i></div>"
                         +"</div>"
                    	 +"</div>"
               		     +"</a>"
           			     +"</div>";		
				});
				$(".list-new").append(str);
				
				str = "";
			});			
		}
	});
	
	
	
	
	
</script>



<%@include file="../include/footer.jsp"%>

