require 'rails_helper'

RSpec.describe Recipe do
  describe ".quick_recipes" do
    it "returns recipes with a cooking time less than 30 min" do
      quick_recipes = create_list(:recipe, 2, cooking_time: 5)
      long_recipes = create_list(:recipe, 3, cooking_time: 200)

      results = Recipe.quick_recipes

      quick_recipes.each do |quick_recipe|
        expect(results).to include(quick_recipe)
      end

      long_recipes.each do |long_recipe|
        expect(results).to_not include(long_recipe)
      end

    end
  end
end
