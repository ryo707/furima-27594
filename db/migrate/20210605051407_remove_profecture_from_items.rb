class RemoveProfectureFromItems < ActiveRecord::Migration[6.0]
  def change
    remove_column :items, :profecture, :integer
  end
end
