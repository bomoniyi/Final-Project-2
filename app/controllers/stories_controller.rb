class StoriesController < ApplicationController
  def index
    matching_stories = Story.all

    @list_of_stories = matching_stories.order({ :created_at => :desc })

    render({ :template => "stories/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_stories = Story.where({ :id => the_id })

    @the_story = matching_stories.at(0)

    render({ :template => "stories/show.html.erb" })
  end

  def create
    the_story = Story.new
    the_story.user_id = params.fetch("query_user_id")
    the_story.post = params.fetch("query_post")

    if the_story.valid?
      the_story.save
      redirect_to("/stories", { :notice => "Story created successfully." })
    else
      redirect_to("/stories", { :notice => "Story failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_story = Story.where({ :id => the_id }).at(0)

    the_story.user_id = params.fetch("query_user_id")
    the_story.post = params.fetch("query_post")

    if the_story.valid?
      the_story.save
      redirect_to("/stories/#{the_story.id}", { :notice => "Story updated successfully."} )
    else
      redirect_to("/stories/#{the_story.id}", { :alert => "Story failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_story = Story.where({ :id => the_id }).at(0)

    the_story.destroy

    redirect_to("/stories", { :notice => "Story deleted successfully."} )
  end
end
