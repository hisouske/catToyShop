<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>로그인페이지</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Favicon -->
<link rel="shortcut icon" type="image/x-icon"
	href="assets/img/favicon.png">

<!-- all css here -->
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/animate.css">
<link rel="stylesheet" href="assets/css/owl.carousel.min.css">
<link rel="stylesheet" href="assets/css/chosen.min.css">
<link rel="stylesheet" href="assets/css/meanmenu.min.css">
<link rel="stylesheet" href="assets/css/themify-icons.css">
<link rel="stylesheet" href="assets/css/ionicons.min.css">
<link rel="stylesheet" href="assets/css/bundle.css">
<link rel="stylesheet" href="assets/css/style.css">
<link rel="stylesheet" href="assets/css/responsive.css">
<script src="assets/js/vendor/modernizr-2.8.3.min.js"></script>
</head>

<script type="text/javascript">

	$(document).ready(function() {

		var sign = document.all.sign.value;
		if(sign!=""){
		alert(sign);
		}
		
		$("#idchk").click(function() {
			var id = $("#chkid").val();
		
			if (id == "") {
				alert("id를 입력해주세요");
			} else {
				location.href = '${path}main.do?command=idchk&chkid=' + id;
			}
			
			
			
		});
	});
</script>
<body>
<input type="hidden" name="sign" value="${sign}">
	<div class="wrapper">
		<!-- header start -->
		<header>
			<div class="header-area transparent-bar">
				<div class="container">
					<div class="row">
						<div class="col-lg-2 col-md-2 col-sm-5 col-5">
							<div class="language-currency"></div>
							<div class="sticky-logo">
								<a href="main.do"><img src="assets/img/logo/2.png" alt="" /></a>
							</div>
							<div class="logo-small-device">
								<a href="main.do"><img alt="" src="assets/img/logo/logo.png"></a>
							</div>
						</div>
						<div class="col-lg-8 col-md-8 d-none d-md-block">
							<div class="logo-menu-wrapper text-center">
								<div class="logo">
									<a href="main.do"><img src="assets/img/logo/logo.png"
										alt="" /></a>
								</div>
								<div class="main-menu">
									<nav>
										<ul>
											<li><a href="main.do">home</a></li>

											<li><a href="main.do">category <i
													class="ion-ios-arrow-down"></i></a>
												<ul>
													<li><a href="#">장난감</a></li>
													<li><a href="#">사료</a></li>
													<li><a href="#">간식</a></li>
													<li><a href="#">건강보조제</a></li>
													<li><a href="#">모래</a></li>
												</ul></li>
											<li><a href="#">pages <i class="ion-ios-arrow-down"></i></a>
												<ul>

													<li><a href="cart.do?ccommand=cartpage&id=${id}">cart
															page</a></li>
													<li><a href="checkout.html">checkout</a></li>
													<li><a href="wishlist.html">wishlist</a></li>

													<li><a href="contact.html">contact</a></li>

												</ul></li>
										</ul>
									</nav>
								</div>
							</div>
						</div>
						<div class="col-lg-2 col-md-2 col-sm-7 col-7">
							<div class="header-site-icon">
								<%
									if (session.getAttribute("id") != null) {
										if (session.getAttribute("id").equals("admin")) {
								%>

								<div class="upload icon">
									<a href="#"> <img src="assets/img/upload.jpg" /></a>
								</div>
								<%
									}
									}
								%>
								<div class="header-search same-style">
									<button class="sidebar-trigger-search">
										<span class="ti-search"></span>
									</button>
								</div>
								<div class="header-login same-style">
									<a href="/jsp_project190925/main.do?command=login_page"> <span
										class="ti-user"></span>
									</a>
								</div>
								<div class="header-cart same-style">
									<button class="sidebar-trigger">
										<i class="ti-shopping-cart"></i> <span class="count-style">03</span>
									</button>
								</div>
							</div>

							<div class="main-menu">
								<%
									if (session.getAttribute("username") != null) {
								%>
								<%=session.getAttribute("username")%>님, 반갑습니다
								<%
									}
								%>
							</div>



						</div>
						<div class="mobile-menu-area col-12">
							<div class="mobile-menu">
								<nav id="mobile-menu-active">
									<ul class="menu-overflow">
										<li><a href="#">HOME</a>
											<ul>
												<li><a href="index.html">home version 1</a></li>
												<li><a href="index-2.html">home version 2</a></li>
												<li><a href="index-3.html">home version 3</a></li>
												<li><a href="index-4.html">home version 4</a></li>
											</ul></li>
										<li><a href="#">pages</a>
											<ul>

												<li><a href="cart.html">cart page</a></li>
												<li><a href="checkout.html">checkout</a></li>
												<li><a href="wishlist.html">wishlist</a></li>
												<li><a
													href="/jsp_project190925/main.do?command=login_page">login</a></li>
												<li><a href="contact.html">contact</a></li>
											</ul></li>
										<li><a href="#">shop</a>
											<ul>
												<li><a href="#">shop grid</a>
													<ul>
														<li><a href="shop-grid-2-col.html"> grid 2 column</a></li>
														<li><a href="shop-grid-3-col.html"> grid 3 column</a></li>
														<li><a href="shop.html"> grid 4 column</a></li>
														<li><a href="shop-grid-6-col.html"> grid 6 column</a></li>
														<li><a href="shop-grid-box.html"> grid box style</a></li>
													</ul></li>
												<li><a href="#">shop list</a>
													<ul>
														<li><a href="shop-list.html"> list 1 column</a></li>
														<li><a href="shop-list-2-col.html"> list 2 column</a></li>
														<li><a href="shop-list-3-col.html"> list 3 column</a></li>
														<li><a href="shop-list-box.html"> list box style</a></li>
													</ul></li>
												<li><a href="shop-grid-view-5-col.html">product
														details</a>
													<ul>
														<li><a href="product-details.html">tab style</a></li>
														<li><a href="product-details-sticky.html">sticky
																style</a></li>
														<li><a href="product-details-gallery.html">gallery
																style</a></li>
														<li><a href="product-details-fixed-img.html">fixed
																image style</a></li>
													</ul></li>
											</ul></li>
										<li><a href="#">BLOG</a>
											<ul>
												<li><a href="blog-masonry.html">Blog Masonry</a></li>
												<li><a href="#">Blog Standard</a>
													<ul>
														<li><a href="blog-left-sidebar.html">left sidebar</a></li>
														<li><a href="blog-right-sidebar.html">right
																sidebar</a></li>
														<li><a href="blog-no-sidebar.html">no sidebar</a></li>
													</ul></li>
												<li><a href="#">Post Types</a>
													<ul>
														<li><a href="blog-details-standerd.html">Standard
																post</a></li>
														<li><a href="blog-details-audio.html">audio post</a></li>
														<li><a href="blog-details-video.html">video post</a></li>
														<li><a href="blog-details-gallery.html">gallery
																post</a></li>
														<li><a href="blog-details-link.html">link post</a></li>
														<li><a href="blog-details-quote.html">quote post</a></li>
													</ul></li>
											</ul></li>
										<li><a href="contact.html"> Contact us</a></li>
									</ul>
								</nav>
							</div>
						</div>
					</div>
				</div>
			</div>
		</header>
		<div class="header-height"></div>
		<!-- main-search start -->
		<div class="main-search-active">
			<div class="sidebar-search-icon">
				<button class="search-close">
					<span class="ti-close"></span>
				</button>
			</div>
			<div class="sidebar-search-input">
				<form>
					<div class="form-search">
						<input id="search" class="input-text" value=""
							placeholder="Search Entire Store" type="search">
						<button>
							<i class="ti-search"></i>
						</button>
					</div>
				</form>
			</div>
		</div>
		<div class="breadcrumb-area mt-37 hm-4-padding">
			<div class="container-fluid">
				<div class="breadcrumb-content text-center">
					<h2>register login</h2>
					<ul>
						<li><a href="#">home</a></li>
						<li>register login</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="banner-area hm-4-padding">
			<div class="container-fluid">
				<div class="banner-img">
					<a href="#"><img src="assets/img/banner/16.jpg" alt=""></a>
				</div>
			</div>
		</div>
		<div class="login-register-area ptb-130 hm-3-padding">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-7 ml-auto mr-auto">
						<div class="login-register-wrapper">


							<div class="login-register-tab-list nav">
								<a class="active" data-toggle="tab" href="#lg2">
									<h4>register</h4>
								</a>
								<a data-toggle="tab" href="#lg1">
									<h4>login</h4>
								</a> 
							</div>
							<div class="tab-content">



								<%
									if (session.getAttribute("id") == null) {
								%>

								<div id="lg1" class="tab-pane">
									<div class="login-form-container">
										<div class="login-form">
											<form action="/jsp_project190925/main.do?command=login"
												method="post">
												<input type="text" name="user-id" placeholder="Id">
												<input type="password" name="user-pw" placeholder="Password">
												<div class="button-box">
													<div class="login-toggle-btn">
														<input type="checkbox"> <label>Remember me</label>
														<a href="#">Forgot Password?</a>
													</div>
													<button type="submit" class="btn-style cr-btn">
														<span>Login</span>
													</button>
												</div>
											</form>
										</div>
									</div>
								</div>
								<div id="lg2" class="tab-pane active">
									<div class="login-form-container">
										<div class="login-form">
											<form action="/jsp_project190925/main.do?command=sign"
												method="post">
												<input type="text" name="user-id" id="chkid"
													placeholder="Id"> <a class="btn-style cr-btn"
													id="idchk"><span>idchk</span></a> <input type="password"
													name="user-pw" placeholder="Password"> <input
													type="text" name="user-name" placeholder="Username">
												<input name="user-email" placeholder="Email" type="email">
												<div class="button-box">
													<button type="submit" class="btn-style cr-btn">
														<span>Register</span>
													</button>
												</div>
											</form>
										</div>
									</div>
								</div>

								<%
									}
								%>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<footer class="hm-4-padding">
			<div class="container-fluid">
				<div class="footer-top pt-125 pb-25">
					<div class="row">
						<div class="col-lg-3 col-md-5">
							<div class="footer-widget mb-30">
								<div class="footer-widget-title">
									<h3>Get in Touch</h3>
								</div>
								<div class="food-info-wrapper">
									<div class="food-address">
										<div class="food-info-icon">
											<i class="ion-ios-home-outline"></i>
										</div>
										<div class="food-info-content">
											<p>
												2020 Willshire Glen, Out of <br>Alpharetta, GA-30009
											</p>
										</div>
									</div>
									<div class="food-address">
										<div class="food-info-icon">
											<i class="ion-ios-telephone-outline"></i>
										</div>
										<div class="food-info-content">
											<p>(+00) 121 025 0214</p>
										</div>
									</div>
									<div class="food-address">
										<div class="food-info-icon">
											<i class="ion-ios-email-outline"></i>
										</div>
										<div class="food-info-content">
											<p>
												<a href="#">info@example.com</a>
											</p>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-2 col-md-4">
							<div class="footer-widget mb-30 pl-10">
								<div class="footer-widget-title">
									<h3>Information</h3>
								</div>
								<div class="food-widget-content">
									<ul class="quick-link">
										<li><a href="#">Delivery</a></li>
										<li><a href="#">Legal Notice</a></li>
										<li><a href="#">Terms & Conditions</a></li>

										<li><a href="#">Secure Payment</a></li>
									</ul>
								</div>
							</div>
						</div>
						<div class="col-lg-2 col-md-3">
							<div class="footer-widget mb-30 pl-100">
								<div class="footer-widget-title">
									<h3>accounts</h3>
								</div>
								<div class="food-widget-content">
									<ul class="quick-link">
										<li><a href="login-register.html">Sign In</a></li>
										<li><a href="cart.html">View Cart</a></li>
										<li><a href="wishlist.html">My Wishlist</a></li>
										<li><a href="#">Track My Order</a></li>
										<li><a href="#">Help</a></li>
									</ul>
								</div>
							</div>
						</div>
						<div class="col-lg-2 col-md-6">
							<div class="footer-widget mb-30 pl-125">
								<div class="footer-widget-title">
									<h3>support</h3>
								</div>
								<div class="food-widget-content">
									<ul class="quick-link">
										<li><a href="contact.html">Hello & Contact</a></li>
										<li><a href="#">Shipping & Tax</a></li>
										<li><a href="#">Return Policy</a></li>
										<li><a href="#">Affiliates</a></li>
										<li><a href="#">Legal Notice</a></li>
									</ul>
								</div>
							</div>
						</div>
						<div class="col-lg-3 col-md-6">
							<div class="footer-widget mb-30 f-right">
								<div class="footer-widget-title">
									<h3>twitter feed</h3>
								</div>
								<div class="twitter-info-wrapper">
									<div class="single-twitter">
										<div class="twitter-icon">
											<i class="ion-social-twitter-outline"></i>
										</div>
										<div class="twitter-content">
											<p>
												A modern <a href="#">#Shopify theme </a> <a class="link1"
													href="#">@devitems</a> <br> <a class="link2" href="#">https://twitter.com/devitemsllc</a>
											</p>
										</div>
									</div>
									<div class="single-twitter">
										<div class="twitter-icon">
											<i class="ion-social-twitter-outline"></i>
										</div>
										<div class="twitter-content">
											<p>
												A modern <a href="#">#Shopify theme </a> <a class="link1"
													href="#">@devitems</a> <br> <a class="link2" href="#">https://twitter.com/devitemsllc</a>
											</p>
										</div>
									</div>
									<div class="single-twitter">
										<div class="twitter-icon">
											<i class="ion-social-twitter-outline"></i>
										</div>
										<div class="twitter-content">
											<p>
												A modern <a href="#">#Shopify theme </a> <a class="link1"
													href="#">@devitems</a> <br> <a class="link2" href="#">https://twitter.com/devitemsllc</a>
											</p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="footer-bottom border-top-1 ptb-15">
					<div class="row">
						<div class="col-md-6 col-12">
							<div class="copyright-payment">
								<div class="copyright">
									<p>
										Copyright © 2018 <a href="https://freethemescloud.com/">Free
											themes Cloud</a> All RIght Reserved.
									</p>
								</div>
							</div>
						</div>
						<div class="col-md-6 col-12">
							<div class="footer-payment-method">
								<a href="#"><img alt="" src="assets/img/icon-img/7.png"></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</footer>
	</div>











	<!-- all js here -->
	<script src="assets/js/vendor/jquery-1.12.0.min.js"></script>
	<script src="assets/js/popper.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/isotope.pkgd.min.js"></script>
	<script src="assets/js/imagesloaded.pkgd.min.js"></script>
	<script src="assets/js/jquery.counterup.min.js"></script>
	<script src="assets/js/waypoints.min.js"></script>

	<script src="assets/js/owl.carousel.min.js"></script>
	<script src="assets/js/plugins.js"></script>
	<script src="assets/js/main.js"></script>
</body>
</html>