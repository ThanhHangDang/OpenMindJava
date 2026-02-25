const menuToggle = document.getElementById("menuToggle");
const mobileMenu = document.getElementById("mobileMenu");

menuToggle.addEventListener("click", () => {
    mobileMenu.style.display = mobileMenu.style.display === "block" ? "none" : "block";
});