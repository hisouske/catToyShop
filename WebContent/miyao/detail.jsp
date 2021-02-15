<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html class="no-js" lang="utf-8">
<head>
<meta charset="utf-8">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link rel="stylesheet" type="text/css"
									href="//netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css">
									
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>상세페이지</title>
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
<link rel="stylesheet" href="assets/css/easyzoom.css">
<link rel="stylesheet" href="assets/css/meanmenu.min.css">
<link rel="stylesheet" href="assets/css/themify-icons.css">
<link rel="stylesheet" href="assets/css/ionicons.min.css">
<link rel="stylesheet" href="assets/css/bundle.css">
<link rel="stylesheet" href="assets/css/style.css">
<link rel="stylesheet" href="assets/css/responsive.css">
<script src="assets/js/vendor/modernizr-2.8.3.min.js"></script>
</head>
<style>
.test-detail{
margin-left: 220px;
}
.rating {
      float:left;
    }
    /* :not(:checked) is a filter, so that browsers that don’t support :checked don’t 
      follow these rules. Every browser that supports :checked also supports :not(), so
      it doesn’t make the test unnecessarily selective */
    .rating:not(:checked) > input {
        position:absolute;
        top:-9999px;
        clip:rect(0,0,0,0);
    }
    .btn-xs.m-progress:before {
    margin-top: -7px;
    margin-left: -7px;
    
    width: 14px;
    height: 14px;
}
    .rating:not(:checked) > label {
        float:right;
        width:1em;
        /* padding:0 .1em; */
        overflow:hidden;
        white-space:nowrap;
        cursor:pointer;
        font-size:100%;
        /* line-height:1.2; */
        color:#ddd;
    }
    .rating:not(:checked) > label:before {
        content: '★ ';
    }
    .rating > input:checked ~ label {
        color: #ffcc00;
        }
    .rating:not(:checked) > label:hover,
    .rating:not(:checked) > label:hover ~ label {
        color: #ffcc00;
            }
    .rating > input:checked + label:hover,
    .rating > input:checked + label:hover ~ label,
    .rating > input:checked ~ label:hover,
    .rating > input:checked ~ label:hover ~ label,
    .rating > label:hover ~ input:checked ~ label {
        color: #ffcc00;
          }
    .rating > label:active {
        position:relative;
        top:2px;
        left:2px;
    }

</style>
<c:set var="aid" value="${id}" />
<script type="text/javascript">

	//function chkval(idchkval){
	//reid= idchkval;
//		alert(reid);
	//}
	$(document).ready(function() {
		
		
		$("#addbtn").click(function() 
			{var gcode = ${gdto.code};
			var qtt = $("#qtt").val();
			var id = '<c:out value="${aid}"/>';
		if (id == "") {
		alert("로그인 후 이용해주세요");}
		else {location.href = '${path}cart.do?ccommand=cartadd&id='
														+ id
														+ '&gcode='
														+ gcode + '&qtt=' + qtt;}
										});
		$("#review").click(function(){
			
				var text = $("#reviewtext").val();
				var id = '<c:out value="${aid}"/>';
				var gcode = ${gdto.code};
				var point = $(':radio[name="rating"]:checked').val();
				var recode= document.all.a.value;
			
			
	
				var chk_radio = document.getElementsByName('rating');
				var sel_type = null;

				for(var i=0;i<chk_radio.length;i++){

					if(chk_radio[i].checked == true){ 

						sel_type = chk_radio[i].value;
					}
				}
		
			 if (id == "") {
					alert("로그인 후 이용해주세요");}
			else if (text == "") {
					alert("내용을 입력해주세요");}
			else if (sel_type == null&&recode=="") {
				alert("별점을 입력해주세요");}
				else{
			location.href = '${path}review.do?rcommand=reviewadd&id='+id+'&text='+encodeURI(text)+'&gcode='
			+ gcode+'&recode='+recode+'&point='+point;
	
	}
		});

		
					});
	
	
	
