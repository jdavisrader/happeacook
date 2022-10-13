# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Seeding..."

users = User.create([
	# {
	# 	email: "jordan@example.com",
	# 	username: "jodamannn",
	# 	password: "example1",
	# 	password_confirmation: "example1"
	# },
	{
		email: "claire@example.com",
		username: "claire-a-belle",
		password: "example1",
		password_confirmation: "example1"
	}
])

recipes = Recipe.create([{
	name: "Sister Tanner's cookies",
	description: "Delicious cookie bars enjoyed at christmas time",
	user_id: "1",
	ingredients_attributes: [
		{
			measurement: "1 Box",
			name: "Vanilla wafers - Crushed",
			order_number: "1"
		},
		{
			measurement: "2 Cubes",
			name: "Butter",
			order_number: "2"
		},
		{
			measurement: "1/4 cup",
			name: "Powdered Sugar",
			order_number: "3"
		},
		{
			measurement: "2 cups",
			name: "Shredded Coconut",
			order_number: "4"
		},
		{
			measurement: "1 Can",
			name: "Eagle Brand Milk",
			order_number: "5"
		},
		{
			measurement: "1 tsp",
			name: "Vanilla",
			order_number: "6"
		},
		{
			measurement: "1 cup",
			name: "Semi-sweet Chocolate Chips",
			order_number: "7"
		},
		{
			measurement: "1 cup",
			name: "Milk Chocolate Chips",
			order_number: "8"
		},
		{
			measurement: "2 Tbs",
			name: "Peanut Butter",
			order_number: "9"
		}
	],
	instructions_attributes: [
		{
			step_number: "1",
			step: "Mix together vanilla wafers, butter, and powdered sugar and press into a 9x13 pan. Bake at 350 for 8-10 minutes"
		},
		{
			step_number: "2",
			step: "Mix together coconut, Eagle Brand Milk, and vanilla. Pour over wafer crust. Bake for 15 minutes"
		},
		{
			step_number: "3",
			step: "In a double boiler, melt the chocolate chips and peanut butter over medium low. Heat until smooth. Spread over coconut mixture."
		},
		{
			step_number: "4",
			step: "Let cool. Cut into squares."
		}
	]

	},
	{
		name: "Jamie's Old Fashioned Ginger Crinkle Cookies",
		description: "These cookies are nice and chewy on the inside with a nice crunch on the outside. They have a wonderfully soft texture from using both shortening and butter. When you bake these cookies, your house will smell like Christmas!",
		user_id: "2",
		prep_time: "10 min",
		cook_time: "25 min",
		servings: "48",
		ingredients_attributes: [
			{
				measurement: "2 Cups",
				name: "All-purpose flour",
				order_number: "1"
			},
			{
				measurement: "2 tsp",
				name: "Baking Soda",
				order_number: "2"
			},
			{
				measurement: "1 1/2 tsp",
				name: "Ground Ginger",
				order_number: "3"
			},
			{
				measurement: "1 tsp",
				name: "Ground Cinnamon",
				order_number: "4"
			},
			{
				measurement: "1/2 tsp",
				name: "Kosher Salt",
				order_number: "5"
			},
			{
				measurement: "1/4 tsp",
				name: "Ground Allspice",
				order_number: "6"
			},
			{
				measurement: "1/4 tsp",
				name: "Ground Cloves",
				order_number: "7"
			},
			{
				measurement: "1/2 Cup",
				name: "Vegetable Shortening",
				order_number: "8"
			},
			{
				measurement: "1/4 Cup",
				name: "Unsalted butter, softened",
				order_number: "9"
			},
			{
				measurement: "1/2 Cup",
				name: "Light Brown Sugar - Firmly Packed",
				order_number: "10"
			},
			{
				measurement: "1/2 Cup",
				name: "Granulated Sugar",
				order_number: "11"
			},
			{
				measurement: "1/4 Cup",
				name: "Molasses",
				order_number: "12"
			},
			{
				measurement: "1 Large",
				name: "Egg",
				order_number: "13"
			},
			{
				measurement: "1/4 cup",
				name: "Turbinado Sugar",
				order_number: "14"
			}
		],
		instructions_attributes: [
			{
				step_number: "1",
				step: "Preheat the oven to 350 degrees F."
			},
			{
				step_number: "2",
				step: "In a medium bowl, whisk together the flour, baking soda, ground ginger, cinnamon, salt, allspice, and cloves."
			},
			{
				step_number: "3",
				step: "In a stand mixer fitted with a paddle attachment, add the shortening, butter, brown and granulated sugar. Beat on medium speed until light and fluffy, about 3-4 minutes. Slip in the molasses and egg and beat until well incorporated. Add the flour mixture by scoopfulls and beat until combined."
			},
			{
				step_number: "4",
				step: "Add the turbinado sugar to a small plate or bowl. Roll the dough into balls that are 1 inch in diameter (1/2 ounce in weight), then roll in the sugar. Place 12 balls on a baking sheet 2 inches apart."
			},
			{
				step_number: "5",
				step: "Bake the cookies 9 to 11 minutes, rotating the sheet halfway through the baking time."
			},
			{
				step_number: "6",
				step: "Cool baking sheets for 4 minutes, then continue cooling on wire racks. Repeat until all cookies are baked."
			},
		]

	}


	])

	puts "Seeding done."
