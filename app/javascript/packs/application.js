// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


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
import { initSelectDeliveryPoint } from "./select_delivery_point";
import { displayDeliveryForm } from "./display_delivery_form";
import { showDeliveryPart } from "./show_delivery_part";
import { getCEP } from "./cep_search";
import { initChangeImage } from "./change_image";
import { advancedSearch } from "./advanced_search";
import { initUpdateNavbarOnScroll } from '../components/navbar';

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  if (document.querySelector(".card-address")) {
  	initSelectDeliveryPoint();	
  }

  if (document.getElementById("new_delivery_point")) {
  	displayDeliveryForm();
  }

  if (document.getElementById("validate-cart")) {
  	showDeliveryPart();
  }

  if (document.getElementById("new_company")) {
    getCEP();
  }

  if (document.getElementById("new_delivery_point")) {
    getCEP();
  }

  if (document.getElementById("main-pic")) {
    initChangeImage();
  }
    
  if (document.getElementById("advanced-search-form")) {
    advancedSearch();
  }

  if (document.getElementById("home")) {
    console.log("home found");
    initUpdateNavbarOnScroll();
  }
  
});

