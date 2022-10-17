# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Seeding..."

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Seeding..."

User.create!([
  {email: "jdavisrader@gmail.com", password: "example1", password_confirmation: "example1", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, username: "jodamannn"},
  {email: "claire@example.com", password: "example1", password_confirmation: "example1", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, username: "claire-a-belle"},
  {email: "jeffprader@gmail.com", password: "example1", password_confirmation: "example1", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, username: "Dad"},
  {email: "cassidymrader@gmail.com", password: "example1", password_confirmation: "example1", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, username: "CMRad"},
  {email: "raderclaire@gmail.com", password: "example1", password_confirmation: "example1", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: "2022-10-05 18:01:04", username: "Belle"}
])

Recipe.create!([
  {user_id: User.find_by(username: "jodamannn").id, name: "Sister Tanner's cookies", description: "Delicious cookie bars enjoyed at christmas time", servings: nil, prep_time: nil, cook_time: nil, rest_time: nil, total_time: nil, calories: nil},
  {user_id: User.find_by(username: "jodamannn").id, name: "Jamie's Old Fashioned Ginger Crinkle Cookies", description: "These cookies are nice and chewy on the inside with a nice crunch on the outside. They have a wonderfully soft texture from using both shortening and butter. When you bake these cookies,your house will smell like Christmas!", servings: 48, prep_time: 10, cook_time: 25, rest_time: nil, total_time: nil, calories: nil},
  {user_id: User.find_by(username: "Dad").id, name: "Peanut-Buttered Popcorn", description: "An oldie but a goodie! Family favorite peanut buttered popcorn makes you popular at parties and is good to eat. Makes 3 quarts of goodness.", servings: nil, prep_time: nil, cook_time: nil, rest_time: nil, total_time: nil, calories: nil},
  {user_id: User.find_by(username: "CMRad").id, name: "Grandma McGary's Pumpkin Cookies", description: "Brock's Grandma's cookies", servings: nil, prep_time: nil, cook_time: nil, rest_time: nil, total_time: nil, calories: nil},
  {user_id: User.find_by(username: "CMRad").id, name: "Bundt Dump Cake", description: "Lisa Lambert", servings: nil, prep_time: nil, cook_time: nil, rest_time: nil, total_time: nil, calories: nil},
  {user_id: User.find_by(username: "CMRad").id, name: "Kelly's French Silk Chocolate Pie", description: "Jordan's favorite", servings: nil, prep_time: nil, cook_time: nil, rest_time: nil, total_time: nil, calories: nil},
  {user_id: User.find_by(username: "Belle").id, name: "Cowboy Cookies", description: "Oatmeal Chocolate Chip Cookies", servings: nil, prep_time: nil, cook_time: nil, rest_time: nil, total_time: nil, calories: nil},
  {user_id: User.find_by(username: "Dad").id, name: "Nana's Banana Nut Bread", description: "This is a banana bread Nana made for years. It's the one we use in the Rader House.", servings: nil, prep_time: 20, cook_time: 45, rest_time: nil, total_time: nil, calories: 0},
  {user_id: User.find_by(username: "Dad").id, name: "Nana's A to Z bread", description: "This recipe makes bread from just about any fruit or vegetable. We normally used it with zucchini. ", servings: nil, prep_time: nil, cook_time: nil, rest_time: nil, total_time: nil, calories: nil}
])


