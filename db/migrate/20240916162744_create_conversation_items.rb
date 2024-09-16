class CreateConversationItems < ActiveRecord::Migration[7.2]
  def change
    create_table :conversation_items do |t|
      t.references :project, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :type

      t.timestamps
    end
  end
end
