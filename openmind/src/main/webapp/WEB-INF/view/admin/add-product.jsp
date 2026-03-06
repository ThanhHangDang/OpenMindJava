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
    <div class="container py-5 col-md-8">
        <h1 class="mb-4">Thêm Khoá học mới</h1>
        <form:form method="post" modelAttribute="newProduct" action="${pageContext.request.contextPath}/admin/products/add-product" enctype="multipart/form-data">
            <div class="mb-3">
                <form:label path="productName">Tên khoá học</form:label>
                <form:input path="productName" class="form-control" />
            </div>
            <div class="mb-3">
                <form:label path="category">Danh mục</form:label>
                <form:select path="category" class="form-select">
                    <form:option value="" label="-- Chọn danh mục --" />
                    <form:options items="${categories}" itemValue="id" itemLabel="categoryName" />
                </form:select>
            </div>
            <div class="mb-3">
                <form:label path="description">Mô tả ngắn</form:label>
                <form:textarea path="description" class="form-control" rows="3" />
            </div>
            <div class="mb-3">
                <form:label path="price">Giá</form:label>
                <form:input path="price" class="form-control" type="number" min="0" step="1000"/>
            </div>
            <div class="mb-3">
                <form:label path="discount">Giảm giá (%)</form:label>
                <form:input path="discount" class="form-control" type="number" min="0" max="100" />  
            </div>
            <div class="mb-3">
                <label class="form-label">Nội dung</label>

                <div id="content-wrapper">
                    <input type="text" class="form-control content-input mb-2" placeholder="Nhập nội dung">
                </div>

                <button type="button" class="btn btn-primary mt-2" id="addContent">
                    + Thêm nội dung
                </button>
            </div>
            <!-- input ẩn để gửi dữ liệu -->
            <form:input path="courseContent" id="finalContent" type="hidden"/>
            
            <div class="mb-3">

                <label class="form-label">Lộ trình bài học</label>

                <div id="lesson-wrapper">

                    <div class="lesson border p-3 mb-3">

                        <input type="text" class="form-control lesson-title mb-2" placeholder="Tên lesson">

                        <input type="text" class="form-control step-input mb-2 ms-2" placeholder="Tiến trình nhỏ">

                        <button type="button" class="btn btn-sm btn-primary addStep">
                            + Thêm tiến trình
                        </button>

                        <button type="button" class="btn btn-sm btn-danger removeLesson">
                            Xoá lesson
                        </button>

                    </div>

                </div>

                <button type="button" class="btn btn-success mt-2" id="addLesson">
                    + Thêm lesson
                </button>

            </div>
            <!-- input ẩn để gửi dữ liệu -->
            <form:input path="courseStep" id="finalLessonData" type="hidden"/>

            <div class="mb-3">
                <form:label path="courseRequired">Yêu cầu khoá học</form:label>
                <form:textarea path="courseRequired" class="form-control" rows="3" />
            </div>
            <div class="mb-3">
                <form:label path="courseOutput">Kết quả đạt được</form:label>
                <form:textarea path="courseOutput" class="form-control" rows="3" />
            </div>
            <div class="mb-3">
                <form:label path="imageUrl">Ảnh sản phẩm</form:label>
                <!-- <form:input path="imageUrl" class="form-control" type="file" /> -->
                <form:input path="imageUrl" class="form-control" type="text" placeholder="Nhập URL ảnh sản phẩm"/>
            </div>
            <button type="submit" class="btn btn-success">Thêm sản phẩm</button
        </form:form>
    </div>

    <script>

        $(document).ready(function(){

            // thêm input
            $("#addContent").click(function () {

                let lastInput = $(".content-input").last().val().trim();

                if (lastInput === "") {
                    alert("Vui lòng không để trống nội dung trước khi thêm!");
                    return;
                }

                $("#content-wrapper").append(`
                    <div class="input-group mb-2 content-item">
                        <input type="text" class="form-control content-input" placeholder="Nhập nội dung">
                        <button type="button" class="btn btn-danger removeContent">X</button>
                    </div>
                `);
            });

            // xoá input
            $(document).on("click", ".removeContent", function () {

                if ($(".content-item").length > 0) {
                    $(this).closest(".content-item").remove();
                } else {
                    alert("Phải có ít nhất 1 nội dung");
                }

            });

            // submit form
            $("form").submit(function () {

                let contents = [];

                $(".content-input").each(function () {

                    let value = $(this).val().trim();

                    if (value !== "") {
                        contents.push(value);
                    }

                });

                let result = contents.join("/00pizon16");

                $("#finalContent").val(result);

            });

        });

    </script>

    <script>

        $(document).ready(function(){

            // thêm lesson
            $("#addLesson").click(function(){

                $("#lesson-wrapper").append(`
                <div class="lesson border p-3 mb-3">

                    <input type="text" class="form-control lesson-title mb-2" placeholder="Tên lesson">

                    <input type="text" class="form-control step-input mb-2 ms-2" placeholder="Tiến trình nhỏ">

                    <button type="button" class="btn btn-sm btn-primary addStep">
                        + Thêm tiến trình
                    </button>

                    <button type="button" class="btn btn-sm btn-danger removeLesson">
                        Xoá lesson
                    </button>

                </div>
                `);

            });

            // thêm step
            $(document).on("click",".addStep",function(){

                $(this).before(`
                <input type="text" class="form-control step-input mb-2 ms-2" placeholder="Tiến trình nhỏ">
                `);

            });

            // xoá lesson
            $(document).on("click",".removeLesson",function(){

                if($(".lesson").length > 1){
                    $(this).closest(".lesson").remove();
                }else{
                    alert("Phải có ít nhất 1 lesson");
                }

            });

            // submit
            $("form").submit(function(){

                let lessons = [];

                $(".lesson").each(function(){

                    let title = $(this).find(".lesson-title").val().trim();
                    let steps = [];

                    $(this).find(".step-input").each(function(){

                        let value = $(this).val().trim();

                        if(value !== ""){
                            steps.push(value);
                        }

                    });

                    if(title !== "" && steps.length > 0){

                        let lessonData = title + "|" + steps.join("/000pizon17");

                        lessons.push(lessonData);

                    }

                });

                let result = lessons.join("/00pizon16");

                $("#finalLessonData").val(result);

            });

        });

    </script>
</body>
</html>