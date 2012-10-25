object @device
attributes :id, :alias, :display_name, :address, :uuid

child(@device => :links) {
	node :contexts do
		@device.udrs.map { |udr| {
			:udr => udr.contexts.map { |c| {
				:id => c.id, :name => c.display_name
			}}
		}}
	end
	node :users do	
		@device.users.map { |u| {	
			:id => u.id, :username => u.username, :href => "http://#{$currentDomain}/api/#{$currentVersion}/users/#{u.id}"
		}}
	end
}
