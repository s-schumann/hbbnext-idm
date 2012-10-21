object @device
attributes :id, :alias, :display_name, :address, :uuid

node(:links) {
	attributes :udr_ids, :user_ids
}
