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
        // xử lý content
        let contents = [];
        $(".content-input").each(function () {

            let value = $(this).val().trim();

            if (value !== "") {
                contents.push(value);
            }

        });

        let result = contents.join("|");

        $("#finalContent").val(result);

        // xử lý lesson
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
                let lessonData = title + "|" + steps.join("~");

                lessons.push(lessonData);
            }
        });

        let resultLesson = lessons.join("#");
        $("#finalLessonData").val(resultLesson);

        // Check rỗng tất cả các trường
        if($("#productName").val().trim() === ""){
            alert("Tên sản phẩm không được để trống!");
            return false;
        }
        if($("#category").val() === ""){
            alert("Vui lòng chọn danh mục sản phẩm!");
            return false;
        }
        if($("#price").val().trim() == 0){
            alert("Giá sản phẩm không được để trống!");
            return false;
        }
        if($("#description").val().trim() === ""){
            alert("Mô tả sản phẩm không được để trống!");
            return false;
        }
        if(result === ""){
            alert("Vui lòng nhập ít nhất 1 nội dung!");
            return false;
        }
        if(resultLesson === ""){
            alert("Vui lòng nhập ít nhất 1 lesson với 1 tiến trình!");
            return false;
        }
        if($("#courseRequired").val().trim() === ""){
            alert("Yêu cầu khóa học không được để trống!");
            return false;
        }
        if($("#courseOutput").val().trim() === ""){
            alert("Đầu ra khóa học không được để trống!");
            return false;
        }
        if($("#imageUrl").val().trim() === ""){
            alert("Vui lòng chọn ảnh sản phẩm!");
            return false;
        }
    });

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

    //Thêm | vào cuối input khi nhấn enter cho description
    $("#description").keypress(function(event){
        if(event.which === 13){
            event.preventDefault();
            let currentValue = $(this).val();
            $(this).val(currentValue + "|");
        }
    });

    //Thêm | vào cuối input khi nhấn enter cho courseRequired
    $("#courseRequired").keypress(function(event){
        if(event.which === 13){
            event.preventDefault();
            let currentValue = $(this).val();
            $(this).val(currentValue + "|");
        }
    });

    //Thêm | vào cuối input khi nhấn enter cho courseOutput
    $("#courseOutput").keypress(function(event){
        if(event.which === 13){
            event.preventDefault();
            let currentValue = $(this).val();
            $(this).val(currentValue + "|");
        }
    });
    
});
