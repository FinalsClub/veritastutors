class UsersController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead
  include AuthenticatedSystem
  

  # render new.rhtml
  def new
    @user = User.new
  end
 
  def create
    logout_keeping_session!
    @user = User.new(params[:user])
    success = @user && @user.save
    if success && @user.errors.empty?
            # Protects against session fixation attacks, causes request forgery
      # protection if visitor resubmits an earlier form using back
      # button. Uncomment if you understand the tradeoffs.
      # reset session
      self.current_user = @user # !! now logged in
      redirect_back_or_default('/')
      flash[:notice] = "Thanks for signing up!  We're sending you an email with your activation code."
    else
      flash[:error]  = "We couldn't set up that account, sorry.  Please try again, or contact an admin (link is above)."
      render :action => 'new'
    end
  end


  def new_with_client_or_student
    @user = User.new
    @client = Client.new
    @student = Student.new
  end

  def create_with_client_or_student

    logout_keeping_session!
    @user = User.new(params[:user])
    success = @user && @user.save
    if (! success) || (! @user.errors.empty?)
      flash[:error] = "We were unable to set up that account"
      render :action => 'new_with_client_or_student'
      return
    end

    @client = Client.new(params[:client])
    @client.user_id = @user.id
    success = @client && @client.save

    if (! success) || (! @client.errors.empty?)
      @user.delete
      flash[:error] = "We were unable to set up that account"
      render :action => 'new_with_client_or_student'
      return
    end

    if(@client.is_student)
      @student = Student.new()
      @student.user_id = @user.id
      @student.client_id = @client.id

      success = @student && @student.save
    end


    task = WorkflowTask.new
    task.workflow_task_type_id = WorkflowTaskType::PhoneConsultationId
    task.owner = User.find_by_login('admin')
    task.target_id = @user.id
    task.save()


    if (! success) || (@client.is_student && ! @student.errors.empty?)
      @client.delete
      @user.delete
      flash[:error] = "We were unable to set up that account"
      render :action => 'new_with_client_or_student'
      return
    end
    
    self.current_user = @user # logged in


    redirect_back_or_default('/')
  end
end
