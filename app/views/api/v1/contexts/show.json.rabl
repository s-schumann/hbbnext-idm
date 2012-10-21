object @context
attributes :id, :alias, :display_name, :uuid

node(:links) {
	attributes :cr_ids, :udr_ids
}
