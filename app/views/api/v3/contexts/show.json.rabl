object @context
attributes :id, :alias, :display_name, :uuid

child(@context => :links) {
	node :users do
		@context.udrs.select('distinct user_id').map { |context| {
			:id => context.user_id, :href => api_v3_user_url(User.find(context.user_id))
			}}
	end
	node :devices do
		@context.udrs.select('distinct device_id').map { |context| {
			:id => context.device_id, :href => api_v3_device_url(Device.find(context.device_id))
			}}
	end
}

node(:meta) {
	attribute :description => "n/a", :success => true, :created_by => @context.created_by, :created_at => @context.created_at, :updated_at => @context.updated_at, :version => "v3"
}
