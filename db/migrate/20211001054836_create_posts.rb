class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|

      t.string :name
      t.string :title
      t.text :text
      t.date :start_on
      t.date :end_on
      t.timestamps
    end
  end
end
