class Document < ActiveRecord::Base
  attr_accessible :body, :title, :view_count, :tags, :image_name, :category


end
