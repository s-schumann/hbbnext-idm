object @context
attributes :id

node(:web_url) {
	|context| context_url(context)
}

node(:href) {
	|context| api_v3_context_url(context)
}

node(:devices) {
	active = Array.new
	lastlogin = Time.now
	@context.crs.each do |relation|
		if relation.active
			gonext = false
			active.each do |n|
	  			gonext = true if relation.udr.device.display_name == n
			end
			next if gonext
			active.push(relation.udr.device.display_name)
		end
		lastlogin = relation.last_login
	end
	active.each
}
