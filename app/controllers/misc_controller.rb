class MiscController < ApplicationController

  def homepage

    if(logged_in?)
      @pending_tasks = WorkflowTask.find_all_by_owner_id(current_user.id)
    end

  end

end
