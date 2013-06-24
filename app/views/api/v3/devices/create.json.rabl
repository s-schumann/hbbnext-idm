object @device
attributes :id, :alias, :display_name, :address, :uuid

node(:meta) {
	attribute :description => "Device created.", :success => true, :created_by => @device.created_by, :created_at => @device.created_at, :updated_at => @device.updated_at, :version => "v3"
}
