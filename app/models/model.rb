#encoding: UTF-8
class Model < ActiveRecord::Base

  #Associations
  belongs_to :brand, inverse_of: :models, required: true

  #Validations
  validates_presence_of :name, :webmotors_id

end