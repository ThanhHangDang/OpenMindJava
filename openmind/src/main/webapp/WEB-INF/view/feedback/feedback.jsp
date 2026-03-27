<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Feedback - Khoá học giá rẻ</title>
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

        </head>

        <body>
            <jsp:include page="./../component/header.jsp" />
            <div class="container py-5">
                <div class="row justify-content-center">
                    <!-- Product Images -->
                    <div class="col-md-3 mb-4">
                        <div class="card">
                            <img 
                            src="${product.imageUrl}"
                            class="card-img-top" alt="Product Image">
                        </div>
                    </div>

                    <!-- Product Details -->
                    <div class="col-md-6">
                        <h1 class="h2 mb-3">${product.productName}</h1>
                        <div class="mb-3">
                            <span class="h4 me-2">
                                <fmt:formatNumber 
                                    value="${product.price - (product.price * product.discount / 100)}" 
                                    maxFractionDigits="0" 
                                /> VNĐ
                            </span>
                            <c:if test="${product.discount > 0}">
                                <span class="text-muted text-decoration-line-through">
                                    <fmt:formatNumber 
                                        value="${product.price}" 
                                        maxFractionDigits="0" 
                                    /> VNĐ
                                </span>
                                <span class="badge bg-danger ms-2">${product.discount}% OFF</span>
                            </c:if>
                        </div>

                        <div class="mb-3">
                            <div class="d-flex align-items-center">
                                <div class="text-warning me-2">
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star-half-alt"></i>
                                </div>
                                <span class="text-muted">(${product.viewCount} lượt xem)</span>
                            </div>
                        </div>

                        <p class="mb-4">${product.description}</p>

                        <!-- Color Selection -->
                        <!-- <div class="mb-4">
                            <h6 class="mb-2">Color</h6>
                            <div class="btn-group" role="group">
                                <input type="radio" class="btn-check" name="color" id="silver" checked>
                                <label class="btn btn-outline-secondary" for="silver">Silver</label>
                                <input type="radio" class="btn-check" name="color" id="gold">
                                <label class="btn btn-outline-secondary" for="gold">Gold</label>
                                <input type="radio" class="btn-check" name="color" id="black">
                                <label class="btn btn-outline-secondary" for="black">Black</label>
                            </div>
                        </div> -->

                        <!-- Quantity -->
                        <div class="mb-4">
                            <div class="d-flex align-items-center">
                                <label class="me-2">Quantity:</label>
                                <select class="form-select w-auto">
                                        <option>1</option>
                                        <option>2</option>
                                        <option>3</option>
                                        <option>4</option>
                                        <option>5</option>
                                    </select>
                            </div>
                        </div>

                        <!-- Actions -->
                        <div class="d-grid gap-2">
                            <button class="btn btn-primary" type="button">Add to Cart</button>
                            <!-- <button class="btn btn-outline-secondary" type="button">
                                    <i class="far fa-heart me-2"></i>Add to Wishlist
                                </button> -->
                        </div>

                        <!-- Additional Info -->
                        <div class="mt-4">
                            <div class="d-flex align-items-center mb-2">
                                <i class="fas fa-truck text-primary me-2"></i>
                                <span>Free shipping on orders over $50</span>
                            </div>
                            <div class="d-flex align-items-center mb-2">
                                <i class="fas fa-undo text-primary me-2"></i>
                                <span>30-day return policy</span>
                            </div>
                            <div class="d-flex align-items-center">
                                <i class="fas fa-shield-alt text-primary me-2"></i>
                                <span>2-year warranty</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <jsp:include page="./../component/footer.jsp" />
        </body>

        </html>