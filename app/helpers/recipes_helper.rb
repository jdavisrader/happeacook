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


		def total_time_display(ptime, ptd, ctime, ctd, rtime, rtd)
			if ptd == "hr"
				ptime = ptime.to_f * 60
			end
			if ctd == "hr"
				ctime = ctime.to_f * 60
			end
			if rtd == "hr"
				rtime = rtime.to_f * 60
			end
			total_time = ptime.to_f + ctime.to_f + rtime.to_f

			if total_time > 60
				hours = (total_time / 60).to_i
				minutes = (total_time % 60).to_i
				if hours > 1
					total_time_descriptor = "#{hours} hrs #{minutes} min"
				else
					total_time_descriptor = "#{hours} hr #{minutes} min"
				end
			else
				total_time_description = "#{total_time.to_i} min"
			end
		end

end
