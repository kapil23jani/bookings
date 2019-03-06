class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :name
      t.string :type
      t.text :summary

      t.timestamps
    end
  end
end
