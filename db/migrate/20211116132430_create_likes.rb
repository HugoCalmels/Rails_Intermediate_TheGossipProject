class CreateLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :likes do |t|
      t.timestamps
      t.belongs_to :user, index: true
    end
  end
end
