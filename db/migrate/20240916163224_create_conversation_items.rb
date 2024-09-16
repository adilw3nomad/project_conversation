class CreateConversationItems < ActiveRecord::Migration[7.2]
  def change
    create_table :conversation_items do |t|
      t.references :project, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :type, null: false
      t.text :content
      t.string :new_status

      t.timestamps
    end

    add_index :conversation_items, :type
  end
end
