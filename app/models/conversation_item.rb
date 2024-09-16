class ConversationItem < ApplicationRecord
  belongs_to :project
  belongs_to :user

  validates :type, presence: true

  default_scope { order(created_at: :desc) }
end
