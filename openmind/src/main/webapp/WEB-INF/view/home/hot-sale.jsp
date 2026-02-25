<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
            <h2 class="text-center my-4">Sản phẩm hot</h2>
            <div id="productCarousel" class="carousel slide" data-bs-ride="carousel" data-bs-interval="3000">
                <div class="carousel-inner">

                    <!-- Slide 1 -->
                    <div class="carousel-item active">
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
                    </div>

                    <!-- Slide 2 -->
                    <div class="carousel-item">
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

                                <!-- thêm card tương tự -->

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
                    </div>

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