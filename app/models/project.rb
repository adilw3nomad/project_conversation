class Project < ApplicationRecord
  has_many :conversation_items, dependent: :destroy
  has_many :comments, -> { where(type: "Comment") }, class_name: "ConversationItem"
  has_many :status_changes, -> { where(type: "StatusChange") }, class_name: "ConversationItem"

  validates :name, presence: true
  validates :status, presence: true

  def self.statuses
    StatusChange.distinct.pluck(:new_status)
  end

  def update_status(new_status, user)
    if update(status: new_status)
      status_changes.create(user: user, new_status: new_status)
    end
  end
end
