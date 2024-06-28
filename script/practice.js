// const popup = document.querySelector ('.popup')
// const bg = document.querySelector ('.bg')
// const click = document.querySelector('.click')
// console.log(popup, bg, click)

// popup.style.display = 'none'

// click.addEventListener('click', function (e) {
//     popup.style.display = 'block';
//     e.preventDefault();
// })

// const siteMap_go = document.querySelector('.siteMap_go')
const btn = document.querySelector('.btn')
const pop_bg = document.querySelector('.pop_bg')
const sitemap = document.querySelector('.sm_box')
console.log(btn, pop_bg, sitemap)

btn.addEventListener('click', function (e){ 
    pop_bg.style.display = 'block';
    sitemap.style.display = 'block';
    e.preventDefault();
})