class CreatePrototypeSpaces < ActiveRecord::Migration
  def change
    create_table :prototype_spaces do |t|
      t.string :display_type
      t.text :size

      t.timestamps
    end
  end
end
