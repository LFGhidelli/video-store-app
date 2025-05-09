// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

const flatpickr = require("flatpickr");

document.addEventListener("DOMContentLoaded", () => {
  flatpickr(".datepicker", {
    minDate: "today",
    dateFormat: "Y-m-d"
  });
});
