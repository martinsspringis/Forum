module RepliesHelper
	def nested_replies(replies)
		replies.map do |reply, sub_replies|
      render(reply) + content_tag(:div, nested_replies(sub_replies), class: "nested_replies")
		end.join.html_safe
	end
end