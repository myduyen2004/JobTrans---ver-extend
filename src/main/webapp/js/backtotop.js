//nut backtotop
window.addEventListener("scroll", function () {
    const backToTop = document.getElementById("backtotop");
    backToTop.style.display = window.scrollY > 200 ? "block" : "none";
});

document.addEventListener("DOMContentLoaded", function () {
    const backToTop = document.getElementById("backtotop");
    backToTop.addEventListener("click", function () {
        window.scrollTo({ top: 0, behavior: "smooth" });
    });
});
