class Comment < ConversationItem
  validates :content, presence: true
end
