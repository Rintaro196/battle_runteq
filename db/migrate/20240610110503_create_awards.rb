class CreateAwards < ActiveRecord::Migration[7.1]
  def change
    create_table :awards do |t|
      t.string :award_name,      null: false
      t.string :title,           null: false
      t.text :body,              null: false
      t.string :image
      t.references :user,        null: false, foreign_key: true

      t.timestamps
    end
  end
end
