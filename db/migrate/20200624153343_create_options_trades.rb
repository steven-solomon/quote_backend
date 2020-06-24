class CreateOptionsTrades < ActiveRecord::Migration[6.0]
  def change
    create_table :options_trades do |t|
      t.integer :action, default: 0
      t.float :strike
      t.float :premium

      t.timestamps
    end
  end
end
