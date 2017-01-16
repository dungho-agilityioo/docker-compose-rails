class Message < ApplicationRecord
	after_create_commit { MessageBroadcastJob.perform_later self }
	validates :content, :user_id, presence: true

	belongs_to :user
end
