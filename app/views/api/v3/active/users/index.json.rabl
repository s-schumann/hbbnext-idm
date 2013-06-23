object @context
attributes :id

node(:web_url) {
	|context| context_url(context)
}

node(:href) {
	|context| api_v3_context_url(context)
}

node(:users) {
	active = Array.new
	lastlogin = Time.now
	@context.crs.each do |relation|
		if relation.active
			gonext = false
			active.each do |n|
	  			gonext = true if relation.udr.user.username == n
			end
			next if gonext
			active.push(relation.udr.user.username)
		end
		lastlogin = relation.last_login
	end
	active.each
}
