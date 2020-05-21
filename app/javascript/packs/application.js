require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")

import "bootstrap";
// import loadSiema from '../components/siema-carousel';
// loadSiema();

import Siema from 'siema';
import { loadSiema } from '../components/siema-carousel';
const mySiema = new Siema();
document.querySelector('.prev').addEventListener('click', () => mySiema.prev());
document.querySelector('.next').addEventListener('click', () => mySiema.next());
new Siema({
    selector: '.siema',
    duration: 200,
    easing: 'ease-out',
    perPage: 1,
    startIndex: 0,
    draggable: true,
    multipleDrag: true,
    threshold: 20,
    loop: false,
    rtl: false,
    onInit: () => {},
    onChange: () => {},
  });
