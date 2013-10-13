class CreatePopSpaces < ActiveRecord::Migration
  def change
    create_table :pop_spaces do |t|
      t.string :display_type
      t.text :size

      t.timestamps
    end
  end
end
