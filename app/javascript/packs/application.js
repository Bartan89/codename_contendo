import "bootstrap";
import lottie from 'lottie-web'


var bmElements = document.querySelectorAll('.bm-element');


bmElements.forEach(element => {
    console.log('loop')
  lottie.loadAnimation({
  container: element, // the dom element that will contain the animation
  renderer: 'svg',
  autoplay: true, // Optional
  loop: true,
  animationData: JSON.parse(element.dataset.icon) // the path to the animation json
  })
});


var bmElementsNoLoop = document.querySelectorAll('.bm-element-no-loop');


bmElementsNoLoop.forEach(element => {
    console.log('no loop')
  lottie.loadAnimation({
  container: element, // the dom element that will contain the animation
  renderer: 'svg',
  autoplay: true, // Optional
  loop: false,
  animationData: JSON.parse(element.dataset.icon) // the path to the animation json
  })
});



$(document).ready(function() {
        var offset = $('.ads').offset().top, top;
        $(document).on('scroll', function() {
            top = $(window).scrollTop() < offset ? '0' : $(window).scrollTop() - offset;
            $('.ads').css({
                'top': top + 'px'
            });
            $('.save').delay(1000).css({
                'top': top + 80 + 'px'
            });
        })
    });






// var slider = document.getElementById("myRange");

// var output = document.getElementById("demo");
// output.innerHTML = slider.value;

// slider.oninput = function() {
//   output.innerHTML = this.value;


// let hoverables = document.querySelectorAll('.iconToggler')
// hoverables.forEach(element => {
//   element.addEventListener("mouseover", function(){
//       querySelectorAll('.iconToggler')
//      });
// })

// if (document.querySelectorAll(".icon-toggler") !== null ) {
// document.querySelectorAll(".icon-toggler").addEventListener("mouseover", function(){
//        document.querySelectorAll(".icon-preview").classList.remove('d-none')
//      });

// document.querySelectorAll("icon-toggler").addEventListener("mouseout", function(){
//        document.querySelectorAll("icon-preview").classList.add('d-none')
//      });
// }

// if (document.getElementById("icon-hover") !== null ) {
// document.getElementById("btnCopy").addEventListener("click", function(){
//        var copyText = document.getElementById("myText");
//        copyText.select();
//        document.execCommand("Copy");
//        document.getElementById("copy-prompt").classList.remove('d-none')
//        var paragraph = document.getElementById("btn-copy");
//        var text = document.createTextNode(" again");

//       paragraph.appendChild(text);
//      });
// }




