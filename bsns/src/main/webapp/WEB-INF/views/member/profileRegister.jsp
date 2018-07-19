<%@include file="../include/header.jsp"%>

	<!-- ==============================================
Navbar Second Section
=============================================== -->
	<section class="nav-sec">
		<div class="d-flex justify-content-between">
			<div class="p-2 nav-icon-lg dark-black">
				<a class="nav-icon" href="photo_home.html"><em
					class="fa fa-home"></em> <span>Home</span> </a>
			</div>
			<div class="p-2 nav-icon-lg mint-green">
				<a class="nav-icon" href="/board/list"><em
					class="fa fa-crosshairs"></em> <span>Explore</span> </a>
			</div>

			<div class="p-2 nav-icon-lg clean-black">
				<a class="nav-icon" href="photo_stories.html"><em
					class="fa fa-align-left"></em> <span>Stories</span> </a>
			</div>
			<div class="p-2 nav-icon-lg dark-black">
				<a class="nav-icon" href="photo_profile.html"><em
					class="fa fa-user"></em> <span>Profile</span> </a>
			</div>
		</div>
	</section>

	<!-- ==============================================
	 News Feed Section
	 =============================================== -->
	<section class="upload">
		<div class="container">

			<div class="row">
				<div class="col-lg-12">

					<div class="box">
							<div class="box-footer clearfix">
								<a href="/member/profile"><button class="kafe-btn kafe-btn-mint-small pull-right btn-sm">Upload</button></a>
								<div class="file-area">
									<input id="fileInput" type="file" multiple>
									<div id="upload">
										<div class="uploadList"></div>
									</div>
								</div>
							</div>
					</div>

				</div>
			</div>

			<div class="row one-row">
				<div class="col-lg-12">
				 <h4>Instagram Filters from Picture Pan 2</h4>
				</div>
			</div>
		</div>
	</section>




	
	

	<script src="https://code.jquery.com/jquery-3.3.1.min.js"
		integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
		crossorigin="anonymous"></script>
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
	<script type="text/javascript">
		var files = "";
		var formData = "";
		var str = "";
		var upstr = "";
		var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
		var maxSize = 5242880; //5MB	
		var displayHeight = document.documentElement.clientHeight;

		$("#fileInput").change(function(e) {

			/* var files = e.originalEvent.dataTransfer.files; */

			files = e.target.files;
			uploadAjax(files);
		});

		$(".uploadList").on("click", "span", function(e) {
			var targetFile = $(this).data("file");
			var type = $(this).data("type");
			
			setCSRF(csrftoken);
			
			$.ajax({
				url : "/deleteFile",
				data : {
					fileName : targetFile,
					type : type
				},
				dataType : 'text',
				type : 'post',
				success : function(result) {
					$(e.target).parent("div").remove();
				}
			});
		});

		function uploadAjax(files) {
			formData = new FormData();
			// file upload size, extension option
			for (var i = 0; i < files.length; i++) {
				if (!checkExtension(files[i].name, files[i].size)) {
					return false;
				}
				formData.append("uploadFile", files[i]);
			}
			
			setCSRF(csrftoken);
			
			$.ajax({
				url : "/uploadProfile",
				type : "POST",
				data : formData,
				dataType : 'json',
				processData : false,
				contentType : false,
				success : function(result) {
					console.log(result);
					showUploadedFile(result);

				}
			});
		}

		function showUploadedFile(uploadResultArr) {
			upstr = "";
			$(uploadResultArr)
					.each(
							function(i, obj) {
								console.log(obj);
								var fileCallPath = encodeURIComponent(obj.path
										+ "/s_" + obj.uuid + "_" + obj.pname);
								var originalFile = encodeURIComponent(obj.path
										+ "/" + obj.uuid + "_" + obj.pname);
								upstr += "<div>"
										+ "<img class='file_image' src='/display?fileName="
										+ fileCallPath
										+ "' data-fileLink='/display?fileName="
										+ originalFile
										+ "'>"
										+ "<br>"
										+ obj.pname
										+ "<span data-file=\'"+fileCallPath+"\' data-type='image' data-uuid="+obj.uuid+"> x </span>"
										+ "<input type='hidden' name='uuid' value='"+obj.uuid+"'>"
										+ "</div>";

							});
			$(".uploadList").append(upstr);
		}

		function checkExtension(fileName, fileSize) {

			if (fileSize >= maxSize) {
				alert("파일 사이즈 초과");
				return false;
			}

			if (regex.test(fileName)) {
				alert("해당 종류의 파일은 업로드할 수 없습니다.");
				return false;
			}
			return true;
		}
	</script>
<%@include file="../include/footer.jsp"%>
