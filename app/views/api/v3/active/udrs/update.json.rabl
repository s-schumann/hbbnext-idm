object @context
attributes :id

node(:meta) {
	attribute :description => "Active context updated.", :success => true, :created_by => @context.created_by, :created_at => @context.created_at, :updated_at => @context.updated_at, :version => "v3"
}
