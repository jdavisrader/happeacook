json.extract! recipe, :id, :name, :user_id, :description, :servings, :prep_time, :prep_time_descriptor, :cook_time, :cook_time_descriptor, :rest_time, :rest_time_descriptor, :total_time, :total_time_descriptor, :calories, :created_at, :updated_at
json.url recipe_url(recipe, format: :json)
