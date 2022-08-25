// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import HelloController from "./hello_controller"
application.register("hello", HelloController)

import LocationAutocompleteController from "./location_autocomplete_controller"
application.register("location-autocomplete", LocationAutocompleteController)

import MapController from "./map_controller"
application.register("map", MapController)

import NavbarController from "./navbar_controller"
application.register("navbar", NavbarController)
