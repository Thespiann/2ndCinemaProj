//background image change
var images= ['bg1.jpg','bg2.jpg','bg3.jpg','bg4.jpg','bg5.jpg','bg6.jpg','bg7.jpg','bg8.jpg','bg9.jpg','bg10.jpg','bg11.jpg','bg12.jpg'];

var i=0;
var bg= document.getElementById('full-page')
function bgImage(){
    bg.style.backgroundImage= 'url(pictures/'+images[i]+')';
    i=(i+1)% images.length;
}
// Preloading images for smoother transitions on the first iteration of my images array
function preloadImages() {
    for (var i = 0; i < images.length; i++) {
        var img = new Image();
        img.src ="pictures/"+ images[i];
    }
}
preloadImages();
setInterval(bgImage,5000)
