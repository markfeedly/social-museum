require 'carrierwave/orm/activerecord'

class Uploads < ActiveRecord::Base

  include Authority::Abilities
  self.authorizer_name = 'ResourceAuthorizer'

end