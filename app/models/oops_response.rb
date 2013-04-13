class OopsResponse < ActiveRecord::Base
  belongs_to :request, class_name: 'OopsRequest'
  has_and_belongs_to_many :entities

  attr_accessible :code, :description, :name, :element_type
end