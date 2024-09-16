class StatusChange < ConversationItem
  validates :new_status, presence: true
end
