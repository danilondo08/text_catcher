class CreateUserImages < ActiveRecord::Migration[6.1]
  def change
    create_table :user_images do |t|
      t.references :user, null: false, foreign_key: true
      t.string :base64
      t.timestamps
    end
  end
end
