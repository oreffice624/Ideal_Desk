class CreateDeskTags < ActiveRecord::Migration[6.1]
  def change
    create_table :desk_tags do |t|
      t.references :desk, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
