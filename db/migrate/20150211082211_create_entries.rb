class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :japanese
      t.text :english
      t.references :list, index: true

      t.timestamps
    end
  end
end
