<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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

    <link rel="stylesheet"  href="<c:url value='/resources/css/all-product.css'/>">
    
</head>
<body>
    <div class="container py-5">
        <h2 class="text-center mb-5">Tất cả khoá học</h2>
        <!-- Top Bar -->
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h4 class="mb-0">Danh sách khoá học</h4>
            <div class="d-flex gap-2 align-items-center">
                <span class="text-muted">Sort by:</span>
                <button class="sort-btn">
                    Newest <i class="bi bi-chevron-down ms-2"></i>
                </button>
            </div>
        </div>

        <div class="row g-4">
            <!-- Filters Sidebar -->
            <div class="col-lg-3">
                <form method="get" action="/">
                    <div class="filter-sidebar p-4 shadow-sm">
                        <div class="filter-group">
                            <h6 class="mb-3">Tìm kiếm</h6>
                            <div class="input-group">
                                <input 
                                    type="text" 
                                    class="form-control" 
                                    name="keyWord"
                                    value="${param.keyWord}"
                                    placeholder="Tìm kiếm khoá học..."
                                >
                            </div>
                        </div>
                        <div class="filter-group">
                            <h6 class="mb-3">Danh mục</h6>
                            <c:forEach var="category" items="${categories}">
                                <div class="form-check mb-2">
                                    <input 
                                        class="form-check-input" 
                                        type="checkbox" 
                                        id="category${category.id}" 
                                        name="categoryId"
                                        value="${category.id}"
                                        <c:if test="${param.categoryId != null && param.categoryId == category.id}">
                                            checked
                                        </c:if>
                                    >
                                    <label class="form-check-label" for="category${category.id}">
                                        ${category.categoryName} 
                                    </label>
                                </div>
                            </c:forEach>
                        </div>

                        <div class="filter-group">
                            <h6 class="mb-3">Price Range</h6>
                            <input 
                                type="range"
                                class="form-range"
                                min="0"
                                max="3000000"
                                id="priceRange"
                                name="maxPrice"
                                value="${param.maxPrice != null ? param.maxPrice : 3000000}"
                            >
                            <div class="d-flex justify-content-between">
                                <span class="text-muted">0 VNĐ</span>
                                <span class="fw-bold text-primary" id="priceValue">
                                    500.000 VNĐ
                                </span>
                                <span class="text-muted">3tr VNĐ</span>
                            </div>
                        </div>

                        <!-- <div class="filter-group">
                            <h6 class="mb-3">Colors</h6>
                            <div class="d-flex gap-2">
                                <div class="color-option selected" style="background: #000000;"></div>
                                <div class="color-option" style="background: #dc2626;"></div>
                                <div class="color-option" style="background: #2563eb;"></div>
                                <div class="color-option" style="background: #16a34a;"></div>
                            </div>
                        </div>

                        <div class="filter-group">
                            <h6 class="mb-3">Rating</h6>
                            <div class="form-check mb-2">
                                <input class="form-check-input" type="radio" name="rating" id="rating4">
                                <label class="form-check-label" for="rating4">
                                    <i class="bi bi-star-fill text-warning"></i> 4 & above
                                </label>
                            </div>
                            <div class="form-check mb-2">
                                <input class="form-check-input" type="radio" name="rating" id="rating3">
                                <label class="form-check-label" for="rating3">
                                    <i class="bi bi-star-fill text-warning"></i> 3 & above
                                </label>
                            </div>
                        </div> -->

                        <button type="submit" class="btn btn-outline-primary w-100">Apply Filters</button>
                    </div>
                </form>
            </div>

            <!-- Product Grid -->
            <div class="col-lg-9">
                <c:if test="${products.size() == 0}">
                    <div class="alert alert-info text-center" role="alert">
                        Không tìm thấy khoá học nào phù hợp với tiêu chí của bạn.
                    </div>
                </c:if>
                <div class="row g-4">
                    <!-- More product cards can be added here -->
                    <c:forEach var="product" items="${products}">
                        <div class="col-md-4">
                            <div class="product-card shadow-sm">
                                <div class="position-relative">
                                    <a href="product-detail/${product.id}">
                                    <img src="${product.imageUrl}" class="product-image w-100" alt="Product">
                                    </a>
                                    <c:if test="${product.discount > 0}">
                                        <span class="discount-badge">-${product.discount}%</span>
                                    </c:if>
                                    <button class="wishlist-btn">
                                        <i class="bi bi-heart"></i>
                                    </button>
                                </div>
                                <div class="p-3">
                                    <span class="category-badge mb-2 d-inline-block">${product.category.categoryName}</span>
                                    <a href="product-detail/${product.id}" class="text-decoration-none text-dark">
                                    <h6 class="mb-1">
                                        ${product.productName}
                                    </h6>
                                    </a>
                                    <!-- <div class="rating-stars mb-2">
                                        <i class="bi bi-star-fill"></i>
                                        <i class="bi bi-star-fill"></i>
                                        <i class="bi bi-star-fill"></i>
                                        <i class="bi bi-star-fill"></i>
                                        <i class="bi bi-star-half"></i>
                                        <span class="text-muted ms-2">(4.5)</span>
                                    </div> -->
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div class="d-flex flex-column">
                                            <c:if test="${product.discount > 0}">
                                                <span class="text-muted text-decoration-line-through">
                                                    <fmt:formatNumber 
                                                        value="${product.price}" 
                                                        maxFractionDigits="0" 
                                                    /> VNĐ
                                                </span>
                                            </c:if>
                                            <span class="price">
                                                <fmt:formatNumber 
                                                    value="${product.price - (product.price * product.discount / 100)}" 
                                                    maxFractionDigits="0" 
                                                /> VNĐ
                                            </span>
                                        </div>
                                        
                                        <a 
                                        type="submit"
                                        href="add-to-cart?productId=${product.id}"
                                        class="btn cart-btn">
                                            <i class="bi bi-cart-plus"></i> Giỏ hàng
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>

                <!-- pagination -->
                <c:if test="${totalPages > 0}">
                    <!-- pagination ở đây -->
                    <nav aria-label="Page navigation">
                        <ul class="pagination pagination-floating justify-content-center">

                            <!-- Previous -->
                            <c:if test="${currentPage > 0}">
                                <c:url var="prevUrl" value="/">
                                    <c:param name="pageNumber" value="${currentPage - 1}" />
                                    <c:param name="keyWord" value="${param.keyWord}" />
                                    <c:param name="categoryId" value="${param.categoryId}" />
                                    <c:param name="minPrice" value="${param.minPrice}" />
                                    <c:param name="maxPrice" value="${param.maxPrice}" />
                                </c:url>

                                <li class="page-item">
                                    <a class="page-link" href="${prevUrl}">«</a>
                                </li>
                            </c:if>

                            <!-- Page Numbers -->
                            <c:forEach begin="0" end="${totalPages - 1}" var="i">
                                <c:url var="pageUrl" value="/">
                                    <c:param name="pageNumber" value="${i}" />
                                    <c:param name="keyWord" value="${param.keyWord}" />
                                    <c:param name="categoryId" value="${param.categoryId}" />
                                    <c:param name="minPrice" value="${param.minPrice}" />
                                    <c:param name="maxPrice" value="${param.maxPrice}" />
                                </c:url>

                                <li class="page-item ${i == currentPage ? 'active' : ''}">
                                    <a class="page-link" href="${pageUrl}">
                                        ${i + 1}
                                    </a>
                                </li>
                            </c:forEach>

                            <!-- Next -->
                            <c:if test="${currentPage < totalPages - 1}">
                                <c:url var="nextUrl" value="/">
                                    <c:param name="pageNumber" value="${currentPage + 1}" />
                                    <c:param name="keyWord" value="${param.keyWord}" />
                                    <c:param name="categoryId" value="${param.categoryId}" />
                                    <c:param name="minPrice" value="${param.minPrice}" />
                                    <c:param name="maxPrice" value="${param.maxPrice}" />
                                </c:url>

                                <li class="page-item">
                                    <a class="page-link" href="${nextUrl}">»</a>
                                </li>
                            </c:if>

                        </ul>
                    </nav>
                </c:if>
            </div>
        </div>
    </div>

    <script src="<c:url value='/resources/js/all-product.js'/>"></script>
</body>
</html>

