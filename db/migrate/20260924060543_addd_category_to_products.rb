class AdddCategoryToProducts < ActiveRecord::Migration[8.1]
  def change
    # rails generate migration AdddCategoryToProducts category:references
    add_reference :products, :category, null: false, foreign_key: true
  end
end
