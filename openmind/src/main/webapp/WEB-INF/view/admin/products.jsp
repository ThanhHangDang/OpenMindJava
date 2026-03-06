<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lý khoá học</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
    <div class="container py-5">
        <h1 class="mb-4">Quản lý khoá học</h1>
        <a href="${pageContext.request.contextPath}/admin/products/add-product" class="btn btn-primary mb-3">Thêm sản phẩm mới</a>
        <table class="table table-bordered">
            <thead >
                <tr class="text-center">
                    <th class="col-md-1">ID</th>
                    <th class="col-md-1">Ảnh</th>
                    <th class="col-md-4">Tên sản phẩm</th>
                    <th class="col-md-2">Giá</th>
                    <th class="col-md-2">Giảm giá (%)</th>
                    <th class="col-md-2">Hành động</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="product" items="${products}">
                    <tr class="text-center align-middle">
                        <td>${product.id}</td>
                        <td><img src="${product.imageUrl}" alt="${product.productName}" style="width: 100px; height: auto;"></td>
                        <td>
                            <a href="${pageContext.request.contextPath}/admin/product-detail/${product.id}" class="text-decoration-none">
                                ${product.productName}
                            </a>
                        </td>
                        
                        <td><fmt:formatNumber value="${product.price}" maxFractionDigits="0" /> VNĐ</td>
                        <td>${product.discount}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/admin/products/${product.id}/edit" class="btn btn-sm btn-warning">Sửa</a>
                            <form action="${pageContext.request.contextPath}/admin/products/${product.id}/delete" method="post" style="display:inline;">
                                <button type="submit" class="btn btn-sm btn-danger" onclick="return confirm('Bạn có chắc muốn xóa sản phẩm này?');">Xóa</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <!-- Pagination -->
        <nav aria-label="Page navigation">
            <ul class="pagination justify-content-center">
                <c:if test="${currentPage > 0}">
                    <c:url var="previousPageUrl" value="/admin/products">
                        <c:param name="pageNumber" value="${currentPage - 1}" />
                        <c:param name="keyWord" value="${param.keyWord}" />
                        <c:param name="categoryId" value="${param.categoryId}" />
                        <c:param name="minPrice" value="${param.minPrice}" />
                        <c:param name="maxPrice" value="${param.maxPrice}" />
                    </c:url>
                    <li class="page-item">
                        <a class="page-link" href="${previousPageUrl}" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                </c:if>
                
                <c:forEach var="i" begin="0" end="${totalPages-1}">
                    <c:url var="pageUrl" value="/admin/products">
                        <c:param name="pageNumber" value="${i}" />
                        <c:param name="keyWord" value="${param.keyWord}" />
                        <c:param name="categoryId" value="${param.categoryId}" />
                        <c:param name="minPrice" value="${param.minPrice}" />
                        <c:param name="maxPrice" value="${param.maxPrice}" />
                    </c:url>
                    <li class="page-item ${currentPage == i ? 'active' : ''}">
                        <a class="page-link" href="${pageUrl}">${i+1}</a>
                    </li>
                </c:forEach>
                <c:if test="${currentPage < totalPages - 1}">
                    <c:url var="nextPageUrl" value="/admin/products">
                        <c:param name="pageNumber" value="${currentPage + 1}" />
                        <c:param name="keyWord" value="${param.keyWord}" />
                        <c:param name="categoryId" value="${param.categoryId}" />
                        <c:param name="minPrice" value="${param.minPrice}" />
                        <c:param name="maxPrice" value="${param.maxPrice}" />
                    </c:url>
                    <li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
                        <a class="page-link" href="${nextPageUrl}" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </c:if>
            </ul>
        </nav>
    </div>
</body>
</html>