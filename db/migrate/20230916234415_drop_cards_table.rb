class DropCardsTable < ActiveRecord::Migration[7.0]
  def up
    drop_table :cards
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
