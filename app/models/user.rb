class User < ActiveRecord::Base
  attr_accessible :alias, :password, :pin, :username, :udr_ids, :device_ids, :role_ids, :mmi_face, :mmi_voice, :birthday, :gender, :email
  attr_protected :uuid, :created_by

  has_many :udrs, :dependent => :destroy
  has_many :devices, :through => :udrs
  has_many :roles, :through => :udrs

  accepts_nested_attributes_for :udrs

  before_save  :normalize_face, :if => :mmi_face_changed
  before_save  :normalize_voice, :if => :mmi_voice_changed

  def mmi_face_changed
    if self.mmi_face_changed? && !self.new_record?
      true
    else
      false
    end
  end

  def mmi_voice_changed
    if self.mmi_voice_changed? && !self.new_record?
      true
    else
      false
    end
  end

  def normalize_face
    logger.info "Normalizing Face..."

	# config variables
	range = $normalizationInterval
	now = Time.now.to_i
	debug = true

	# test variables
	xuser_id = self.id
	mmi_face = self.mmi_face.to_i
	logger.info "xuser ID: #{xuser_id} - MMI value: #{mmi_face}" if debug

	#  db connection to localhost with the default port
	db = Mongo::Connection.new.db('mmi_values')

	# collections
	faces = db.collection('face')

	# new item
	new_face = { :xuser => xuser_id, :probability => mmi_face, :created_at => now }

	# insert
	face_id = faces.insert(new_face)

	# Normalize
	# Get all xuser values first
	norm = Array.new
	all_faces = faces.find(:xuser => xuser_id).each do |slice|
	   logger.info slice.inspect if debug
	   # If created within range add value to normalization var collector
	   if(slice["created_at"] >= now - range)
	      norm.push(slice["probability"])
	      logger.info norm if debug
	   end
	end
	logger.info "Normalize #{norm.count} values" if debug
	logger.info "Array:" if debug
	logger.info norm if debug

	# Calculate normalized value
	logger.info "Norm:" if debug
	sum = 0
	norm.each do |n|
	   sum += n
	end

	# Present normalized value
	logger.info sum/norm.count if debug
	self.mmi_face = sum/norm.count

	# Drop older than required value
	all_faces = faces.find(:xuser => xuser_id).each do |slice|
	 if(slice["created_at"] < now - range)
	    faces.remove(slice)
	   end
	end

	# Create index for xuser and probability
	faces.create_index("xuser")
	faces.create_index("probability")
  end

def normalize_voice
    logger.info "Normalizing Voice..."

	# config variables
	range = $normalizationInterval
	now = Time.now.to_i
	debug = true

	# test variables
	xuser_id = self.id
	mmi_voice = self.mmi_voice.to_i
	logger.info "xuser ID: #{xuser_id} - MMI value: #{mmi_voice}" if debug

	#  db connection to localhost with the default port
	db = Mongo::Connection.new.db('mmi_values')

	# collections
	voices = db.collection('voice')

	# new item
	new_voice = { :xuser => xuser_id, :probability => mmi_voice, :created_at => now }

	# insert
	voice_id = voices.insert(new_voice)

	# Normalize
	# Get all xuser values first
	norm = Array.new
	all_voices = voices.find(:xuser => xuser_id).each do |slice|
	   logger.info slice.inspect if debug
	   # If created within range add value to normalization var collector
	   if(slice["created_at"] >= now - range)
	      norm.push(slice["probability"])
	      logger.info norm if debug
	   end
	end
	logger.info "Normalize #{norm.count} values" if debug
	logger.info "Array:" if debug
	logger.info norm if debug

	# Calculate normalized value
	logger.info "Norm:" if debug
	sum = 0
	norm.each do |n|
	   sum += n
	end

	# Present normalized value
	logger.info sum/norm.count if debug
	self.mmi_voice = sum/norm.count

	# Drop older than required value
	all_voices = voices.find(:xuser => xuser_id).each do |slice|
	 if(slice["created_at"] < now - range)
	    voices.remove(slice)
	   end
	end

	# Create index for xuser and probability
	voices.create_index("xuser")
	voices.create_index("probability")
  end

end
