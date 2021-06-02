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


//
// = queryselector.data-set.un

// const hippo = document.querySelector(".hippo");
// console.dir(hippo)
// const un = hippo.dataset.un;
// console.log(un)
// const deux = hippo.dataset.deux;
// console.log(deux)
//

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


// 5EME
const cheval1 = document.getElementById("horse1");
const positions1 = definePositions(10/100, 1, 1/100, 3)

// 4EME
const cheval2 = document.getElementById("horse2");
const positions2 = definePositions(9/100, 1, 2/100, 3)

// 3EME
const cheval3 = document.getElementById("horse3");
const positions3 = definePositions(8/100, 1, 3/100, 3)

// 2EME
const cheval4 = document.getElementById("horse4");
const positions4 = definePositions(7/100, 1, 4/100, 3)

// 1ER
const cheval5 = document.getElementById("horse5");
const positions5 = definePositions(8/100, 1, 5/100, 3)


function running(i) {
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



// function running(teta) {
//   const cheval1 = document.getElementById("horse1");
//   const cheval2 = document.getElementById("horse2");
//   const cheval3 = document.getElementById("horse3");
//   const cheval4 = document.getElementById("horse4");
//   const cheval5 = document.getElementById("horse5");
//   const chevals = [cheval1, cheval2, cheval3, cheval4, cheval5]
//   const delta = 50;
//   let places = ['bot', 'right', 'top', 'left']
//   let progress = places[0]

//   chevals.forEach((cheval) => {
//     console.log(cheval)

//     // let flipValueString = window.getComputedStyle(cheval);
//     // let flipValue = parseInt(flipValueString.transform, 10);

//     let leftValueString = window.getComputedStyle(cheval);
//     let leftValue = parseInt(leftValueString.left, 10);

//     let topValueString = window.getComputedStyle(cheval);
//     let topValue = parseInt(topValueString.top, 10);

//     console.log(leftValue)
//     console.log(topValue)
//     if ( leftValue >= 50 && topValue > 50 && leftValue <=270 ){
//       linearBot(cheval, leftValue, delta, teta);
//     } else if(leftValue >= 250 && topValue <=110){
//        turnRight(cheval, leftValue, delta, teta);
//     } else if(leftValue <= 250 && topValue <50){
//        linearTop(cheval, leftValue, delta, teta);
//     } else if( leftValue <= 50 && topValue <110 ){
//        turnLeft(cheval, leftValue, delta, teta);
//     }
//   });
// }

//   // leftValueString = window.getComputedStyle(cheval);
//   // leftValue = parseInt(leftValueString.left, 10);

//   // if ( leftValue = 250) {
//   //   cheval.style.transform = "rotateY(180deg)"
//   // }
//   // else if ( topValue < 60 ){
//   //   cheval.style.transform = "rotateY(180deg)"
//   // }



const animation = (data) => {
  const btn = document.querySelector('#race');
  if (btn) {
    btn.addEventListener("click", (event) => {
      running(0)
    });
  }
};

// function linearBot(cheval, leftValue, delta, teta){
//   cheval.style.left = `${leftValue + 10}px`
//   setTimeout(function(){ running(teta) }, delta);
// }
// function linearTop(cheval, leftValue, delta, teta){
//   cheval.style.left = `${leftValue - 10}px`
//   setTimeout(function(){ running(teta) }, delta);
// }

// function turnRight(cheval, leftValue, delta, teta){
//   teta += 2 * Math.PI * 1/delta;
//   console.log(teta);
//   cheval.style.left = `${250 + 60 * Math.cos(teta - Math.PI/3)}px`;
//   cheval.style.top = `${40 - 60 * Math.sin(teta - Math.PI/3)}px`;
//   setTimeout(function(){ running(teta) }, delta);
// }

// function turnLeft(cheval, leftValue, delta, teta){
//   teta += Math.PI * 1/delta;
//   console.log(teta);
//   cheval.style.left = `${40 + 60 * Math.cos(teta + Math.PI/3)}px`;
//   cheval.style.top = `${40 - 60 * Math.sin(teta + Math.PI/3)}px`;
//   setTimeout(function(){ running(teta) }, delta);
// }


// // function sleep(milliseconds) {
// //     const date = Date.now();
// //     let currentDate = null;
// //     do {
// //       currentDate = Date.now();
// //     } while (currentDate - date < milliseconds);
// // }


// // let topValueString = window.getComputedStyle(cheval);
//     // console.dir(topValueString)
//     // let topValue = parseInt(topValueString.top, 10);
//     // while ( topValue >= 50) {
//     //   console.log(topValue);
//     //   cheval.style.top = (topValue - 10) + "px";
//     //   sleep(500);
//     //   topValueString = window.getComputedStyle(cheval);
//     //   topValue = parseInt(topValueString.top, 10);
//     // }

export { animation }
