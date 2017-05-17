# YOUR CODE GOES HERE

SAFE_FOOD = [
  "brussels sprouts",
  "spinach",
  "eggs",
  "milk",
  "tofu",
  "seitan",
  "bell peppers",
  "quinoa",
  "kale",
  "chocolate",
  "beer",
  "wine",
  "whiskey"
]

class Ingredient
  attr_reader  :name

  def initialize(quantity = 0, unit, name)
    @name = name
    @quantity = quantity
    @unit = unit
  end

  def has_allergens?
    !SAFE_FOOD.include?(@name)
  end

  def self.parse(everything)
    description = everything.split(" ")
    new(description[0].to_f, description[1], description[2..-1].join(' '))
  end

  def summary
    "#{@quantity} #{@unit} #{@name}"
  end
end

safe_ingredients = [
  Ingredient.new(1.0, "cup", "quinoa"),
  Ingredient.new(1.0, "cup", "chocolate")
]

safe_instructions = [
  "Melt chocolate.",
  "Pour over quinoa.",
  "Regret your life."
]

safe_ingredients2 = [
  # Ingredient.new(1.5, "lb(s)", "Brussels sprouts"),
  Ingredient.parse("1.5 lb(s) Brussels sprouts"),
  Ingredient.new(3.0, "tbspn(s)", "Good olive oil"),
  Ingredient.new(0.75, "tspn(s)", "Kosher salt"),
  Ingredient.new(0.5, "tspn(s)", "Freshly ground black pepper")
]

safe_instructions2 = [
  "Preheat oven to 400 degrees F.",
  "Cut off the brown ends of the Brussels sprouts.",
  "Pull off any yellow outer leaves.",
  "Mix them in a bowl with the olive oil, salt and pepper.",
  "Pour them on a sheet pan and roast for 35 to 40 minutes.",
  "They should be until crisp on the outside and tender on the inside.",
  "Shake the pan from time to time to brown the sprouts evenly.",
  "Sprinkle with more kosher salt ( I like these salty like French fries).",
  "Serve and enjoy!"
]

safe_ingredients3 = [
   Ingredient.new(2.0, "large", "eggs"),
  # Ingredient.parse("2.0 large eggs"),
  Ingredient.new(2.0, "(1/4 inch thick ring)", "bell peppers")
]

safe_instructions3 = [
  "Heat a non-stick skillet over medium heat..",
  "Place bell pepper ring in the hot skillet.",
  "Crack egg into bell pepper ring.",
  "Cook until bottom holds together and corners are browned, 2 to 3 minutes.",
  "Flip and cook until desired doneness is reached, 2 to 3 minutes more.",
  "Eat and enjoy."
]

safe_ingredients4 = [
  Ingredient.parse("1.0, cup potato"),
  Ingredient.parse("1.0 cup onion"),
  Ingredient.parse("1.0 cup celery"),
  Ingredient.parse("1.0 cup carrot"),
  Ingredient.parse("0.33 cup melted margarine"),
  Ingredient.parse("0.50 cup all-purpose flour"),
  Ingredient.parse("2.0 cups chicken broth"),
  Ingredient.parse("1.0 cup half-and-half"),
  Ingredient.parse("1.0 teaspoon salt"),
  Ingredient.parse("0.25 teaspoon pepper"),
  Ingredient.parse("4.0 cups chicken cooked and chopped"),
  Ingredient.parse("2.0 round pie crusts"),
]

safe_instructions4 = [
  "Preheat oven to 400°F.",
  "Saute onion, celery, carrots and potatoes in margarine for 10 minutes.",
  "Add flour to sauteed mixture, stirring well, cook one minute stirring constantly.",
  "Combine broth and half and half.",
  "Gradually stir into vegetable mixture.",
  "Cook over medium heat stirring constantly until thickened and bubbly.",
  "Stir in salt and pepper; add chicken and stir well.",
  "Pour into shallow 2 quart casserole dish and top with pie shells.",
  "Cut slits to allow steam to escape.",
  "Bake for 40-50 minutes or until pastry is golden brown and filling is bubbly and cooked through."
]

class Recipe
  attr_reader :safe_name
  def initialize(safe_name, safe_ingredients, safe_instructions)
    @safe_name = safe_name
    @safe_ingredients = safe_ingredients
    @safe_instructions = safe_instructions
  end

  def summary
    summary_string = "Name: #{@safe_name}\n"
    summary_string += "\nIngredients\n-----------"
    @safe_ingredients.each do |food|
      summary_string += "\n- #{food.summary}"
    end

    summary_string += "\n\nInstructions\n------------"
    @safe_instructions.each_with_index do |value, index|
      summary_string += "\n#{index += 1}. #{value}"
    end
    summary_string
  end

  def safe_output?
    @safe_ingredients.each do |food|
      if food.has_allergens?
        return "Do not eat"
      end
    end
     "Safe to eat"
  end
end
safe_recipe = Recipe.new("Chocolate Cake", safe_ingredients, safe_instructions)
puts "\nIs #{safe_recipe.safe_name} safe? #{safe_recipe.safe_output?.inspect}"
puts safe_recipe.summary

safe_recipe2 = Recipe.new("Roasted Brussels Sprouts", safe_ingredients2, safe_instructions2)
puts "\nIs #{safe_recipe2.safe_name} safe? #{safe_recipe2.safe_output?.inspect}"
puts safe_recipe2.summary

safe_recipe3 = Recipe.new("Egg in a pepper", safe_ingredients3, safe_instructions3)
puts "\nIs #{safe_recipe3.safe_name} safe? #{safe_recipe3.safe_output?.inspect}"
puts safe_recipe3.summary

safe_recipe4 = Recipe.new("Delicious Chicken Pot Pie", safe_ingredients4, safe_instructions4)
puts "\nIs #{safe_recipe4.safe_name} safe? #{safe_recipe4.safe_output?.inspect}"
puts safe_recipe4.summary
