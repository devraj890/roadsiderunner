// toggle icon navbar
function myFunction() {
    let menuIcon = document.querySelector('#menu-icon');
    let navbar = document.querySelector('.con-head');

    // menuIcon.onclick = () => {
    // menuIcon.classList.toggle('fa-x');
    navbar.classList.toggle('active');
    // };
}

// scroll section active link

let sections = document.querySelectorAll('section');
let navLinks = document.querySelectorAll('header nav a');

window.onscroll = () => {
    sections.forEach(sec => {
        let top = window.scrollY;
        let offset = sec.offsetTop - 150;
        let height = sec.offsetHeight;
        let id = sec.getAttribute('id');

        if (top >= offset && top < offset + height) {
            navLinks.forEach(links => {
                links.classList.remove('active');
                document.querySelector('header nav a[href*=' + id + ']').classList.add('active');
            });
        };
    });

    // sticky navbar

    let header = document.querySelector('header');
    header.classList.toggle('sticky', window.scrollY > 100);

    let navbar = document.querySelector('.con-head');
    navbar.classList.remove('active');
};

// scroll revel animation

ScrollReveal({
    // reset: true,
    distance: '80px',
    duration: 2000,
    delay: 200
});

ScrollReveal().reveal('.about-content, .heading', { origin: 'top' });
ScrollReveal().reveal('.about-img, .contact-details', { origin: 'left' });
ScrollReveal().reveal('.re-more, .service-container, .client-container .about-more-content', { origin: 'bottom' })
ScrollReveal().reveal('.about-content p, .contact-form', { origin: 'right' })