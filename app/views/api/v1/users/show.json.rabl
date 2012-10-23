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
	@user.udrs.each do |udr| 
		child(udr.contexts => :contexts) do |context| 
			attributes :id => :id, :display_name => :name
		end 
	end
	child(@user.devices => :devices) do	
		attributes :id => :id, :display_name => :name
	end
}
