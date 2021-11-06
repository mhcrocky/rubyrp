// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")
require("@hotwired/turbo")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

// Packs
require("./components/TodoApp")
require("./components/CookieBanner")

// Analytics
import gtag from "src/analytics"

// Charts
require("chartkick")
require("chart.js")

// Stimulus
import "controllers"

// Hotwire
import "@hotwired/turbo-rails"

// Bootstrap
import 'bootstrap/dist/css/bootstrap'

window.bootstrap = require('bootstrap/dist/js/bootstrap.bundle.js');
document.addEventListener("DOMContentLoaded", function(event) {
  var popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'))
  var popoverList = popoverTriggerList.map(function (popoverTriggerEl) {
    return new bootstrap.Popover(popoverTriggerEl)
  })

  var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
  var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
    return new bootstrap.Tooltip(tooltipTriggerEl)
  })
});

// Action View
require("trix")
require("@rails/actiontext")
// trix-editor-overrides.js
window.addEventListener("trix-file-accept", function(event) {
  event.preventDefault()
  alert("File attachment not supported")
  console.log('File attachment not supported')
})


// console.log('application js firing')
