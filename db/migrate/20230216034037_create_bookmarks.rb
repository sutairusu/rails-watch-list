class CreateBookmarks < ActiveRecord::Migration[7.0]
  def change
    create_table :bookmarks do |t|
      t.references :movie, movie: true, null: false, foreign_key: true
      t.references :list, list: true, null: false, foreign_key: true
      t.string :comment

      t.timestamps
    end
  end
end