Ingredient.create!([
  {measurement: "1 Box", name: "Vanilla wafers - Crushed", recipe_id: Recipe.find_by(name: "Sister Tanner's cookies").id, order_number: 1},
  {measurement: "2 Cubes", name: "Butter", recipe_id: Recipe.find_by(name: "Sister Tanner's cookies").id, order_number: 2},
  {measurement: "1/4 cup", name: "Powdered Sugar", recipe_id: Recipe.find_by(name: "Sister Tanner's cookies").id, order_number: 3},
  {measurement: "2 cups", name: "Shredded Coconut", recipe_id: Recipe.find_by(name: "Sister Tanner's cookies").id, order_number: 4},
  {measurement: "1 Can", name: "Eagle Brand Milk", recipe_id: Recipe.find_by(name: "Sister Tanner's cookies").id, order_number: 5},
  {measurement: "1 tsp", name: "Vanilla", recipe_id: Recipe.find_by(name: "Sister Tanner's cookies").id, order_number: 6},
  {measurement: "1 cup", name: "Semi-sweet Chocolate Chips", recipe_id: Recipe.find_by(name: "Sister Tanner's cookies").id, order_number: 7},
  {measurement: "1 cup", name: "Milk Chocolate Chips", recipe_id: Recipe.find_by(name: "Sister Tanner's cookies").id, order_number: 8},
  {measurement: "2 Tbs", name: "Peanut Butter", recipe_id: Recipe.find_by(name: "Sister Tanner's cookies").id, order_number: 9},
  {measurement: "2 Cups", name: "All-purpose flour", recipe_id: Recipe.find_by(name: "Jamie's Old Fashioned Ginger Crinkle Cookies").id, order_number: 1},
  {measurement: "2 tsp", name: "Baking Soda", recipe_id: Recipe.find_by(name: "Jamie's Old Fashioned Ginger Crinkle Cookies").id, order_number: 2},
  {measurement: "1 1/2 tsp", name: "Ground Ginger", recipe_id: Recipe.find_by(name: "Jamie's Old Fashioned Ginger Crinkle Cookies").id, order_number: 3},
  {measurement: "1 tsp", name: "Ground Cinnamon", recipe_id: Recipe.find_by(name: "Jamie's Old Fashioned Ginger Crinkle Cookies").id, order_number: 4},
  {measurement: "1/2 tsp", name: "Kosher Salt", recipe_id: Recipe.find_by(name: "Jamie's Old Fashioned Ginger Crinkle Cookies").id, order_number: 5},
  {measurement: "1/4 tsp", name: "Ground Allspice", recipe_id: Recipe.find_by(name: "Jamie's Old Fashioned Ginger Crinkle Cookies").id, order_number: 6},
  {measurement: "1/4 tsp", name: "Ground Cloves", recipe_id: Recipe.find_by(name: "Jamie's Old Fashioned Ginger Crinkle Cookies").id, order_number: 7},
  {measurement: "1/2 Cup", name: "Vegetable Shortening", recipe_id: Recipe.find_by(name: "Jamie's Old Fashioned Ginger Crinkle Cookies").id, order_number: 8},
  {measurement: "1/4 Cup", name: "Unsalted butter, softened", recipe_id: Recipe.find_by(name: "Jamie's Old Fashioned Ginger Crinkle Cookies").id, order_number: 9},
  {measurement: "1/2 Cup", name: "Light Brown Sugar - Firmly Packed", recipe_id: Recipe.find_by(name: "Jamie's Old Fashioned Ginger Crinkle Cookies").id, order_number: 10},
  {measurement: "1/2 Cup", name: "Granulated Sugar", recipe_id: Recipe.find_by(name: "Jamie's Old Fashioned Ginger Crinkle Cookies").id, order_number: 11},
  {measurement: "1/4 Cup", name: "Molasses", recipe_id: Recipe.find_by(name: "Jamie's Old Fashioned Ginger Crinkle Cookies").id, order_number: 12},
  {measurement: "1 Large", name: "Egg", recipe_id: Recipe.find_by(name: "Jamie's Old Fashioned Ginger Crinkle Cookies").id, order_number: 13},
  {measurement: "1/4 cup", name: "Turbinado Sugar", recipe_id: Recipe.find_by(name: "Jamie's Old Fashioned Ginger Crinkle Cookies").id, order_number: 14},
  {measurement: "3 quarts", name: "Popped popcorn (1/2 cup unpopped", recipe_id: Recipe.find_by(name: "Peanut-Buttered Popcorn").id, order_number: 1},
  {measurement: "1 cup", name: "Sugar", recipe_id: Recipe.find_by(name: "Peanut-Buttered Popcorn").id, order_number: 2},
  {measurement: "1/2 cup", name: "Honey", recipe_id: Recipe.find_by(name: "Peanut-Buttered Popcorn").id, order_number: 3},
  {measurement: "1/2 cup", name: "Light Corn Syrup", recipe_id: Recipe.find_by(name: "Peanut-Buttered Popcorn").id, order_number: 4},
  {measurement: "1 cup", name: "Crunchy peanut butter", recipe_id: Recipe.find_by(name: "Peanut-Buttered Popcorn").id, order_number: 5},
  {measurement: "1 tsp", name: "vanilla", recipe_id: Recipe.find_by(name: "Peanut-Buttered Popcorn").id, order_number: nil},
  {measurement: "1 cup", name: "pumpkin puree", recipe_id: Recipe.find_by(name: "Grandma McGary's Pumpkin Cookies").id, order_number: nil},
  {measurement: "1 cup", name: "sugar", recipe_id: Recipe.find_by(name: "Grandma McGary's Pumpkin Cookies").id, order_number: nil},
  {measurement: "1/2 cup", name: "oil", recipe_id: Recipe.find_by(name: "Grandma McGary's Pumpkin Cookies").id, order_number: nil},
  {measurement: "1 tsp", name: "vanilla", recipe_id: Recipe.find_by(name: "Grandma McGary's Pumpkin Cookies").id, order_number: nil},
  {measurement: "2 cup", name: "flour", recipe_id: Recipe.find_by(name: "Grandma McGary's Pumpkin Cookies").id, order_number: nil},
  {measurement: "1/4 tsp", name: "salt", recipe_id: Recipe.find_by(name: "Grandma McGary's Pumpkin Cookies").id, order_number: nil},
  {measurement: "1 tsp", name: "baking soda", recipe_id: Recipe.find_by(name: "Grandma McGary's Pumpkin Cookies").id, order_number: nil},
  {measurement: "1/2 tsp", name: "cinnamon", recipe_id: Recipe.find_by(name: "Grandma McGary's Pumpkin Cookies").id, order_number: nil},
  {measurement: "1 box", name: "Devil's Food Cake mix", recipe_id: Recipe.find_by(name: "Bundt Dump Cake").id, order_number: nil},
  {measurement: "1 box", name: "Small chocolate pudding (3.9 oz)", recipe_id: Recipe.find_by(name: "Bundt Dump Cake").id, order_number: nil},
  {measurement: "3/4 cup", name: "water", recipe_id: Recipe.find_by(name: "Bundt Dump Cake").id, order_number: nil},
  {measurement: "1/2 cup", name: "oil", recipe_id: Recipe.find_by(name: "Bundt Dump Cake").id, order_number: nil},
  {measurement: "4", name: "eggs", recipe_id: Recipe.find_by(name: "Bundt Dump Cake").id, order_number: nil},
  {measurement: "8 oz", name: "sour cream", recipe_id: Recipe.find_by(name: "Bundt Dump Cake").id, order_number: nil},
	{measurement: "6 oz", name: "semi sweet chocolate chips", recipe_id: Recipe.find_by(name: "Bundt Dump Cake").id, order_number: nil},
  {measurement: "", name: "powdered sugar for dusting", recipe_id: Recipe.find_by(name: "Bundt Dump Cake").id, order_number: nil},
  {measurement: "1 ", name: "oreo pie crust (see instructions to make)", recipe_id: Recipe.find_by(name: "Kelly's French Silk Chocolate Pie").id, order_number: nil},
  {measurement: "1 cup", name: "unsalted butter, softened", recipe_id: Recipe.find_by(name: "Kelly's French Silk Chocolate Pie").id, order_number: nil},
  {measurement: "1 1/2 cup", name: "sugar ", recipe_id: Recipe.find_by(name: "Kelly's French Silk Chocolate Pie").id, order_number: nil},
  {measurement: "4 oz", name: "unsweetened chocolate squares", recipe_id: Recipe.find_by(name: "Kelly's French Silk Chocolate Pie").id, order_number: nil},
  {measurement: "2 tsp", name: "good vanilla", recipe_id: Recipe.find_by(name: "Kelly's French Silk Chocolate Pie").id, order_number: nil},
  {measurement: "4", name: "eggs", recipe_id: Recipe.find_by(name: "Kelly's French Silk Chocolate Pie").id, order_number: nil},
  {measurement: "1", name: "plain Hershey bar, room temp", recipe_id: Recipe.find_by(name: "Kelly's French Silk Chocolate Pie").id, order_number: nil},
  {measurement: "1 1/2 cup", name: "chocolate wafer crumbs (crushed oreos)", recipe_id: Recipe.find_by(name: "Kelly's French Silk Chocolate Pie").id, order_number: 1},
  {measurement: "1/4 cup", name: "unsalted butter, melted", recipe_id: Recipe.find_by(name: "Kelly's French Silk Chocolate Pie").id, order_number: 2},
  {measurement: "1 cup", name: "brown sugar", recipe_id: Recipe.find_by(name: "Cowboy Cookies").id, order_number: nil},
  {measurement: "1 cup", name: "white sugar", recipe_id: Recipe.find_by(name: "Cowboy Cookies").id, order_number: nil},
  {measurement: "1 cup", name: "butter", recipe_id: Recipe.find_by(name: "Cowboy Cookies").id, order_number: nil},
  {measurement: "2", name: "eggs", recipe_id: Recipe.find_by(name: "Cowboy Cookies").id, order_number: nil},
  {measurement: "1 tsp", name: "baking soda", recipe_id: Recipe.find_by(name: "Cowboy Cookies").id, order_number: nil},
  {measurement: "1/2 tsp", name: "baking powder", recipe_id: Recipe.find_by(name: "Cowboy Cookies").id, order_number: nil},
  {measurement: "1/2 tsp", name: "salt", recipe_id: Recipe.find_by(name: "Cowboy Cookies").id, order_number: nil},
  {measurement: "1 tsp", name: "vanilla", recipe_id: Recipe.find_by(name: "Cowboy Cookies").id, order_number: nil},
  {measurement: "2 cups", name: "flour", recipe_id: Recipe.find_by(name: "Cowboy Cookies").id, order_number: nil},
  {measurement: "2 cups", name: "oatmeal", recipe_id: Recipe.find_by(name: "Cowboy Cookies").id, order_number: nil},
  {measurement: "1 bag", name: "chocolate chips", recipe_id: Recipe.find_by(name: "Cowboy Cookies").id, order_number: nil},
  {measurement: "1/2 c.", name: "margarine (or butter)", recipe_id: Recipe.find_by(name: "Nana's Banana Nut Bread").id, order_number: 1},
  {measurement: "1 c.", name: "Sugar", recipe_id: Recipe.find_by(name: "Nana's Banana Nut Bread").id, order_number: 2},
  {measurement: "3", name: "very ripe bananas", recipe_id: Recipe.find_by(name: "Nana's Banana Nut Bread").id, order_number: 3},
  {measurement: "2", name: "Eggs, beaten", recipe_id: Recipe.find_by(name: "Nana's Banana Nut Bread").id, order_number: 4},
  {measurement: "2 c.", name: "Flour", recipe_id: Recipe.find_by(name: "Nana's Banana Nut Bread").id, order_number: nil},
  {measurement: "1 tsp.", name: "Baking Soda", recipe_id: Recipe.find_by(name: "Nana's Banana Nut Bread").id, order_number: nil},
  {measurement: "1/2 tsp", name: "Salt", recipe_id: Recipe.find_by(name: "Nana's Banana Nut Bread").id, order_number: nil},
  {measurement: "1/2 c", name: "Chopped walnuts (if desired)", recipe_id: Recipe.find_by(name: "Nana's Banana Nut Bread").id, order_number: nil},
  {measurement: "3 c.", name: "Flour", recipe_id: Recipe.find_by(name: "Nana's A to Z bread").id, order_number: nil},
  {measurement: "1/2 tsp.", name: "Salt", recipe_id: Recipe.find_by(name: "Nana's A to Z bread").id, order_number: nil},
  {measurement: "1/2 tsp", name: "Baking Soda", recipe_id: Recipe.find_by(name: "Nana's A to Z bread").id, order_number: nil},
  {measurement: "3 tsp", name: "Cinnamon", recipe_id: Recipe.find_by(name: "Nana's A to Z bread").id, order_number: nil},
  {measurement: "1/2 tsp.", name: "Baking Powder", recipe_id: Recipe.find_by(name: "Nana's A to Z bread").id, order_number: nil},
  {measurement: "3", name: "Eggs", recipe_id: Recipe.find_by(name: "Nana's A to Z bread").id, order_number: nil},
  {measurement: "1 c.", name: "Vegetable Oil", recipe_id: Recipe.find_by(name: "Nana's A to Z bread").id, order_number: nil},
  {measurement: "2 c.", name: "Sugar", recipe_id: Recipe.find_by(name: "Nana's A to Z bread").id, order_number: nil},
  {measurement: "3 tsp.", name: "Vanilla", recipe_id: Recipe.find_by(name: "Nana's A to Z bread").id, order_number: nil},
  {measurement: "2 c.", name: "\"A - Z\" (for example, apples or zucchini or carrots, whatever fruit of veggie you choose)", recipe_id: Recipe.find_by(name: "Nana's A to Z bread").id, order_number: nil}
])

