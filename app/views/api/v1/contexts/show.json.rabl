object @context
attributes :id, :alias, :display_name, :uuid

child(@context => :links) {
	@context.udrs.select('distinct user_id').each do |relation|
		child(relation.user => :user) do
			attributes :id => :id, :username => :name
		end
	end
	@context.udrs.select('distinct device_id').each do |relation|
		child(relation.device => :device) do
			attributes :id => :id, :display_name => :name
		end
	end

	node(:udrs_u) do |context|
		context.udrs.select('distinct user_id')
	end

	node(:udrs_d) do |context|
		context.udrs.select('distinct device_id')
	end

}
		