<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Chi tiết khoá học - Khoá học giá rẻ</title>

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
    <div class="row">
        <!-- Product Images -->
        <div class="col-md-6 mb-4">
            <div class="card">
                <img src="https://images.unsplash.com/photo-1444881421460-d838c3b98f95?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NzEyNjZ8MHwxfHNlYXJjaHw1fHx3YXRjaHxlbnwwfDB8fHwxNzM0OTY1MTc4fDA&ixlib=rb-4.0.3&q=80&w=1080" class="card-img-top" alt="Product Image">
                <div class="card-body">
                    <div class="row g-2">
                        <div class="col-3">
                            <img src="https://images.unsplash.com/photo-1434056886845-dac89ffe9b56?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NzEyNjZ8MHwxfHNlYXJjaHwyfHx3YXRjaHxlbnwwfDB8fHwxNzM0OTY1MTc4fDA&ixlib=rb-4.0.3&q=80&w=1080" class="img-thumbnail" alt="Thumbnail 1">
                        </div>
                        <div class="col-3">
                            <img src="https://images.unsplash.com/photo-1495857000853-fe46c8aefc30?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NzEyNjZ8MHwxfHNlYXJjaHw2fHx3YXRjaHxlbnwwfDB8fHwxNzM0OTY1MTc4fDA&ixlib=rb-4.0.3&q=80&w=1080" class="img-thumbnail" alt="Thumbnail 2">
                        </div>
                        <div class="col-3">
                            <img src="https://images.unsplash.com/photo-1451859757691-f318d641ab4d?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NzEyNjZ8MHwxfHNlYXJjaHw3fHx3YXRjaHxlbnwwfDB8fHwxNzM0OTY1MTc4fDA&ixlib=rb-4.0.3&q=80&w=1080" class="img-thumbnail" alt="Thumbnail 3">
                        </div>
                        <div class="col-3">
                            <img src="https://images.unsplash.com/photo-1490915785914-0af2806c22b6?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NzEyNjZ8MHwxfHNlYXJjaHwzfHx3YXRjaHxlbnwwfDB8fHwxNzM0OTY1MTc4fDA&ixlib=rb-4.0.3&q=80&w=1080" class="img-thumbnail" alt="Thumbnail 4">
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Product Details -->
        <div class="col-md-6">
            <h1 class="h2 mb-3">Elegant Watch Classic Edition</h1>
            <div class="mb-3">
                <span class="h4 me-2">$299.99</span>
                <span class="text-muted text-decoration-line-through">$399.99</span>
                <span class="badge bg-danger ms-2">25% OFF</span>
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
                    <span class="text-muted">(128 reviews)</span>
                </div>
            </div>

            <p class="mb-4">Timeless elegance meets modern functionality in this classic timepiece. Features premium
                materials, water resistance, and sophisticated design.</p>

            <!-- Color Selection -->
            <div class="mb-4">
                <h6 class="mb-2">Color</h6>
                <div class="btn-group" role="group">
                    <input type="radio" class="btn-check" name="color" id="silver" checked>
                    <label class="btn btn-outline-secondary" for="silver">Silver</label>
                    <input type="radio" class="btn-check" name="color" id="gold">
                    <label class="btn btn-outline-secondary" for="gold">Gold</label>
                    <input type="radio" class="btn-check" name="color" id="black">
                    <label class="btn btn-outline-secondary" for="black">Black</label>
                </div>
            </div>

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
                <button class="btn btn-outline-secondary" type="button">
                        <i class="far fa-heart me-2"></i>Add to Wishlist
                    </button>
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