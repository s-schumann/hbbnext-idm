object @context
attributes :id, :alias, :display_name, :uuid

child(@context => :links) {
	attributes :cr_ids, :udr_ids
}
