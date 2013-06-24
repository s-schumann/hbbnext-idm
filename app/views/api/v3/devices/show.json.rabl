object @device
attributes :id, :alias, :display_name, :address, :uuid

child(@device => :links) {
	node(:contexts) do
		@cids.uniq.each.map { |cid| {
			:id => Context.find(cid).id, :name => Context.find(cid).display_name, :href => api_v3_context_url(Context.find(cid))
		}}
	end
	node :users do
		@device.users.map { |u| {
			:id => u.id, :username => u.username, :href => api_v3_user_url(User.find(u.id))
		}}
	end
}

node(:meta) {
	attribute :description => "n/a", :success => true, :created_by => @device.created_by, :created_at => @device.created_at, :updated_at => @device.updated_at, :version => "v3"
}
