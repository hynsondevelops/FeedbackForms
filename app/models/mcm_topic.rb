class McmTopic < ApplicationRecord
	belongs_to :user
	has_many :sentence_scores
end
