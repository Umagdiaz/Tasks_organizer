// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

import "@hotwired/turbo-rails"
import "controllers"
import 'jquery'
import '@popperjs/core'
import 'bootstrap'
import "vanilla-nested"
import "cocoon"

import "../src/stylesheets/application"
import "../src/javascripts/main"

