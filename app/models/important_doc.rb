class ImportantDoc < ActiveRecord::Base
	belongs_to :deal
	belongs_to :user

  has_attached_file :doc_files
  validates_attachment_content_type :doc_files, :content_type => [ 'application/pdf', 'application/msword', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document' ]
end
