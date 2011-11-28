class Reputation < ActiveRecord::Base
	
  belongs_to :reputed, :class_name => "User", :foreign_key => "reputed_id"
  belongs_to :reputer, :class_name => "User", :foreign_key => "reputer_id"
end
