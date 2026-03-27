<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Giỏ hàng - Khoá học giá rẻ</title>
            <link rel="icon" href="<c:url value='/resources/images/logo/logo_icon.jpg'/>" type="image/x-icon">

            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
                crossorigin="anonymous">
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
                crossorigin="anonymous"></script>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

            <link rel="stylesheet"
                href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">

            <link rel="stylesheet" href="<c:url value='/resources/css/cart.css'/>">

        </head>

        <body>
             <jsp:include page="./../component/header.jsp" />
            <div class="cart-wrapper">
                <h2 class="text-center my-4">Giỏ hàng của bạn</h2>
                <div class="container">
                    <div class="row g-4">
                        <!-- Cart Items Section -->
                        <div class="col-lg-8">
                            <div class="d-flex justify-content-between align-items-center mb-4">
                                <h4 class="mb-0">Shopping Cart</h4>
                                <span class="text-muted">
                                    <c:choose>
                                        <c:when test="${cart.size() == 0 || cart == null}">
                                            0 items
                                        </c:when>
                                        <c:otherwise>
                                            ${cart.size()} item(s)
                                        </c:otherwise>
                                    </c:choose>
                                </span>
                            </div>

                            <!-- Product Cards -->
                            <div class="d-flex flex-column gap-3">
                                <c:if test="${cart.size() == 0 || cart == null}">
                                    <div class="alert alert-info text-center" role="alert">
                                        Giỏ hàng của bạn đang trống. Hãy thêm một số khoá học để bắt đầu!
                                    </div>
                                </c:if>
                                <c:forEach var="item" items="${cart}">
                                    <div class="product-card p-3 shadow-sm">
                                        <div class="row align-items-center">
                                            <div class="col-md-2">
                                                <img src="${item.imageUrl}"
                                                    alt="Product"
                                                    class="product-image">
                                            </div>
                                            <div class="col-md-7">
                                                <h6 class="mb-1">
                                                    ${item.productName}
                                                </h6>
                                                <c:if test="${item.discount > 0}">
                                                    <span class="text-muted text-decoration-line-through me-2">
                                                        <fmt:formatNumber 
                                                            value="${item.price}" 
                                                            maxFractionDigits="0" 
                                                        /> VNĐ
                                                    </span>
                                                    <span class="discount-badge mt-2">${item.discount}% OFF</span>
                                                </c:if>
                                            </div>
                                            <!-- <div class="col-md-3">
                                                <div class="d-flex align-items-center gap-2">
                                                    <button class="quantity-btn" onclick="updateQuantity(1, -1)">-</button>
                                                    <input type="number" class="quantity-input" value="1" min="1">
                                                    <button class="quantity-btn" onclick="updateQuantity(1, 1)">+</button>
                                                </div>
                                            </div> -->
                                            <div class="col-md-2">
                                                <span class="fw-bold">
                                                    <fmt:formatNumber 
                                                        value="${item.price - (item.price * item.discount / 100)}" 
                                                        maxFractionDigits="0" 
                                                    /> VNĐ
                                                </span>
                                            </div>
                                            <div class="col-md-1">
                                                <a href="remove-from-cart?productId=${item.productId}" class="remove-btn">
                                                <i class="bi bi-trash remove-btn"></i>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>    
                            </div>
                        </div>

                        <!-- Summary Section -->
                        <div class="col-lg-4">
                            <div class="summary-card p-4 shadow-sm">
                                <h5 class="mb-4">Order Summary</h5>

                                <div class="d-flex justify-content-between mb-3">
                                    <span class="text-muted">
                                        Tạm tính
                                    </span>
                                    <span>
                                        <fmt:formatNumber 
                                            value="${subtotal}" 
                                            maxFractionDigits="0" 
                                        /> VNĐ
                                    </span>
                                </div>
                                <div class="d-flex justify-content-between mb-3">
                                    <span class="text-muted">Tổng giảm giá</span>
                                    <span class="text-success">
                                        <fmt:formatNumber 
                                            value="${totalDiscount}" 
                                            maxFractionDigits="0" 
                                        /> VNĐ
                                    </span>
                                </div>
                                <!-- <div class="d-flex justify-content-between mb-3">
                                    <span class="text-muted">Shipping</span>
                                    <span>$5.00</span>
                                </div> -->
                                <hr>
                                <div class="d-flex justify-content-between mb-4">
                                    <span class="fw-bold">Tổng cộng</span>
                                    <span class="fw-bold">
                                        <fmt:formatNumber 
                                            value="${total}" 
                                            maxFractionDigits="0" 
                                        /> VNĐ
                                    </span>
                                </div>

                                <!-- Promo Code -->
                                <div class="mb-4">
                                    <div class="input-group">
                                        <input type="text" class="form-control" placeholder="Promo code">
                                        <button class="btn btn-outline-secondary" type="button">Apply</button>
                                    </div>
                                </div>

                                <button class="btn btn-primary checkout-btn w-100 mb-3">
                                    Proceed to Checkout
                                </button>

                                <div class="d-flex justify-content-center gap-2">
                                    <i class="bi bi-shield-check text-success"></i>
                                    <small class="text-muted">Secure checkout</small>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <jsp:include page="./../component/footer.jsp" />
        </body>

        </html>