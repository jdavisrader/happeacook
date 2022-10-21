function setIngredientOrder(){
	var ingredientList = document.getElementById("sort-ingredients");
	var ingredients = ingredientList.childNodes;
	for(let i = 0; i < ingredients.length; i++) {

		if (ingredients[i].className.includes("ingredients-sortable")) {
			var index = Array.prototype.indexOf.call(ingredientList.children, ingredients[i]);
			var position = ingredients[i].querySelector('.position');
			position.value = index;
			console.log(position.value);
		}
	}
};

function setInstructionOrder(){
	var instructionList = document.getElementById("sort-instructions");
	var instruction = instructionList.childNodes;
	for(let i = 0; i < instruction.length; i++) {

		if (instruction[i].className.includes("instructions-sortable")) {
			var index = Array.prototype.indexOf.call(instructionList.children, instruction[i]);
			var position = instruction[i].querySelector('.position');
			position.value = index;
			console.log(position.value);
		}
	}
};
