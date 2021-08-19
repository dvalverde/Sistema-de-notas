class CreateNotes < ActiveRecord::Migration[6.1]
  def change
    create_table :notes do |t|
      t.string :title
      t.text :content
      t.references :user

      t.timestamps
    end

    add_index :notes, [:user_id, :updated_at]
  end
end
