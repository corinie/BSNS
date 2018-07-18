
<!-- ==============================================
Navbar Second Section
=============================================== -->
<section class="nav-sec">
    <div class="d-flex justify-content-between">
        <div class="p-2 nav-icon-lg dark-black">
            <a class="nav-icon" href="/home"><em class="fa fa-home"></em>
                <span>Home</span>
            </a>
        </div>
        <div class="p-2 nav-icon-lg dark-black">
            <a class="nav-icon" href="/board/list"><em class="fa fa-crosshairs"></em>
                <span>Explore</span>
            </a>
        </div>
         <div class="p-2 nav-icon-lg mint-green">
            <a class="nav-icon" href="/board/register"><em class="fa fa-plus"></em>
                <span>upload</span>
            </a>
        </div>

        <div class="p-2 nav-icon-lg clean-black">
            <a class="nav-icon" href="photo_stories.html"><em class="fa fa-align-left"></em>
                <span>Stories</span>
            </a>
        </div>
        <div class="p-2 nav-icon-lg dark-black">
            <a class="nav-icon" href="photo_profile.html"><em class="fa fa-user"></em>
                <span>Profile</span>
            </a>
        </div>
    </div>
</section>

<!-- ==============================================
News Feed Section
=============================================== -->

<script src="/resources/js/jquery.min.js"></script>
<script>
	
	var page = "";
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

<!-- ==============================================
Scripts
=============================================== -->
<script src="/resources/js/jquery.min.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
<script src="/resources/js/base.js"></script>
<script src="/resources/js/jquery.slimscroll.js"></script>
<script>
    $('#Slim,#Slim2').slimScroll({
        height:"auto",
        position: 'right',
        railVisible: true,
        alwaysVisible: true,
        size:"8px",
    });
</script>

</body>
</html>
    