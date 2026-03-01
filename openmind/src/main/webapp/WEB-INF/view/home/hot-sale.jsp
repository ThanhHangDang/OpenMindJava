<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>OpenMind - Khoá học giá rẻ</title>

            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
                crossorigin="anonymous">
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
                crossorigin="anonymous"></script>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

            <link rel="stylesheet"
                href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">

            <link rel="stylesheet" href="<c:url value='/resources/css/hot-sale.css'/>">

        </head>

        <body>
            <h2 class="text-center my-4">Khoá học mới nhất</h2>
            <div id="productCarousel" class="carousel slide" data-bs-ride="carousel" data-bs-interval="3000">
                <div class="carousel-inner">

                    <!-- Slide 1 -->
                    <!-- <div class="carousel-item active">
                        <div class="container">
                            <div class="row g-4">

                                <div class="col-md-4">
                                    <div class="card product-card">
                                        <img src="https://via.placeholder.com/300" class="card-img-top" alt="">
                                        <div class="card-body">
                                            <h5 class="card-title">Sản phẩm 1</h5>
                                            <p class="card-text">Mô tả ngắn sản phẩm</p>
                                            <p class="fw-bold text-danger">500.000đ</p>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <div class="card product-card">
                                        <img src="https://via.placeholder.com/300" class="card-img-top" alt="">
                                        <div class="card-body">
                                            <h5 class="card-title">Sản phẩm 2</h5>
                                            <p class="card-text">Mô tả ngắn sản phẩm</p>
                                            <p class="fw-bold text-danger">600.000đ</p>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <div class="card product-card">
                                        <img src="https://via.placeholder.com/300" class="card-img-top" alt="">
                                        <div class="card-body">
                                            <h5 class="card-title">Sản phẩm 3</h5>
                                            <p class="card-text">Mô tả ngắn sản phẩm</p>
                                            <p class="fw-bold text-danger">700.000đ</p>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div> -->

                    <!-- Slide 2 -->
                    <!-- <div class="carousel-item">
                        <div class="container">
                            <div class="row g-4">

                                <div class="col-md-4">
                                    <div class="card product-card">
                                        <img src="https://via.placeholder.com/300" class="card-img-top" alt="">
                                        <div class="card-body">
                                            <h5 class="card-title">Sản phẩm 4</h5>
                                            <p class="card-text">Mô tả ngắn sản phẩm</p>
                                            <p class="fw-bold text-danger">800.000đ</p>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <div class="card product-card">
                                        <img src="https://via.placeholder.com/300" class="card-img-top" alt="">
                                        <div class="card-body">
                                            <h5 class="card-title">Sản phẩm 4</h5>
                                            <p class="card-text">Mô tả ngắn sản phẩm</p>
                                            <p class="fw-bold text-danger">800.000đ</p>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <div class="card product-card">
                                        <img src="https://via.placeholder.com/300" class="card-img-top" alt="">
                                        <div class="card-body">
                                            <h5 class="card-title">Sản phẩm 4</h5>
                                            <p class="card-text">Mô tả ngắn sản phẩm</p>
                                            <p class="fw-bold text-danger">800.000đ</p>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div> -->

                    <!-- <c:forEach var="product" items="${latestProducts}">
                        <div class="carousel-item">
                            <div class="container">
                                <div class="row g-4">

                                    <div class="col-md-4">
                                        <div class="card product-card">
                                            <img src="${product.imageUrl}" class="card-img-top" alt="">
                                            <div class="card-body">
                                                <h5 class="card-title">${product.productName}</h5>
                                                <p class="card-text">Mô tả ngắn sản phẩm</p>
                                                <p class="fw-bold text-danger">${product.price}đ</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach> -->

                    <c:forEach var="product" items="${latestProducts}" varStatus="status">

                        <!-- Mở slide mới mỗi 3 sản phẩm -->
                        <c:if test="${status.index % 3 == 0}">
                            <div class="carousel-item ${status.index == 0 ? 'active' : ''}">
                                <div class="container">
                                    <div class="row g-4">
                        </c:if>

                                        <div class="col-md-4">
                                            <div class="card product-card p-2">
                                                <div class="row g-2 align-items-center">

                                                    <!-- Ảnh bên trái -->
                                                    <div class="col-4">
                                                        <img src="${product.imageUrl}" 
                                                            class="img-fluid rounded"
                                                            style="height: 100px; object-fit: cover;">
                                                    </div>

                                                    <!-- Nội dung bên phải -->
                                                    <div class="col-8">
                                                        <h6 class="mb-1">${product.productName}</h6>
                                                        <!-- <p class="mb-1 text-muted small">${product.description}</p> -->
                                                         <span class="fw-bold text-danger mb-0 mr-1">
                                                            <fmt:formatNumber 
                                                                value="${product.price}" 
                                                                maxFractionDigits="0" 
                                                            /> VNĐ
                                                         </span>
                                                        <c:if test="${product.discount > 0}">
                                                            <span class="text-muted text-decoration-line-through mr-1">${product.price} VNĐ</span>
                                                            <span class="badge bg-danger ms-2">${product.discount}% OFF</span>
                                                        </c:if>
                                                        
                                                    </div>

                                                </div>
                                            </div>
                                        </div>

                        <!-- Đóng slide sau mỗi 3 sản phẩm hoặc phần tử cuối -->
                        <c:if test="${status.index % 3 == 2 || status.last}">
                                    </div>
                                </div>
                            </div>
                        </c:if>

                    </c:forEach>

                </div>

                <!-- Nút điều hướng -->
                <button class="carousel-control-prev" type="button" data-bs-target="#productCarousel"
                    data-bs-slide="prev">
                    <span class="carousel-control-prev-icon bg-dark rounded-circle p-3"></span>
                </button>

                <button class="carousel-control-next" type="button" data-bs-target="#productCarousel"
                    data-bs-slide="next">
                    <span class="carousel-control-next-icon bg-dark rounded-circle p-3"></span>
                </button>

            </div>
        </body>

        </html>