object @user
attributes :id, :alias, :username, :uuid

child(@user => :credentials) {
	attributes :password, :pin
}

child(@user => :info) {
	attributes :gender, :birthday, :avatar
}

child(@user => :contact) {
	attribute :email
}

node(:mmi) {
	attributes :voice =>  @user.mmi_voice, :face => @user.mmi_face
}

node(:appstore) {
	attributes :pref_price =>  @user.pref_price, :pref_usability =>  @user.pref_usability, :pref_responsiveness =>  @user.pref_responsiveness
}

child(@user => :links) {
	node(:contexts) do
		@cids.uniq.each.map { |cid| {
			:id => Context.find(cid).id, :name => Context.find(cid).display_name, :href => api_v3_context_url(Context.find(cid))
		}}
	end
	node :devices do
		@user.devices.map { |d| {
			:id => d.id, :display_name => d.display_name, :href => api_v3_device_url(Device.find(d.id))
		}}
	end
}

node(:meta) {
	attribute :description => "n/a", :success => true, :created_by => @user.created_by, :created_at => @user.created_at, :updated_at => @user.updated_at, :version => "v3"
}
