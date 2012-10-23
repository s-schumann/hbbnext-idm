object @device
attributes :id, :alias, :display_name, :address, :uuid

child(@device => :links) {
	attributes :udr_ids, :user_ids
}
