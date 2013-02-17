class Addcategory < ActiveRecord::Migration
  def change
    add_column :documents, :category, :text
  end
end
