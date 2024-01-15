class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :present
      t.string :body
      t.string :relationship
      t.string :sex

      t.timestamps
    end
  end
end
