class DropTbl < ActiveRecord::Migration[5.2]
  def change
  	drop_table :casts
  	drop_table :castings
  end
end
