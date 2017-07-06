module ApplicationHelper
	def gravatar(user)
		gravatar_id = Digest::MD5::hexdigest(user.email).downcase
		"https://www.gravatar.com/avatar/#{gravatar_id}.jpg?d=identicon"
	end
end
