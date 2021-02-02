class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.references :cocktail, null: false, foreign_key: true
      t.integer :rating
      t.text :description

      t.timestamps
    end
  end
end
