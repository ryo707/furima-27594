class AddProfectureToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :prefecture, :integer
  end
end
