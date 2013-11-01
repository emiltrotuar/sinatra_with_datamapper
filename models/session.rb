# class Session
# 	include DataMapper::Resource
# 	property :id,         Integer, :serial=>true
# 	property :rec,      String
# 	property :user_id, 	String
# 	property :created_at, DateTime
# 	default_scope order: 'records.position ASC'
	
# 	def to_s
# 		"#{user.id}\t#{user.name}\t#{created_at}"
# 	end
# end