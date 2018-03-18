class AddVideoToLessons < ActiveRecord::Migration[5.0]
  def change
    add_column :lessons, :video, :string
  end
end
