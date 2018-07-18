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

var bno="";
var imageStr="";
var imageStr2="";
$(".explorebox").on("click", function(){
	console.log("눌렀다ㅋ");
	bno = $(this).attr("data-bno");
	
	
	
	
	$.getJSON("/boardrest/list?bno="+bno, function(data){
		console.log(data.bno);
		console.log(data.pvo[0].ppath);
		
		console.log(data.pvo[0].uuid);
		console.log(data.pvo[0].pname);
		
		imageStr2 += "<div class='explorebox'"
				  + "style='background: linear-gradient( rgba(34,34,34,0.2), rgba(34,34,34,0.2))," 
			      + "url('/display?fileName="+data.pvo[0].ppath+"/"+data.pvo[0].uuid+"_"+data.pvo[0].pname+"')>";
  		
		imageStr += "<div class='row'>"
				 +"<div align='center'>"
				 +"<a href='#' id='prev'><button><<</button></a>"
				 +"<a href='#' id='next'><button>>></button></a>"
			 	 +"</div>"
				 +"<div class='col-md-8 modal-image'>"
				 +"<div class='cycle-slideshow' data-cycle-fx='scrollHorz' data-cycle-timeout='0' data-cycle-prev='#prev' data-cycle-next='#next'>";
				 for(var i=0; i<data.pvo.length; i++){
					 imageStr += "<img class='img-responsive' src='/display?fileName="+data.pvo[i].ppath+"/"+data.pvo[i].uuid+"_"+data.pvo[i].pname+"'>"; 
				 }
		
		imageStr +="</div></div>"
				 +"<div class='col-md-4 modal-meta'>"
				 +"<div class='modal-meta-top'>"
				 +"<button type='button' class='close' data-dismiss='modal' aria-hidden='true'>"
				 +"<span aria-hidden='true'>×</span><span class='sr-only'>Close</span>"
				 +"</button>"
				 +"<div class='img-poster clearfix'>"
				 +"<a href=''><img class='img-responsive img-circle' src='assets/img/users/18.jpg' alt='Image' /></a> "
				 +"<strong><a href=''>"+data.writer+"</a></strong> <span>12 minutes ago</span><br />"
				 +"<a href='' class='kafe kafe-btn-mint-small'>"
				 +"<i class='fa fa-check-square'></i> Following</a><br>";
				 +"<div><p>"+data.content+"</p></div>"
				 for(var i=0; i<data.hvo.length; i++){
					 imageStr += "<span>"+data.hvo[i].tagname+"</span>";
				 }
				 
		imageStr +="</div><ul class='img-comment-list'></ul>"
				 +"<div class='modal-meta-bottom'>"
				 +"<ul><li>"
				 +"<div class='comment-body'>"
				 +"<input class='form-control input-sm' type='text' placeholder='Write your comment...'>"
				 +"</div>"
				 +"</li></ul>"
				 +"</div></div></div></div>";
		
		$(".modal-body").html(imageStr);
		
		imageStr = "";
		
		
	});
	
	
	
	
});
</script>
<script>
	
	var page = 1;
	var str = ""
	
	$(window).scroll(function() {
		
		if($(window).scrollTop() == $(document).height() - $(window).height()) {
			
			page++;
			
			$.getJSON("/boardrest/scrolllist/"+page, function(data){
				
				console.log(data);
				
				$(data).each(function () {
					
					var url = "/display?fileName="+this.pvo[0].ppath+"/"+this.pvo[0].uuid+"_"+this.pvo[0].pname;
					
					console.log("/display?fileName="+this.pvo[0].ppath+"/"+this.pvo[0].uuid+"_"+this.pvo[0].pname);
					
					str  += "<div class='col-lg-4'>"
						 +"<a href='/board/view?bno="+this.bno+"&page="+page+"' data-toggle='modal'>"
						 +"<div class='explorebox' id='"+this.bno+"' style='background: linear-gradient( rgba(34,34,34,0.2), rgba(34,34,34,0.2)), url("+url+") no-repeat;"
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
				console.log(str+"dsfasdfasdfsdagsdgesd");
				console.log($(".row").html());
				str = "";
			});			
		}
	});
	
	
	
	
	
</script>



<%@include file="../include/footer.jsp"%>

