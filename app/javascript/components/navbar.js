const initUpdateNavbarOnScroll = () => {
  const navbar = document.querySelector('.navbar-lewagon');
  if (navbar) {
    navbar.classList.remove('white');
    console.log("test");
    window.addEventListener('scroll', () => {
      if (window.scrollY >= window.innerHeight * 0.8) {
        navbar.classList.add('white');
      } else {
        navbar.classList.remove('white');
      }
    });
  }
}

export { initUpdateNavbarOnScroll };