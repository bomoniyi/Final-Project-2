# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  first_name      :string
#  image           :string
#  last_name       :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password

  has_many(:meeting_groups, { :class_name => "MeetingGroup", :foreign_key => "user_id", :dependent => :destroy })
  has_many(:joined_groups, { :class_name => "JoinedGroup", :foreign_key => "user_id", :dependent => :destroy })
  has_many(:stories, { :class_name => "Story", :foreign_key => "user_id", :dependent => :destroy })
end
