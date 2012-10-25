object @device
attributes :id, :alias, :display_name, :address, :uuid

child(@device => :links) {
	node :contexts do
		@device.udrs.map { |udr| {
			:udr => udr.contexts.map { |c| {
				:name => c.display_name
			}}
		}}
	end
	child(@device.users => :users) do	
		attributes :id => :id, :username => :name
	end
}
