class StudentsController < ApplicationController

  require_role ["admin","client"]

  # GET /students
  # GET /students.xml
  def index
    @students = Student.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @students }
    end
  end

  # GET /students/1
  # GET /students/1.xml
  def show
    @student = Student.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @student }
    end
  end

  # GET /students/new
  # GET /students/new.xml
  def new
    @student = Student.new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @student }
    end
  end

  # GET /students/1/edit
  def edit
    @student = Student.find(params[:id])
  end

  # POST /students
  # POST /students.xml
  def create

    @user = User.new(params[:user])
    success = @user && @user.save
    if (! success) || (! @user.errors.empty?)
      flash[:error] = "We were unable to set up that account"
      render :action => 'new'
      return
    end


    # a client creates a child student, an admin
    # specifies one
    
    if( current_user.has_role? 'client' )
      @client = Client.find_by_user_id(current_user.id)
    end

    if( current_user.has_role? 'admin' )
      @client = Client.find_by_user_id(params[:student][:client_id])
    end


    @student = Student.new()
    @student.user_id = @user.id
    @student.client_id = @client.id

    success = @student && @student.save

    @user.roles << Role[:student]

    if (! success) || (! @student.errors.empty?)
      @user.delete
      flash[:error] = "We were unable to set up that account"
      render :action => 'new'
      return
    end

    task = WorkflowTask.new
    task.workflow_task_type_id = WorkflowTaskType::OnSiteInterviewId
    task.owner = User.find_by_login('admin')
    task.target_id = @user.id
    task.save()
    
    redirect_back_or_default('/')

  end

  # PUT /students/1
  # PUT /students/1.xml
  def update
    @student = Student.find(params[:id])

    respond_to do |format|
      if @student.update_attributes(params[:student])
        flash[:notice] = 'Student was successfully updated.'
        format.html { redirect_to(@student) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @student.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.xml
  def destroy
    @student = Student.find(params[:id])
    @student.destroy

    respond_to do |format|
      format.html { redirect_to(students_url) }
      format.xml  { head :ok }
    end
  end
end
