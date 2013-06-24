object @context
attributes :id, :alias, :display_name, :uuid

node(:meta) {
	attribute :description => "Context updated.", :success => true, :created_by => @context.created_by, :created_at => @context.created_at, :updated_at => @context.updated_at, :version => "v3"
}
