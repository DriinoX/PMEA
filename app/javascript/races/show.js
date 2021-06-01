
// const lineTopPositions = () => {


//   while ( leftValue <= 250) {
//     console.log(leftValue);

//   }
// }



function running(teta) {
  const cheval = document.getElementById("horse1");
  const delta = 50;

  let leftValueString = window.getComputedStyle(cheval);
  let leftValue = parseInt(leftValueString.left, 10);

  let topValueString = window.getComputedStyle(cheval);
  let topValue = parseInt(topValueString.top, 10);

  if (leftValue <= 250){
    linearBot()
  }
  if (topValue > 0 ){
    turnRight()
  }
}


const animation = (data) => {
  const btn = document.querySelector('#race');
  btn.addEventListener("click", (event) => {
    running(100)
  });
};

function linearBot(){
  cheval.style.left = `${leftValue + 10}px`
  setTimeout(function(){ running() }, delta);
}

function turnRight(){
  teta += Math.PI * 1/delta;
  console.log(teta);
  cheval.style.left = `${60 + 60 * Math.cos(teta)}px`;
  cheval.style.top = `${60 - 60 * Math.sin(teta)}px`;
  setTimeout(function(){ running(teta) }, delta);
}



// function sleep(milliseconds) {
//     const date = Date.now();
//     let currentDate = null;
//     do {
//       currentDate = Date.now();
//     } while (currentDate - date < milliseconds);
// }


// let topValueString = window.getComputedStyle(cheval);
    // console.dir(topValueString)
    // let topValue = parseInt(topValueString.top, 10);
    // while ( topValue >= 50) {
    //   console.log(topValue);
    //   cheval.style.top = (topValue - 10) + "px";
    //   sleep(500);
    //   topValueString = window.getComputedStyle(cheval);
    //   topValue = parseInt(topValueString.top, 10);
    // }

export { animation }
