<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>메인페이지</title>
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
<link rel="stylesheet" href="assets/css/jquery-ui.css">
<link rel="stylesheet" href="assets/css/meanmenu.min.css">
<link rel="stylesheet" href="assets/css/themify-icons.css">
<link rel="stylesheet" href="assets/css/ionicons.min.css">
<link rel="stylesheet" href="assets/css/bundle.css">
<link rel="stylesheet" href="assets/css/style.css">
<link rel="stylesheet" href="assets/css/responsive.css">
<script src="assets/js/vendor/modernizr-2.8.3.min.js"></script>
</head>
<body>

	<%
		String flag = (String) request.getAttribute("logout");

		if (flag != null) {
			session.removeAttribute("id");
			session.removeAttribute("username");
		}
	%>
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
													<li><a href="main.do?command=category&category=1">장난감</a></li>
													<li><a href="main.do?command=category&category=2">사료</a></li>
													<li><a href="main.do?command=category&category=3">간식</a></li>
													<li><a href="main.do?command=category&category=4">건강보조제</a></li>
													<li><a href="main.do?command=category&category=5">모래</a></li>
												</ul></li>
											<li><a href="#">pages <i class="ion-ios-arrow-down"></i></a>
												<ul>

													<li><a href="cart.do?ccommand=cartpage&id=${id}">cart
															page</a></li>
													<li><a href="checkout.html">checkout</a></li>
													<li><a href="wishlist.html">wishlist</a></li>
													<c:set var="a" value="${username}" scope="application" />
													<c:if test="${a eq null}">
														<li><a
															href="/jsp_project190925/main.do?command=login_page">login</a></li>
														<li><a href="contact.html">contact</a></li>
													</c:if>
												</ul></li>
										</ul>
									</nav>
								</div>
							</div>

						</div>
						<div class="col-lg-2 col-md-2 col-sm-7 col-7">

							<div class="header-site-icon">
								<c:set var="aa" value="admin" />
								<c:set var="aid" value="${id}" />
								<c:if test="${aid eq aa}">
									<div class="upload icon">
										<a href="main.do?command=admin"> <img
											src="assets/img/upload.jpg" /></a>
									</div>
								</c:if>
								<div class="header-search same-style">
									<button class="sidebar-trigger-search">
										<span class="ti-search"></span>
									</button>
								</div>

								<c:if test="${a eq null}">
									<div class="header-login same-style">
										<a href="/jsp_project190925/main.do?command=login_page"> <span
											class="ti-user"></span>
										</a>
									</div>
								</c:if>
								<c:if test="${a ne null}">
									<div class="logout icon">

										<a href="main.do?command=logout"> <img
											src="assets/img/logout.jpg" /></a>
									</div>


								</c:if>
								<div class="header-cart same-style">
									<a href="cart.do?ccommand=cartpage&id=${id}">
										<button class="sidebar-trigger">
											<div class="ti-shopping-cart"></div>

										</button>
									</a>
								</div>
							</div>

							<div class="main-menu">


								<c:if test="${a ne null}">
									<%
										String username = (String) request.getAttribute("username");
											String id = (String) request.getAttribute("id");
											//out.print(username + id);

											if (username != null) {
												session.setAttribute("username", username);
												session.setAttribute("id", id);
											}
									%>
									${username}님, 반갑습니다 !
									</c:if>

							</div>

						</div>




						<div class="mobile-menu-area col-12">
							<div class="mobile-menu">
								<nav id="mobile-menu-active">
									<ul class="menu-overflow">
										<li><a href="#">HOME</a>
											<ul>
												<li><a href="main.do">home version 1</a></li>
												<li><a href="index-2.html">home version 2</a></li>
												<li><a href="index-3.html">home version 3</a></li>
												<li><a href="index-4.html">home version 4</a></li>
											</ul></li>
										<li><a href="#">pages</a>
											<ul>

												<li><a href="cart.do?ccommand=cartpage&id=${id}">cart
														page</a></li>
												<li><a href="checkout.html">checkout</a></li>
												<li><a href="wishlist.html">wishlist</a></li>
												<li><a href="/main.do?command=login_page">login</a></li>
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
														<li><a
															href="goods.do?gcommand=detail&code=${goods.code}">tab
																style</a></li>
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
							placeholder="Search" type="search">
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
					<h2>Shop Page</h2>
					<ul>
						<li><a href="#">home</a></li>
						<li>Shop page</li>
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


		<div class="container-fluid">
			<div class="brand-logo-active owl-carousel white-bg ptb-50">

				<c:forEach var="allgoods" items="${allgoods}" varStatus="status">
					<a href="goods.do?gcommand=detail&code=${allgoods.code}">
						<div class="logo" align="center">
							<img alt="" src="assets/img/brand-logo/best${status.index+1}.jpg">
							<div class="single-logo">
								<img alt="" src="upload/0${allgoods.pic}">
							</div>
							<div class="single-name">
								<p>[${allgoods.name}]</p>
							</div>
						</div>
					</a>
				</c:forEach>
			</div>
		</div>


		<div class="shop-wrapper hm-3-padding pt-50 pb-100">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-12">
						<div class="shop-topbar-wrapper">
							<div class="grid-list-options">
								<ul class="view-mode">
									<li class="active"><a href="#product-grid"
										data-view="product-grid"><i class="ion-grid"></i></a></li>
									<li><a href="#product-list" data-view="product-list"><i
											class="ion-navicon"></i></a></li>
								</ul>
							</div>
							<!--  <div class="shop-filter">
								<button class="product-filter-toggle">filter</button>
							</div>-->
						</div>
					</div>
				</div>

				<!--
				<div class="row">
					<div class="col-lg-12">
						<div class="product-filter-wrapper">
							<div class="row">
								<div class="product-filter col-md-3 col-sm-6 col-xs-12 mb-30">
									<h5>Sort by</h5>
									<ul class="sort-by">
										<li><a href="#">Default</a></li>
										<li><a href="#">Popularity</a></li>
										<li><a href="#">Average rating</a></li>
										<li><a href="#">Newness</a></li>
										<li><a href="#">Price: Low to High</a></li>
										<li><a href="#">Price: High to Low</a></li>
									</ul>
								</div>
								<div class="product-filter col-md-3 col-sm-6 col-xs-12 mb-30">
									<h5>color filters</h5>
									<ul class="color-filter">
										<li><a href="#"><i style="background-color: #000000;"></i>Black</a></li>
										<li><a href="#"><i style="background-color: #663300;"></i>Brown</a></li>
										<li><a href="#"><i style="background-color: #FF6801;"></i>Orange</a></li>
										<li><a href="#"><i style="background-color: #ff0000;"></i>red</a></li>
										<li><a href="#"><i style="background-color: #FFEE00;"></i>Yellow</a></li>
									</ul>
								</div>
								<div class="product-filter col-md-3 col-sm-6 col-xs-12 mb-30">
									<h5>product tags</h5>
									<div class="product-tags">
										<a href="#">New ,</a> <a href="#">brand ,</a> <a href="#">black
											,</a> <a href="#">white ,</a> <a href="#">chire ,</a> <a href="#">table
											,</a> <a href="#">Lorem ,</a> <a href="#">ipsum ,</a> <a href="#">dolor
											,</a> <a href="#">sit ,</a> <a href="#">amet ,</a>
									</div>
								</div>
								<div class="product-filter col-md-3 col-sm-6 col-xs-12 mb-30">
									<h5>Filter by price</h5>
									<div id="price-range"></div>
									<div class="price-values">
										<span>Price:</span> <input type="text" class="price-amount">
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
-->
				<div class="grid-list-product-wrapper">

					<div class="product-grid product-view">
						<div class="row">
							<c:forEach var="goods" items="${goodslist}">
								<div class="product-width col-md-6 col-xl-3 col-lg-4">
									<div class="product-wrapper mb-35">
										<div class="product-img">
											<a href="goods.do?gcommand=detail&code=${goods.code}"> <img
												src="upload/${goods.pic}" alt="">
											</a>
											<div class="price-decrease">
												<span>30% off</span>
											</div>
											<div class="product-action-3">
												<!--<a class="action-plus-2" title="Quick View"
													data-toggle="modal" data-name="${goods.name }"
													data-pic="${goods.pic }" data-price="${goods.price }"
													href="#qv"> <i class="ti-plus"></i> Quict View-->
												</a>
											</div>
										</div>
										<div class="product-content">
											<div class="product-title-wishlist">
												<div class="product-title-3">
													<h4>
														<a href="goods.do?gcommand=detail&code=${goods.code}">${goods.name}</a>
													</h4>
												</div>
												<div class="product-wishlist-3"></div>
											</div>
											<div class="product-peice-addtocart">
												<div class="product-peice-3">
												<span class="old"><fmt:formatNumber value="${goods.price*1.3}" pattern=""/>원</span>	<span>${goods.price}원</span>
												</div>
												<div class="product-addtocart">
													<i class="ti-shopping-cart"> </i> <a
														href="cart.do?ccommand=cartadd&id=${id}&gcode=${goods.code}&qtt=1">Add
														to cart </a>
												</div>
											</div>
										</div>
										<div class="product-list-details">
											<h2>${goods.name}</h2>
											<div class="product-rating">
												<i class="ion-ios-"></i> <i class="ion-ios-star"></i> <i
													class="ion-ios-star"></i> <i class="ion-ios-star"></i> <i
													class="ion-ios-star"></i>
											</div>
											<div class="product-price">
												<span class="old">${goods.price} </span> <span>${goods.price}</span>
											</div>
											<p>${goods.dtext}</p>
											<div class="shop-list-cart">

												<a
													href="cart.do?ccommand=cartadd&id=${id}&gcode=${goods.code}&qtt=1"><i
													class="ti-shopping-cart"></i> Add to cart</a>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>

							<script>
								$('#qv')
										.on(
												'show.bs.modal',
												function(e) {
													var name = $(
															e.relatedTarget)
															.data('name');
													var pic = $(e.relatedTarget)
															.data('picc');
													var price = $(
															e.relatedTarget)
															.data('price');

													document
															.getElementById("name").innerHTML = name;
													document
															.getElementById("pic").src = pic;
												})
							</script>





						</div>
						<div class="pagination-style text-center mt-30">
							<ul>


								<c:forEach begin="${pagemaker.start}" end="${pagemaker.end}"
									var="idx">

									<a href='main.do?page=${idx}'> [ ${idx} ] </a>

								</c:forEach>
								<!--  	<li><a class="active" href="#">1</a></li>
								<li><a href="#">2</a></li>
								<li><a href="#">3</a></li>
								<li><a href="#"> <i class="ion-chevron-right"></i>
								</a></li>-->
							</ul>
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
										<li><a
											href="/jsp_project190925/main.do?command=login_page">Sign
												In</a></li>
										<li><a href="cart.do?ccommand=cartpage&id=${id}">View
												Cart</a></li>
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
		<!-- modal -->

		<div class="modal fade" id="qv" tabindex="-1" role="dialog"
			aria-hidden="true">
			<button type="button" class="close" data-dismiss="modal"
				aria-label="Close">
				<span class="ion-android-close" aria-hidden="true"></span>
			</button>
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-body">
						<div class="qwick-view-left">
							<div class="quick-view-learg-img">
								<div class="quick-view-tab-content tab-content">
									<div class="tab-pane active show fade" id="modal1"
										role="tabpanel">
										<p>
											<img id="picc" alt="">
										</p>
									</div>
									<div class="tab-pane fade" id="modal2" role="tabpanel">
										<img src="assets/img/quick-view/l2.jpg" alt="">
									</div>
									<div class="tab-pane fade" id="modal3" role="tabpanel">
										<img src="assets/img/quick-view/l3.jpg" alt="">
									</div>
								</div>
							</div>
							<div class="quick-view-list nav" role="tablist">
								<a class="active" href="#modal1" data-toggle="tab"> <img
									src="assets/img/quick-view/s1.jpg" alt="">
								</a> <a href="#modal2" data-toggle="tab"> <img
									src="assets/img/quick-view/s2.jpg" alt="">
								</a> <a href="#modal3" data-toggle="tab"> <img
									src="assets/img/quick-view/s3.jpg" alt="">
								</a>
							</div>
						</div>
						<div class="qwick-view-right">
							<div class="qwick-view-content">
								<p id="name" class="modal-title"></p>
								<div class="price">
									<span class="new">$90.00</span> <span class="old">$120.00
									</span>
								</div>
								<div class="rating-number">
									<div class="quick-view-rating">
										<i class="ion-ios-star red-star"></i> <i
											class="ion-ios-star red-star"></i> <i
											class="ion-ios-star red-star"></i> <i
											class="ion-ios-star red-star"></i> <i
											class="ion-ios-star red-star"></i>
									</div>
								</div>
								<p>Lorem ipsum dolor sit amet, consectetur adip elit, sed do
									tempor incididun ut labore et dolore magna aliqua. Ut enim ad
									mi , quis nostrud veniam exercitation .</p>

								<div class="quickview-plus-minus">
									<div class="cart-plus-minus">
										<input type="text" value="02" name="qtybutton"
											class="cart-plus-minus-box">
									</div>
									<div class="quickview-btn-cart">
										<a class="btn-style cr-btn" href="#"><span>add to
												cart</span></a>
									</div>
									<div class="quickview-btn-wishlist">
										<a class="btn-hover cr-btn" href="#"><span><i
												class="ion-ios-heart-outline"></i></span></a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
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