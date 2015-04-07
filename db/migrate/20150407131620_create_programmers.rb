class CreateProgrammers < ActiveRecord::Migration
  def change
    create_table :programmers do |t|

      t.timestamps null: false
    end
  end
end
