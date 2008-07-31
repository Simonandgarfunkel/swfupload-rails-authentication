require 'mime/types'

class Asset < ActiveRecord::Base
  
  # Relationships
  belongs_to :user
  
  has_attachment  :storage      => :file_system,
                  :max_size     => 5.megabytes,
                  :resize_to    => '800x600>',
                  :thumbnails   => { :thumb => '150x150>' },
                  :processor    => :MiniMagick
                 
 
  # Validations
  validates_as_attachment
  
  #
  named_scope :masters, :conditions => {:parent_id => nil}
  
  # Map file extensions to mime types.
  # Thanks to bug in Flash 8 the content type is always set to application/octet-stream.
  # From: http://blog.airbladesoftware.com/2007/8/8/uploading-files-with-swfupload
  def swf_uploaded_data=(data)
    data.content_type = MIME::Types.type_for(data.original_filename)
    self.uploaded_data = data
  end
  
end