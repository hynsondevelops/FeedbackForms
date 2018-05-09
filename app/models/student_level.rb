class StudentLevel < ApplicationRecord
	has_many :random_sentences
	belongs_to :user
end