</script>
<body>
	<input type="hidden" name="a" value="${recode}">
	<div class="wrapper">
		<!-- header start -->
		<header>
			<div class="header-area transparent-bar">
				<div class="container">
					<div class="row">
						<div class="col-lg-2 col-md-2 col-sm-5 col-5">

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
													<li><a href="main.do?command=category&category=5">모래</a></li>							</ul></li>
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
								<%
									if (session.getAttribute("id") != null) {
										if (session.getAttribute("id").equals("admin")) {
								%>
								<div class="upload icon">
									<a href="main.do?command=admin"> <img src="assets/img/upload.jpg" /></a>
								</div>
								<%
									}
									}
								%>
								<c:set var="aa" value="admin" />
								<c:set var="aid" value="${id}" />

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
										<i class="ti-shopping-cart"></i> 
									</button>
									</a>

								</div>
							</div>
							<%
								if (session.getAttribute("username") != null) {
							%>
							<%=session.getAttribute("username")%>님, 반갑습니다
							<%
								}
							%>
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
											
												<li><a href="cart.html">cart page</a></li>
												<li><a href="checkout.html">checkout</a></li>
												<li><a href="wishlist.html">wishlist</a></li>
												<li><a href="login-register.html">login</a></li>
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
														<li><a href="product-dFetails-sticky.html">sticky
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
					<h2>product details</h2>
					<ul>
						<li><a href="#">home</a></li>
						<li>product details</li>
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
		<div class="product-details-area hm-3-padding ptb-130">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-6">
						<div class="product-details-img-content">
							<div class="product-details-tab mr-40">
								<div class="product-details-large tab-content">
									<div class="tab-pane active" id="pro-details1">
										<div class="easyzoom easyzoom--overlay">
											<a href="upload/1${gdto.pic}"> <img src="upload/${gdto.pic}" alt="">
											</a>
										</div>
									</div>
									<div class="tab-pane" id="pro-details2">
										<div class="easyzoom easyzoom--overlay">
											<a href="assets/img/product-details/bl2.jpg"> <img
												src="assets/img/product-details/l2.jpg" alt="">
											</a>
										</div>
									</div>
									<div class="tab-pane" id="pro-details3">
										<div class="easyzoom easyzoom--overlay">
											<a href="assets/img/product-details/bl3.jpg"> <img
												src="assets/img/product-details/l3.jpg" alt="">
											</a>
										</div>
									</div>
									<div class="tab-pane" id="pro-details4">
										<div class="easyzoom easyzoom--overlay">
											<a href="assets/img/product-details/bl4.jpg"> <img
												src="assets/img/product-details/l4.jpg" alt="">
											</a>
										</div>
									</div>
									<div class="tab-pane" id="pro-details5">
										<div class="easyzoom easyzoom--overlay">
											<a href="assets/img/product-details/bl3.jpg"> <img
												src="assets/img/product-details/l3.jpg" alt="">
											</a>
										</div>
									</div>
								</div>
														</div>
						</div>
					</div>
					<div class="col-lg-6">

<div class="a">
						<div class="product-details-content">
							<h2>${gdto.name}</h2>

							<div class="product-rating">
							<c:forEach var="i" begin="1" end="${sum/cnt}">
								<i class="ion-ios-star"></i> 
