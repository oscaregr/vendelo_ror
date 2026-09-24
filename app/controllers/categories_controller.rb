class CategoriesController < ApplicationController
  def index
    @categories = Category.all.order(name: :asc)
  end

  def new
    @category = Category.new
  end

  def edit
    category
  end

  def create
    @category = Category.new(category_params)

      if @category.save
        redirect_to categories_url, notice: "Category was successfully created."
      else
        render :new, status: :unprocessable_content
      end
  end

  def update
    respond_to do |format|
      if category.update(category_params)
        redirect_to categories_url, notice: "Category was successfully updated.", status: :see_other
      else
        render :edit, status: :unprocessable_content
      end
    end
  end

  def destroy
    category.destroy!

    respond_to do |format|
      redirect_to categories_url, notice: "Category was successfully destroyed.", status: :see_other
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def category
      @category = Category.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def category_params
      params.expect(category: [ :name ])
    end
end
