<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OpenMind - Khoá học giá rẻ</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">

    <link rel="stylesheet"  href="<c:url value='/resources/css/header.css'/>">
    
</head>
<body>
    <header class="bg-light shadow-sm py-2">
        <div class="container">
            <div class="d-flex justify-content-between align-items-center">

            <!-- Logo -->
            <div class="d-flex align-items-center">
                <img src="<c:url value='/resources/images/logo/logo1.png'/>" alt="Logo" class="me-2">
                <span class="fw-bold fs-5 d-none d-md-inline">OpenMind</span>
            </div>

            <!-- Desktop Navigation -->
            <nav class="d-none d-md-flex">
                <a href="/" class="nav-link text-dark">Cửa Hàng</a>
                <a href="cart" class="nav-link text-dark">Giỏ Hàng</a>
                <a href="#" class="nav-link text-dark">Thanh Toán</a>
                <a href="product-detail" class="nav-link text-dark">FeedBack</a>
            </nav>

            <!-- Right Section -->
            <div class="d-flex align-items-center">
                
                <a href="cart" class="btn text-dark d-none d-md-block">
                    <i class="bi bi-cart-fill"></i>
                </a>

                <!-- Mobile Menu Button -->
                <button class="btn btn-outline-secondary d-md-none" id="menuToggle">
                    <i class="bi bi-list"></i>
                </button>
            </div>
            </div>

            <!-- Mobile Menu -->
            <div id="mobileMenu" class="d-md-none mt-2">
            <nav class="mb-3 d-flex flex-column align-items-center">
                <a href="#" class="nav-link text-dark">Cửa Hàng</a>
                <a href="#" class="nav-link text-dark">Giỏ Hàng</a>
                <a href="#" class="nav-link text-dark">Thanh Toán</a>
                <a href="#" class="nav-link text-dark">FeedBack</a>
            </nav>
            <div class="mb-3">
                <a href="#" class="btn w-100 mb-2">
                <i class="bi bi-cart-fill"></i>
                </a>
            </div>
            </div>
        </div>
    </header>

    <script src="<c:url value='/resources/js/header.js'/>"></script>
</body>
</html>