const initUpdateNavbarOnScroll = () => {
  const navbar = document.querySelector('.navbar-lewagon');
  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= window.innerHeight) {
        navbar.classList.add('navbar-lewagon-dark');
      } else {
        navbar.classList.remove('navbar-lewagon-dark');
      }
    });
  }
}

export { initUpdateNavbarOnScroll };
