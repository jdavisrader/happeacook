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
import 'bootstrap-icons/font/bootstrap-icons.css'
require("stylesheets/application.scss")

import Sortable from 'sortablejs';

import $ from 'jquery';

require("select2/dist/css/select2")
require("select2-bootstrap-theme/dist/select2-bootstrap")

import Select2 from "select2"

require("packs/recipes")




// If you're using Turbolinks. Otherwise simply use: jQuery(function () {
document.addEventListener("turbolinks:load", () => {
		var sortIngredients = document.getElementById('sort-ingredients');
		var sortable = Sortable.create(sortIngredients, {
			animation: 150,
			handle: '.grip',
    	ghostClass: 'blue-background-class'
		});

		var sortInstructions = document.getElementById('sort-instructions');
		var sortable = Sortable.create(sortInstructions, {
			animation: 150,
			handle: '.grip',
    	ghostClass: 'blue-background-class'
		});

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

		$('#recipe-submit').click(function(e){
			e.preventDefault();
			var ingredientList = document.getElementById("sort-ingredients");
			var ingredients = ingredientList.childNodes;
			for(let i = 0; i < ingredients.length; i++) {

				if (ingredients[i].className.includes("ingredients-sortable")) {
					var index = Array.prototype.indexOf.call(ingredientList.children, ingredients[i]);
					var position = ingredients[i].querySelector('.position');
					position.value = index
				}
			}

			var instructionList = document.getElementById("sort-instructions");
			var instruction = instructionList.childNodes;
			for(let i = 0; i < instruction.length; i++) {

				if (instruction[i].className.includes("instructions-sortable")) {
					var index = Array.prototype.indexOf.call(instructionList.children, instruction[i]);
					var position = instruction[i].querySelector('.position');
					position.value = index
				}
			}

			$('#recipe-form').submit();
		})
})
