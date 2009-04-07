class ClientsController < ApplicationController
  # GET /clients
  # GET /clients.xml
  def index
    @clients = Client.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @clients }
    end
  end

  # GET /clients/1
  # GET /clients/1.xml
  def show
    @client = Client.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @client }
    end
  end

  # GET /clients/new
  # GET /clients/new.xml
  def new
    @user = User.new
    @client = Client.new
    @student = Student.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @client }
    end
  end

  # GET /clients/1/edit
  def edit
    @client = Client.find(params[:id])
  end

  # POST /clients
  # POST /clients.xml
  def create

    logout_keeping_session!
    @user = User.new(params[:user])
    success = @user && @user.save
    if (! success) || (! @user.errors.empty?)
      flash[:error] = "We were unable to set up that account"
      render :action => 'new'
      return
    end

    @client = Client.new(params[:client])
    @client.user_id = @user.id
    success = @client && @client.save

    if (! success) || (! @client.errors.empty?)
      @user.delete
      flash[:error] = "We were unable to set up that account"
      render :action => 'new'
      return
    end

    @user.roles << Role[:client]

    if(@client.is_student)
      @student = Student.new()
      @student.user_id = @user.id
      @student.client_id = @client.id

      success = @student && @student.save
      @user.roles << Role[:student]
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
      render :action => 'new'
      return
    end
    
    self.current_user = @user # logged in


    redirect_back_or_default('/')

  end

  # PUT /clients/1
  # PUT /clients/1.xml
  def update
    @client = Client.find(params[:id])

    respond_to do |format|
      if @client.update_attributes(params[:client])
        flash[:notice] = 'Client was successfully updated.'
        format.html { redirect_to(@client) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @client.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1
  # DELETE /clients/1.xml
  def destroy
    @client = Client.find(params[:id])
    @client.destroy

    respond_to do |format|
      format.html { redirect_to(clients_url) }
      format.xml  { head :ok }
    end
  end
end
