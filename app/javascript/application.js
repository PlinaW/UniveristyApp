// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
//= require materialize

import "@hotwired/turbo-rails"
import "controllers"

import "jquery"
import "materialize"


$(document).ready(function(){
  $(".dropdown-trigger").dropdown();
  $('.sidenav').sidenav();
});
