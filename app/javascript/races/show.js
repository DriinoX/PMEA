const animation = (data) => {
  const btn = document.querySelector('#race');

  function sleep(milliseconds) {
    const date = Date.now();
    let currentDate = null;
    do {
      currentDate = Date.now();
    } while (currentDate - date < milliseconds);
  }

  btn.addEventListener("click", (event) => {
    const cheval = document.getElementById("horse1");
    let leftValueString = window.getComputedStyle(cheval);
    console.dir(leftValueString)
    let leftValue = parseInt(leftValueString.left, 10);
    while ( leftValue <= 250) {
      console.log(leftValue);
      cheval.style.left = (leftValue + 10) + "px";
      sleep(500);
      leftValueString = window.getComputedStyle(cheval);
      leftValue = parseInt(leftValueString.left, 10);
    }
  });
};

export { animation }
