class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.belongs_to :user

      t.timestamps
    end
  end
end
