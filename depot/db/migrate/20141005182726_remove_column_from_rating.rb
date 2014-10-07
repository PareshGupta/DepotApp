class RemoveColumnFromRating < ActiveRecord::Migration
  def change
    remove_column :ratings, :score
    add_column :ratings, :score, :integer, null: false, default: 0
  end
end
