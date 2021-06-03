const xMin = 50;
const xMax = 250;
const yMax = 110;
const yMin = -10;

const xCr = xMax;
const yCr = yMin + (yMax - yMin)/2;
const xCl = xMin;
const yCl = yMin + (yMax - yMin)/2;

const tetaMaxl =  3 * Math.PI / 2
const tetaMaxr =  Math.PI / 2

const delta = 50;


const definePositions = (a1, b1, a2, b2) => {
  let dx = 1;
  // const dt = dx * Math.PI / (4 * 60 )
  const positions = []

  let x = xMin;
  let y = yMax;
  while (x < xMax) {
    dx = a1 * x + b1
    x += dx
    // console.log(dx)
    // console.log(x)
    y = yMax
    positions.push({x: x, y: y})
  }

  let teta = - Math.PI / 2
  while (teta <= tetaMaxr) {
    const dt = dx * Math.PI / (4 * 60 )
    teta += dt
    x = xCr + 60 * Math.cos(teta);
    y = yCr - 60 * Math.sin(teta);
    positions.push({x: x, y: y})
  }

  while (x > xMin) {
    dx = a2 * x + b2
    x -= dx
    y = yMin
    positions.push({x: x, y: y})
  }

  teta = Math.PI / 2
  while (teta <= tetaMaxl) {
    const dt = dx * Math.PI / (4 * 60 )
    teta += dt
    x = xCl + 60 * Math.cos(teta);
    y = yCl - 60 * Math.sin(teta);
    positions.push({x: x, y: y})
  }

  let ii = 0
  while (ii <= 1000) {
    positions.push({x: xMin, y: yMax})
    // console.log(ii);
    ii += 1
  }

  return positions
}


function running(i) {

  const hippo = document.querySelector("#hip");

  if (hippo) {

  // 5EME
    const cheval1 = document.getElementById(hippo.dataset.cinq);
    const positions1 = definePositions(10/400, 1, 1/400, 3)

    // 4EME
    const cheval2 = document.getElementById(hippo.dataset.quatre);
    const positions2 = definePositions(9/400, 1, 2/400, 3)

    // 3EME
    const cheval3 = document.getElementById(hippo.dataset.trois);
    const positions3 = definePositions(8/400, 1, 3/400, 3)

    // 2EME
    const cheval4 = document.getElementById(hippo.dataset.deux);
    const positions4 = definePositions(7/400, 1, 4/400, 3)

    // 1ER
    const cheval5 = document.getElementById(hippo.dataset.un);
    const positions5 = definePositions(8/400, 1, 5/400, 3)

    const position1 = positions1[i]
    cheval1.style.left = `${position1.x}px`
    cheval1.style.top = `${position1.y}px`

    const position2 = positions2[i]
    cheval2.style.left = `${position2.x}px`
    cheval2.style.top = `${position2.y}px`

    const position3 = positions3[i]
    cheval3.style.left = `${position3.x}px`
    cheval3.style.top = `${position3.y}px`

    const position4 = positions4[i]
    cheval4.style.left = `${position4.x}px`
    cheval4.style.top = `${position4.y}px`

    const position5 = positions5[i]
    cheval5.style.left = `${position5.x}px`
    cheval5.style.top = `${position5.y}px`

    i += 1;
    if (positions1.length - 1 > i ) {
      setTimeout(function(){ running(i) }, delta);
    }
  }

}

const animation = (data) => {
  const hip = document.querySelector('#hip');
  if (hip) {
    running(0)
  }
};


export { animation }
