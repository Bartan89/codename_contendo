import "bootstrap";
import lottie from 'lottie-web'
import data from './data.json'

const bmElement = document.getElementById('bm');
const json = bmElement.dataset.icon
console.log({json})
lottie.loadAnimation({
  container: document.getElementById('bm'), // the dom element that will contain the animation
  renderer: 'svg/canvas/html',
  loop: true,
  autoplay: true,
  animationData: JSON.parse(json) // the path to the animation json
});
