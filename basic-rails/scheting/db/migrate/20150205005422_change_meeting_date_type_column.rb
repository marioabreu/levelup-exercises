class ChangeMeetingDateTypeColumn < ActiveRecord::Migration
  def change
    change_column :meetings, :begins, :datetime
    change_column :meetings, :ends, :datetime
  end
end
