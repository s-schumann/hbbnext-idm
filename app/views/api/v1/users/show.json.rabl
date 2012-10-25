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
	node :contexts do
		@user.udrs.map { |udr| {
			:udr => udr.contexts.map { |c| {
				:id => c.id, :name => c.display_name
			}}
		}}
	end
	node :devices do
		@user.devices.map { |d| {	
			:id => d.id, :display_name => d.display_name, :href => "http://#{$currentDomain}/api/#{$currentVersion}/devices/#{d.id}"
		}}
	end
}
