import Siema from 'siema';
const mySiema = new Siema({
    perPage: 3,
    loop: true,
  });
  const prev = document.querySelector('.prev');
  const next = document.querySelector('.next');
  
  prev.addEventListener('click', () => mySiema.prev());
  next.addEventListener('click', () => mySiema.next());
  
  setInterval(() => mySiema.next(), 4000)

export { mySiema } from 'siema';