</c:forEach>
<span>평균<fmt:formatNumber value="${sum/cnt}" pattern=""/>점</span>
<p> ${cnt} Customer Review</p>
</div>

							</div>
							<div class="product-price">
								<span class="old">${gdto.price} </span> <span>${gdto.price}</span>
							</div>
							<div class="product-overview">
								<h5 class="pd-sub-title">Product Overview</h5>
								<p>>${gdto.dtext}</p>
							</div>


							<div class="quickview-plus-minus">
								<div class="cart-plus-minus">
									<input type="text" value="1" name="qtt" id="qtt"
										class="cart-plus-minus-box">
								</div>



								<div class="quickview-btn-cart">
									<a class="btn-style cr-btn" id="addbtn"><span>add to
											cart</span></a>
								</div>
								<div class="quickview-btn-wishlist">
									<a class="btn-hover cr-btn" href="#"><span><i
											class="ion-ios-heart-outline"></i></span></a>
								</div>
							</div>
							<div class="product-categories">
								<h5 class="pd-sub-title">Categories</h5>
								<ul>
									<li><a href="#">${gdto.category}</a></li>

								</ul>
							</div>


							<div class="product-review">
								
								<ul class="comments-list">
									<h5 class="pd-sub-title">Comment</h5>
									<li class="comment">
											<c:forEach var="review" items="${reviewlist}" varStatus="status">
										<div class="comment-body">
											<div class="comment-heading">
											
												<li>${review.id}/${review.point}점</li>
											</div>
											<p>    ${review.text}	<a href="review.do?rcommand=reid&recode=${review.code}&gcode=${gdto.code}"><i class="fa fa-reply">   re</i></a>	<c:if test="${aid eq review.id}"> <a class="x" href="review.do?rcommand=reviewdel&code=${review.code}&gcode=${review.gcode}"> <img
										src="assets/img/x.jpg" alt="">
									</a></c:if>  </p> 
									<c:forEach var="rereview" items="${rereviewlist}" varStatus="status">
										<div class="comment-body2">
										<c:if test="${review.code eq rereview.admincode}">
											<div class="comment-heading">
												<li>&nbsp;&nbsp;<img src="assets/img/rereview.jpg">${rereview.id}</li>
											</div>
											<p>&nbsp;&nbsp;&nbsp;&nbsp;${rereview.text}	<c:if test="${aid eq rereview.id}"> <a class="x" href="review.do?rcommand=reviewdel&code=${rereview.code}&gcode=${rereview.gcode}"> <img
										src="assets/img/x.jpg" alt="">
									</a></c:if>  </p> </c:if>
									
										
										</div>
										</c:forEach>
										</div>
										</c:forEach>
									</li>
								</ul>
								<div class="post-footer">

									<div class="input-group">


<div class="container">
   
	<c:if test="${recode ne null}">
	<li>>대댓글달기 </li>
	</c:if>
	<div class="row">
	<c:if test="${recode eq null}">
	<div class="rating">
      <input type="radio" id="star10" name="rating" value="10" /><label for="star10" title="Excellent!!">10 stars</label>
      <input type="radio" id="star9" name="rating" value="9" /><label for="star9" title="Excellent!!">9 stars</label>
      <input type="radio" id="star8" name="rating" value="8" /><label for="star8" title="Pretty good">8 stars</label>
      <input type="radio" id="star7" name="rating" value="7" /><label for="star7" title="Pretty good">7 stars</label>
      <input type="radio" id="star6" name="rating" value="6" /><label for="star6" title="Meh">6 star</label>
      <input type="radio" id="star5" name="rating" value="5" /><label for="star5" title="Meh">5 stars</label>
      <input type="radio" id="star4" name="rating" value="4" /><label for="star4" title="soso..">4 stars</label>
      <input type="radio" id="star3" name="rating" value="3" /><label for="star3" title="soso..?">3 stars</label>
      <input type="radio" id="star2" name="rating" value="2" /><label for="star2" title="bad!!">2 stars</label>
      <input type="radio" id="star1" name="rating" value="1" /><label for="star1" title="bad!!">1 star</label>
    </div>
	</c:if>
	</div>

	
		

	
</div>
								
										<input class="form-control" placeholder="Add a comment"
											type="text" id="reviewtext"> <span class="input-group-addon" id="review"> 
											<i class="fa fa-edit" ></i>
										</span>
									</div>
								</div>


							</div>


						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<div class="test-detail" >
<img src ="upload/${gdto.dpic}">
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