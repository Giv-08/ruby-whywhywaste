// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "@popperjs/core"
import "bootstrap"

// flickity
var flkty = new Flickity( '.main-gallery', {
  // options
  cellAlign: 'left',
  contain: true
});
import "@rails/request.js"
