const range = document.getElementById("priceRange");
    const priceValue = document.getElementById("priceValue");

    function formatCurrency(value) {
        return new Intl.NumberFormat('vi-VN').format(value) + " VNĐ";
    }

    range.addEventListener("input", function () {
        priceValue.textContent = formatCurrency(this.value);
    });