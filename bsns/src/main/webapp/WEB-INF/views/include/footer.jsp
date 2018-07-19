<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>


<!-- ==============================================
Navbar Second Section
=============================================== -->
<sec:authentication property="principal" var="pinfo"/>
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
         <div class="p-2 nav-icon-lg dark-black">
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
            <a class="nav-icon" href="/member/profile?mid=${pinfo.username }"><em class="fa fa-user"></em>
                <span>Profile</span>
            </a>
        </div>
    </div>
</section>



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
    