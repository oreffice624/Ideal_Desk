class CreateDeskTags < ActiveRecord::Migration[6.1]
  def change
    create_table :desk_tags do |t|
      t.references :desk, null: false, foreign_key: true
      t.references :desk_tag_name, null: false, foreign_key: true

      t.timestamps
    end
    add_index :desk_tags, :desk_tag_name, unique: true
  end
end
