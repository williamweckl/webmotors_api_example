#encoding: UTF-8
class Brand < ActiveRecord::Base

  #Associations
  has_many :models, inverse_of: :brand

  #Validations
  validates_presence_of :name, :webmotors_id

end