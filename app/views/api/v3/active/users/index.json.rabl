object @context
attributes :id

node(:web_url) {
	|context| context_url(context)
}

node(:href) {
	|context| api_v3_context_url(context)
}

child(@context => :links) do
	node(:users) {
		active = Array.new
		@context.crs.each do |relation|
			if relation.active
				gonext = false
				active.each do |n|
		  			gonext = true if relation.udr.user.id == n
				end
				next if gonext
				active.push(relation.udr.user.id)
			end
		end
		active.each.map { |u| {
				:id => u, :href => api_v3_user_url(u)
		}}
	}
end
