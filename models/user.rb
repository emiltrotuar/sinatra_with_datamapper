class User
	include DataMapper::Resource
	has_many :records
	property :id,         Integer, :serial=>true
	property :name,      String
	property :created_at, DateTime
	default_scope order: 'records.position ASC'
end