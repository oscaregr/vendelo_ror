class AddNotNullToCategoryName < ActiveRecord::Migration[8.1]
  def change
    change_column_null :categories, :name, false
    # rails generate migration AddNotNullToCategoryName
  end
end
