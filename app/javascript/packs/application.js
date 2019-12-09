import "bootstrap";
import lottie from 'lottie-web'


var bmElements = document.querySelectorAll('.bm-element');


bmElements.forEach(element => {
    console.log(element.dataset.icon)
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
    console.log(element.dataset.icon)
  lottie.loadAnimation({
  container: element, // the dom element that will contain the animation
  renderer: 'svg',
  autoplay: true, // Optional
  loop: false,
  animationData: JSON.parse(element.dataset.icon) // the path to the animation json
  })
});




// var slider = document.getElementById("myRange");
// var output = document.getElementById("demo");
// output.innerHTML = slider.value;

// slider.oninput = function() {
//   output.innerHTML = this.value;
// }


document.getElementById("btnCopy").addEventListener("click", function(){
       var copyText = document.getElementById("myText");
       copyText.select();
       document.execCommand("Copy");
       document.getElementById("copy-prompt").classList.remove('d-none')
       var paragraph = document.getElementById("btn-copy");
       var text = document.createTextNode(" again");

      paragraph.appendChild(text);
     });
