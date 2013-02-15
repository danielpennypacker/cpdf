class AddFilenameToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :image_name, :text

  end
end
