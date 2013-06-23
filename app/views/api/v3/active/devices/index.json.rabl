object @context
attributes :id

node(:web_url) {
	|context| context_url(context)
}

node(:href) {
	|context| api_v3_context_url(context)
}

child(@context => :links) do
	node(:devices) {
		active = Array.new
		@context.crs.each do |relation|
			if relation.active
				gonext = false
				active.each do |n|
		  			gonext = true if relation.udr.device.id == n
				end
				next if gonext
				active.push(relation.udr.device.id)
			end
		end
		active.each.map { |d| {
					:id => d, :href => api_v3_device_url(d)
		}}
	}
end
