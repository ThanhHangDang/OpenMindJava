
  const carousel = document.querySelectorAll('#productCarousel .carousel-item');

  carousel.forEach((el) => {
    let next = el.nextElementSibling;
    for (let i = 1; i < 4; i++) {
      if (!next) {
        next = carousel[0];
      }
      let cloneChild = next.querySelector('.card').cloneNode(true);
      el.appendChild(cloneChild);
      next = next.nextElementSibling;
    }
  });
