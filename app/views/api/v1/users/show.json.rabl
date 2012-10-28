object @user
attributes :id, :alias, :username, :uuid

child(@user => :credentials) {
	attributes :password, :pin 
}

child(@user => :info) {
	attributes :gender, :birthday
}	

child(@user => :contact) {
	attribute :email
}

node(:mmi) {
	attributes :voice =>  Random.rand().round(2), :face => Random.rand().round(2)
}

child(@user => :links) {
	node(:contexts) do
		@cids.uniq.each.map { |cid| {
			:id => Context.find(cid).id, :name => Context.find(cid).display_name, :href => api_v1_context_url(Context.find(cid))
		}}	
	end
	node :devices do
		@user.devices.map { |d| {	
			:id => d.id, :display_name => d.display_name, :href => "http://#{$currentDomain}/api/v1/devices/#{d.id}"
		}}
	end
}
