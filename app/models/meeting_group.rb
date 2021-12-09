# == Schema Information
#
# Table name: meeting_groups
#
#  id           :integer          not null, primary key
#  location     :string
#  meeting_time :datetime
#  title        :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :integer
#
class MeetingGroup < ApplicationRecord
  belongs_to(:user, { :required => true, :class_name => "User", :foreign_key => "user_id" })
  has_many(:joined_groups, { :class_name => "JoinedGroup", :foreign_key => "meeting_id", :dependent => :destroy })
end
