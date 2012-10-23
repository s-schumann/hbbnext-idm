object @device
attributes :id, :alias, :display_name, :address, :uuid

child(@device => :links) {
	attributes :
	@device.udrs.each do |udr| 
		child(udr.contexts => :contexts) do |context| 
			attributes :id => :id, :display_name => :name
		end 
	end
	child(@device.users => :users) do	
		attributes :id => :id, :username => :name
	end
}

