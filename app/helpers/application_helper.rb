module ApplicationHelper

	def user_status(a = false)
		if a
			return "Online"
		else
			return "Offline"
		end
	end
end
