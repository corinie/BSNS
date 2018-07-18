<%@include file="../include/header.jsp" %>


<!-- ==============================================
News Feed Section
=============================================== -->
<section class="newsfeed">
    <div class="container">
        <div class="row one-row">
            <div class="col-lg-12">
                <h4>Explore Section</h4>
            </div>
        </div>
		
        <div class="row">
        	<c:forEach items="${list }" var="item">
        	
            <div class="col-lg-4">
                <a href="/board/view?bno=${item.bno }" data-toggle="modal">
                    <div class="explorebox"
                         style="background: linear-gradient( rgba(34,34,34,0.2), rgba(34,34,34,0.2)), url('/display?fileName=${item.pvo[0].ppath}/${item.pvo[0].uuid}_${item.pvo[0].pname }') no-repeat;
		          background-size: cover;
                  background-position: center center;
                  -webkit-background-size: cover;
                  -moz-background-size: cover;
                  -o-background-size: cover;">
                        <div class="explore-top">
                            <div class="explore-like"><i class="fa fa-heart"></i></div>
                            
                        </div>
                        
                    </div>
                </a>
            </div><!--/ col-lg-4 -->
            </c:forEach>
        </div><!--/ row -->

    </div><!--/ container -->
</section><!--/ newsfeed -->

<%@include file="../include/footer.jsp" %>


