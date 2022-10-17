module RecipesHelper
		#sets what the recipe will display with whole numbers or fractions
		def display_time(time)
			if time % 1 != 0
				whole_number = time.to_i
				fraction = (time % 1).to_r.rationalize(0.01)

				display_time = "#{whole_number} #{fraction}"
			else
				whole_number = time.to_i
				display_time = "#{whole_number}"
			end
		end
end
