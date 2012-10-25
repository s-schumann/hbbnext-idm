object @context
attributes :id, :alias, :display_name, :uuid

child(@context => :links) {
	node(:users) do |context|
		context.udrs.select('distinct user_id')
	end

	node(:devices) do |context|
		context.udrs.select('distinct device_id')
	end

}
		