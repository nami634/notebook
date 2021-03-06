class Note < ActiveRecord::Base
	belongs_to :category
	belongs_to :user
	has_many :note_processes
	accepts_nested_attributes_for :note_processes, allow_destroy: true, reject_if: :all_blank
	validates :title,
    presence: true

end
