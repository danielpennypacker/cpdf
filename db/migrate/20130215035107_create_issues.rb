class CreateIssues < ActiveRecord::Migration
  def up
    create_table :issues do |t|
      t.integer :view_count
      t.text :covers

      t.timestamps
    end

    Issue.create(:view_count => 0)
  end

  def down

  end
end
