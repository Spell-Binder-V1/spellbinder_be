class Cards < ActiveRecord::Migration[7.0]
  def change
    create_table :cards do |t|
      t.string :name
      t.string :set_name
      t.string :multiverseid
      t.string :mana_cost
      t.float :converted_mana_cost
      t.text :colors, array: true, default: [], null: false
      t.text :color_identity, array: true, default: [], null: false
      t.string :type
      t.text :types, array: true, default: [], null: false
      t.text :subtypes, array: true, default: [], null: false
      t.string :rarity
      t.string :text
      t.string :set
      t.string :artist
      t.string :number
      t.string :power
      t.string :toughness
      t.string :image_url
      t.text :rulings, array: true, default: [], null: false
      t.timestamps
    end
  end
end
