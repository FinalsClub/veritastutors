class MiscController < ApplicationController

  def homepage

    @pending_tasks = WorkflowTasks.find_by_owner_id(current_user.id)

  end

end
