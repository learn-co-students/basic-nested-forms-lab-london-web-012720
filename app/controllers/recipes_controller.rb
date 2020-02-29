class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build(name: "first ingrediant")
    @recipe.ingredients.build(name: "second ingrediant")
   
  end

  def create
    Recipe.create(allowed_params)
    redirect_to recipes_path
  end

  private 
  def allowed_params
  params.require(:recipe).permit(:title, ingredients_attributes: [:name, :quantity])
  end
end
