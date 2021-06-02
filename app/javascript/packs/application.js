// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("races/show.js")



// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';
import { animation } from '../races/show.js';

import { initRoomCable } from '../channels/room_channel';

import { initRaceCable } from '../channels/race_channel';

import {refreshh} from '../rooms/show.js';



// trouver

const refresh = document.querySelector("#refresh");
//console.dir(refresh.dataset.refresh === 'true');
function replay() {
  if (refresh) {
    const roomId = refresh.dataset.roomid;
    const url = `/rooms/refresh/${roomId}`
    fetch(url)
    .then(response => response.json())
    .then((data) => {
      if(data.refresh === true){
        window.location.reload();
      };
    });
    window.setTimeout(function(){replay()}, 3000);
  }
};

replay()

  // fetch(url)
  // {
  //  if (data['refresh'] === 'true') {
  //   window.location.reload();
  //  }
  // }

  // };


  // refreshh();


// window.location.reload();
document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  animation();
  initRoomCable();
  initRaceCable();
});
