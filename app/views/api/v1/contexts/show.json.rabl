object @context
attributes :id, :alias, :display_name, :uuid

child(@context => :links) {
	node :users do
		@context.udrs.select('distinct user_id').map { |context| {
			:id => context.user_id, :href => "http://#{$currentDomain}/api/#{$currentVersion}/users/#{context.user_id}"
			}}
	end
	node :devices do
		@context.udrs.select('distinct device_id').map { |context| {
			:id => context.device_id, :href => "http://#{$currentDomain}/api/v1/devices/#{context.device_id}"
			}}
	end
}