Instruction.create!([
  {step_number: 1, step: "Mix together vanilla wafers, butter, and powdered sugar and press into a 9x13 pan. Bake at 350 for 8-10 minutes", recipe_id: Recipe.find_by(name: "Sister Tanner's cookies").id},
  {step_number: 2, step: "Mix together coconut, Eagle Brand Milk, and vanilla. Pour over wafer crust. Bake for 15 minutes", recipe_id: Recipe.find_by(name: "Sister Tanner's cookies").id},
  {step_number: 3, step: "In a double boiler, melt the chocolate chips and peanut butter over medium low. Heat until smooth. Spread over coconut mixture.", recipe_id: Recipe.find_by(name: "Sister Tanner's cookies").id},
  {step_number: 4, step: "Let cool. Cut into squares.", recipe_id: Recipe.find_by(name: "Sister Tanner's cookies").id},
  {step_number: 1, step: "Preheat the oven to 350 degrees F.", recipe_id: Recipe.find_by(name: "Jamie's Old Fashioned Ginger Crinkle Cookies").id},
  {step_number: 2, step: "In a medium bowl, whisk together the flour, baking soda, ground ginger, cinnamon, salt, allspice, and cloves.", recipe_id: Recipe.find_by(name: "Jamie's Old Fashioned Ginger Crinkle Cookies").id},
  {step_number: 3, step: "In a stand mixer fitted with a paddle attachment, add the shortening, butter, brown and granulated sugar. Beat on medium speed until light and fluffy, about 3-4 minutes. Slip in the molasses and egg and beat until well incorporated. Add the flour mixture by scoopfulls and beat until combined.", recipe_id: Recipe.find_by(name: "Jamie's Old Fashioned Ginger Crinkle Cookies").id},
  {step_number: 4, step: "Add the turbinado sugar to a small plate or bowl. Roll the dough into balls that are 1 inch in diameter (1/2 ounce in weight), then roll in the sugar. Place 12 balls on a baking sheet 2 inches apart.", recipe_id: Recipe.find_by(name: "Jamie's Old Fashioned Ginger Crinkle Cookies").id},
  {step_number: 5, step: "Bake the cookies 9 to 11 minutes, rotating the sheet halfway through the baking time.", recipe_id: Recipe.find_by(name: "Jamie's Old Fashioned Ginger Crinkle Cookies").id},
  {step_number: 6, step: "Cool baking sheets for 4 minutes, then continue cooling on wire racks. Repeat until all cookies are baked.", recipe_id: Recipe.find_by(name: "Jamie's Old Fashioned Ginger Crinkle Cookies").id},
  {step_number: 1, step: "Pop corn and remove all hulls", recipe_id: Recipe.find_by(name: "Peanut-Buttered Popcorn").id},
  {step_number: 2, step: "Butter sides of a heavy 1 1/2 quart saucepan. Combine sugar, honey, and corn syrup in the pan", recipe_id: Recipe.find_by(name: "Peanut-Buttered Popcorn").id},
  {step_number: 3, step: "Bring mixture to a boil, stirring constantly. Boil hard for 2 minutes, remove from heat.", recipe_id: Recipe.find_by(name: "Peanut-Buttered Popcorn").id},
  {step_number: 4, step: "Stir in peanut butter and vanilla.", recipe_id: Recipe.find_by(name: "Peanut-Buttered Popcorn").id},
  {step_number: 5, step: "Immediately pour over popcorn, stirring to coat well.", recipe_id: Recipe.find_by(name: "Peanut-Buttered Popcorn").id},
  {step_number: 6, step: "Cool on cookie sheet.", recipe_id: Recipe.find_by(name: "Peanut-Buttered Popcorn").id},
  {step_number: 1, step: "Mix together pumpkin, sugar, oil, vanilla.", recipe_id: Recipe.find_by(name: "Grandma McGary's Pumpkin Cookies").id},
  {step_number: 2, step: "In a separate bowl mix together flour, salt, baking soda, cinnamon. Then add to the wet mixture.", recipe_id: Recipe.find_by(name: "Grandma McGary's Pumpkin Cookies").id},
  {step_number: 3, step: "Add nuts, raisins, chocolate chips, or other mix ins.", recipe_id: Recipe.find_by(name: "Grandma McGary's Pumpkin Cookies").id},
  {step_number: 4, step: "Spoon small amounts of dough onto pan (gets larger).", recipe_id: Recipe.find_by(name: "Grandma McGary's Pumpkin Cookies").id},
  {step_number: 5, step: "Bake at 375 degrees for 10-12 minutes. Should start to brown. Makes 20-24 cookies.", recipe_id: Recipe.find_by(name: "Grandma McGary's Pumpkin Cookies").id},
  {step_number: 1, step: "Mix all ingredients together until just combined.", recipe_id: Recipe.find_by(name: "Bundt Dump Cake").id},
  {step_number: 2, step: "Pour into a greased bundt pan.", recipe_id: Recipe.find_by(name: "Bundt Dump Cake").id},
  {step_number: 3, step: "Bake at 350 degrees for 50-60 minutes. The cake is done when a tester comes out clean. Let sit in pan for 10 minutes, then put on a plate. Dust with powdered sugar.", recipe_id: Recipe.find_by(name: "Bundt Dump Cake").id},
  {step_number: 4, step: "Note: The cake will continue to cook in the pan, so it's easy to overcook. Usually the 50 minutes is sufficient, but it depends on your oven.", recipe_id: Recipe.find_by(name: "Bundt Dump Cake").id},
  {step_number: 1, step: "Make the pie crust by combining the oreo crumbs and melted butter; press evenly in a 9-inch pie dish. ", recipe_id: Recipe.find_by(name: "Kelly's French Silk Chocolate Pie").id},
  {step_number: 2, step: "Bake pie crust at 325 degrees for about 6 minutes. Cool completely before using.", recipe_id: Recipe.find_by(name: "Kelly's French Silk Chocolate Pie").id},
  {step_number: 3, step: "In microwave, melt chocolate. Set aside to cool.", recipe_id: Recipe.find_by(name: "Kelly's French Silk Chocolate Pie").id},
  {step_number: 4, step: "In a medium bowl, cream butter, gradually add sugar, cream well.", recipe_id: Recipe.find_by(name: "Kelly's French Silk Chocolate Pie").id},
  {step_number: 5, step: "Mix in melted, cooled chocolate and vanilla.", recipe_id: Recipe.find_by(name: "Kelly's French Silk Chocolate Pie").id},
  {step_number: 6, step: "Add eggs 1 at a time, beating 5 minutes each, and scraping sides of bowl often to incorporate all sugar.", recipe_id: Recipe.find_by(name: "Kelly's French Silk Chocolate Pie").id},
  {step_number: 7, step: "(Beat until no longer any grains of sugar.)", recipe_id: Recipe.find_by(name: "Kelly's French Silk Chocolate Pie").id},
  {step_number: 8, step: "Spoon and smooth into pie crust.", recipe_id: Recipe.find_by(name: "Kelly's French Silk Chocolate Pie").id},
  {step_number: 9, step: "Chill and set, about 1 hour.", recipe_id: Recipe.find_by(name: "Kelly's French Silk Chocolate Pie").id},
  {step_number: 10, step: "Serve topped with Cool Whip, chocolate shavings, and a maraschino cherry.", recipe_id: Recipe.find_by(name: "Kelly's French Silk Chocolate Pie").id},
  {step_number: 11, step: "Variations: Add, in addition to vanilla, 1 tsp peppermint extract, tint Cool Whip pink for Valentine's Day or green for St. Patrick's Day.", recipe_id: Recipe.find_by(name: "Kelly's French Silk Chocolate Pie").id},
  {step_number: 12, step: "Top with crushed peppermint sticks/candy canes just before serving for Christmas.", recipe_id: Recipe.find_by(name: "Kelly's French Silk Chocolate Pie").id},
  {step_number: 1, step: "Cream together sugars and butter", recipe_id: Recipe.find_by(name: "Cowboy Cookies").id},
  {step_number: 2, step: "Combine the rest", recipe_id: Recipe.find_by(name: "Cowboy Cookies").id},
  {step_number: 3, step: "Bake at 375 for 8-10 minutes", recipe_id: Recipe.find_by(name: "Cowboy Cookies").id},
  {step_number: 1, step: "Cream together margarine, eggs and sugar. Add bananas.", recipe_id: Recipe.find_by(name: "Nana's Banana Nut Bread").id},
  {step_number: 3, step: "Add dry ingredients to the creamed mixture. ", recipe_id: Recipe.find_by(name: "Nana's Banana Nut Bread").id},
  {step_number: 2, step: "Measure out flour, baking soda, salt and nuts (if desired). Mix dry ingredients together in a bowl.", recipe_id: Recipe.find_by(name: "Nana's Banana Nut Bread").id},
	{step_number: 4, step: "Grease loaf pan. Add banana mixture.", recipe_id: Recipe.find_by(name: "Nana's Banana Nut Bread").id},
  {step_number: 5, step: "Put loaf pan in 350 degree oven. Check at 45 minutes with toothpick to see if it comes out clean. If not, check in 5 minute increments until done.", recipe_id: Recipe.find_by(name: "Nana's Banana Nut Bread").id},
  {step_number: 1, step: "Beat eggs. Add oil, sugar and vanilla. Beat until well mixed.", recipe_id: Recipe.find_by(name: "Nana's A to Z bread").id},
  {step_number: 3, step: "Pour mixture in two greased loaf pans.", recipe_id: Recipe.find_by(name: "Nana's A to Z bread").id},
  {step_number: 4, step: "Bake at 325 degrees for 1 hour.", recipe_id: Recipe.find_by(name: "Nana's A to Z bread").id},
  {step_number: 2, step: "In a separate bowl, stir together flour, salt, baking soda, cinnamon, and baking powder. Add to wet ingredients.", recipe_id: Recipe.find_by(name: "Nana's A to Z bread").id}
])

	puts "Seeding done."




