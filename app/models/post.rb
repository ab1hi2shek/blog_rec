class Post < ActiveRecord::Base
	extend FriendlyId
	friendly_id :title, use: :slugged

	def self.search(search)
		where("title LIKE ?", "%#{search}%") or
		where("content LIKE ?", "%#{search}%")
	end
end
