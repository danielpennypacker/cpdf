class Document < ActiveRecord::Base
  attr_accessible :body, :title, :view_count
end
