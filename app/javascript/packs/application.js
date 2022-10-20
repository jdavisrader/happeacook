// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()



// Stuff that I've added
// require("@popperjs/core")
// require("jquery")
require("select2")

import "cocoon";

import 'bootstrap/dist/js/bootstrap'
import 'bootstrap/dist/css/bootstrap'
require("stylesheets/application.scss")

import Sortable from 'sortablejs';


// If you're using Turbolinks. Otherwise simply use: jQuery(function () {
document.addEventListener("turbolinks:load", () => {
		var el = document.getElementById('sort-ingredients');
		var sortable = Sortable.create(el);

		document.getElementById('add-linked-ingredients').addEventListener("click", () =>{
			var el = document.getElementById('sort-ingredients');
			var sortable = Sortable.create(el);
		})
    // Both of these are from the Bootstrap 5 docs
    var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
    var tooltipList = tooltipTriggerList.map(function(tooltipTriggerEl) {
        return new Tooltip(tooltipTriggerEl)
    })

    var popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'))
    var popoverList = popoverTriggerList.map(function(popoverTriggerEl) {
        return new Popover(popoverTriggerEl)
    })

		$('.tag-multiple').select2();
})
