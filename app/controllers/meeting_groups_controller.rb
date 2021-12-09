class MeetingGroupsController < ApplicationController
  def index
    matching_meeting_groups = MeetingGroup.all

    @list_of_meeting_groups = matching_meeting_groups.order({ :created_at => :desc })

    render({ :template => "meeting_groups/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_meeting_groups = MeetingGroup.where({ :id => the_id })

    @the_meeting_group = matching_meeting_groups.at(0)

    render({ :template => "meeting_groups/show.html.erb" })
  end

  def create
    the_meeting_group = MeetingGroup.new
    the_meeting_group.user_id = params.fetch("query_user_id")
    the_meeting_group.meeting_time = params.fetch("query_meeting_time")
    the_meeting_group.title = params.fetch("query_title")
    the_meeting_group.location = params.fetch("query_location")

    if the_meeting_group.valid?
      the_meeting_group.save
      redirect_to("/meeting_groups", { :notice => "Meeting group created successfully." })
    else
      redirect_to("/meeting_groups", { :notice => "Meeting group failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_meeting_group = MeetingGroup.where({ :id => the_id }).at(0)

    the_meeting_group.user_id = params.fetch("query_user_id")
    the_meeting_group.meeting_time = params.fetch("query_meeting_time")
    the_meeting_group.title = params.fetch("query_title")
    the_meeting_group.location = params.fetch("query_location")

    if the_meeting_group.valid?
      the_meeting_group.save
      redirect_to("/meeting_groups/#{the_meeting_group.id}", { :notice => "Meeting group updated successfully."} )
    else
      redirect_to("/meeting_groups/#{the_meeting_group.id}", { :alert => "Meeting group failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_meeting_group = MeetingGroup.where({ :id => the_id }).at(0)

    the_meeting_group.destroy

    redirect_to("/meeting_groups", { :notice => "Meeting group deleted successfully."} )
  end
end
