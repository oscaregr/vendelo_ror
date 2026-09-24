class CreateCategories < ActiveRecord::Migration[8.1]
  def change
    create_table :categories do |t|
      t.string :name

      t.timestamps

      # rails generate scaffold Category name:string
    end
  end
end
