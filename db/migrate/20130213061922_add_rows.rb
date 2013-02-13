class AddRows < ActiveRecord::Migration
  def change
    add_column :documents, :tags, :text

  end
end
