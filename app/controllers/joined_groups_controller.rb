class JoinedGroupsController < ApplicationController
  def index
    matching_joined_groups = JoinedGroup.all

    @list_of_joined_groups = matching_joined_groups.order({ :created_at => :desc })

    render({ :template => "joined_groups/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_joined_groups = JoinedGroup.where({ :id => the_id })

    @the_joined_group = matching_joined_groups.at(0)

    render({ :template => "joined_groups/show.html.erb" })
  end

  def create
    the_joined_group = JoinedGroup.new
    the_joined_group.user_id = @current_user.id
    the_joined_group.meeting_id = params.fetch("query_meeting_group_id")

    if the_joined_group.valid?
      the_joined_group.save
      redirect_to("/joined_groups", { :notice => "Joined group created successfully." })
    else
      redirect_to("/joined_groups", { :notice => "Joined group failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_joined_group = JoinedGroup.where({ :id => the_id }).at(0)
    the_joined_group.meeting.meeting_time = params.fetch("query_meeting_time")
    the_joined_group.meeting.title = params.fetch("query_title")
    the_joined_group.meeting.location = params.fetch("query_location")

    if the_joined_group.valid?
      the_joined_group.save
      redirect_to("/joined_groups/#{the_joined_group.id}", { :notice => "Joined group updated successfully."} )
    else
      redirect_to("/joined_groups/#{the_joined_group.id}", { :alert => "Joined group failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_joined_group = JoinedGroup.where({ :id => the_id }).at(0)

    the_joined_group.destroy

    redirect_to("/joined_groups", { :notice => "Joined group deleted successfully."} )
  end
end
