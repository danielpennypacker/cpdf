class Issue < ActiveRecord::Base
  attr_accessible :covers, :view_count

  def nice_count
    if self.view_count == 50
      50
    elsif self.view_count == 0
      1
    else
      self.view_count%50
    end
  end
end