# users = User.create([
# 	# {
# 	# 	email: "jordan@example.com",
# 	# 	username: "jodamannn",
# 	# 	password: "example1",
# 	# 	password_confirmation: "example1"
# 	# },
# 	{
# 		email: "claire@example.com",
# 		username: "claire-a-belle",
# 		password: "example1", password_confirmation: "example1"
# 		password_confirmation: "example1"
# 	}
# ])
#
# recipes = Recipe.create([{
# 	name: "Sister Tanner's cookies",
# 	description: "Delicious cookie bars enjoyed at christmas time",
# 	user_id: "1",
# 	ingredients_attributes: [
# 		{
# 			measurement: "1 Box",
# 			name: "Vanilla wafers - Crushed",
# 			order_number: "1"
# 		},
# 		{
# 			measurement: "2 Cubes",
# 			name: "Butter",
# 			order_number: "2"
# 		},
# 		{
# 			measurement: "1/4 cup",
# 			name: "Powdered Sugar",
# 			order_number: "3"
# 		},
# 		{
# 			measurement: "2 cups",
# 			name: "Shredded Coconut",
# 			order_number: "4"
# 		},
# 		{
# 			measurement: "1 Can",
# 			name: "Eagle Brand Milk",
# 			order_number: "5"
# 		},
# 		{
# 			measurement: "1 tsp",
# 			name: "Vanilla",
# 			order_number: "6"
# 		},
# 		{
# 			measurement: "1 cup",
# 			name: "Semi-sweet Chocolate Chips",
# 			order_number: "7"
# 		},
# 		{
# 			measurement: "1 cup",
# 			name: "Milk Chocolate Chips",
# 			order_number: "8"
# 		},
# 		{
# 			measurement: "2 Tbs",
# 			name: "Peanut Butter",
# 			order_number: "9"
# 		}
# 	],
# 	instructions_attributes: [
# 		{
# 			step_number: "1",
# 			step: "Mix together vanilla wafers, butter, and powdered sugar and press into a 9x13 pan. Bake at 350 for 8-10 minutes"
# 		},
# 		{
# 			step_number: "2",
# 			step: "Mix together coconut, Eagle Brand Milk, and vanilla. Pour over wafer crust. Bake for 15 minutes"
# 		},
# 		{
# 			step_number: "3",
# 			step: "In a double boiler, melt the chocolate chips and peanut butter over medium low. Heat until smooth. Spread over coconut mixture."
# 		},
# 		{
# 			step_number: "4",
# 			step: "Let cool. Cut into squares."
# 		}
# 	]
#
# 	},
# 	{
# 		name: "Jamie's Old Fashioned Ginger Crinkle Cookies",
# 		description: "These cookies are nice and chewy on the inside with a nice crunch on the outside. They have a wonderfully soft texture from using both shortening and butter. When you bake these cookies, your house will smell like Christmas!",
# 		user_id: "2",
# 		prep_time: "10 min",
# 		cook_time: "25 min",
# 		servings: "48",
# 		ingredients_attributes: [
# 			{
# 				measurement: "2 Cups",
# 				name: "All-purpose flour",
# 				order_number: "1"
# 			},
# 			{
# 				measurement: "2 tsp",
# 				name: "Baking Soda",
# 				order_number: "2"
# 			},
# 			{
# 				measurement: "1 1/2 tsp",
# 				name: "Ground Ginger",
# 				order_number: "3"
# 			},
# 			{
# 				measurement: "1 tsp",
# 				name: "Ground Cinnamon",
# 				order_number: "4"
# 			},
# 			{
# 				measurement: "1/2 tsp",
# 				name: "Kosher Salt",
# 				order_number: "5"
# 			},
# 			{
# 				measurement: "1/4 tsp",
# 				name: "Ground Allspice",
# 				order_number: "6"
# 			},
# 			{
# 				measurement: "1/4 tsp",
# 				name: "Ground Cloves",
# 				order_number: "7"
# 			},
# 			{
# 				measurement: "1/2 Cup",
# 				name: "Vegetable Shortening",
# 				order_number: "8"
# 			},
# 			{
# 				measurement: "1/4 Cup",
# 				name: "Unsalted butter, softened",
# 				order_number: "9"
# 			},
# 			{
# 				measurement: "1/2 Cup",
# 				name: "Light Brown Sugar - Firmly Packed",
# 				order_number: "10"
# 			},
# 			{
# 				measurement: "1/2 Cup",
# 				name: "Granulated Sugar",
# 				order_number: "11"
# 			},
# 			{
# 				measurement: "1/4 Cup",
# 				name: "Molasses",
# 				order_number: "12"
# 			},
# 			{
# 				measurement: "1 Large",
# 				name: "Egg",
# 				order_number: "13"
# 			},
# 			{
# 				measurement: "1/4 cup",
# 				name: "Turbinado Sugar",
# 				order_number: "14"
# 			}
# 		],
# 		instructions_attributes: [
# 			{
# 				step_number: "1",
# 				step: "Preheat the oven to 350 degrees F."
# 			},
# 			{
# 				step_number: "2",
# 				step: "In a medium bowl, whisk together the flour, baking soda, ground ginger, cinnamon, salt, allspice, and cloves."
# 			},
# 			{
# 				step_number: "3",
# 				step: "In a stand mixer fitted with a paddle attachment, add the shortening, butter, brown and granulated sugar. Beat on medium speed until light and fluffy, about 3-4 minutes. Slip in the molasses and egg and beat until well incorporated. Add the flour mixture by scoopfulls and beat until combined."
# 			},
# 			{
# 				step_number: "4",
# 				step: "Add the turbinado sugar to a small plate or bowl. Roll the dough into balls that are 1 inch in diameter (1/2 ounce in weight), then roll in the sugar. Place 12 balls on a baking sheet 2 inches apart."
# 			},
# 			{
# 				step_number: "5",
# 				step: "Bake the cookies 9 to 11 minutes, rotating the sheet halfway through the baking time."
# 			},
# 			{
# 				step_number: "6",
# 				step: "Cool baking sheets for 4 minutes, then continue cooling on wire racks. Repeat until all cookies are baked."
# 			},
# 		]
#
# 	}
#
#
# 	])

	puts "Seeding done."
