class WorkflowTasksController < ApplicationController
  # GET /workflow_tasks
  # GET /workflow_tasks.xml
  def index
    @workflow_tasks = current_user.workflow_tasks

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @workflow_tasks }
    end
  end

  # GET /workflow_tasks/1
  # GET /workflow_tasks/1.xml
  def show
    @workflow_task = WorkflowTask.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @workflow_task }
    end
  end

  # GET /workflow_tasks/new
  # GET /workflow_tasks/new.xml
  def new
    @workflow_task = WorkflowTask.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @workflow_task }
    end
  end

  # GET /workflow_tasks/1/edit
  def edit
    @workflow_task = WorkflowTask.find(params[:id])
  end

  # POST /workflow_tasks
  # POST /workflow_tasks.xml
  def create
    @workflow_task = WorkflowTask.new(params[:workflow_task])

    respond_to do |format|
      if @workflow_task.save
        flash[:notice] = 'WorkflowTask was successfully created.'
        format.html { redirect_to(@workflow_task) }
        format.xml  { render :xml => @workflow_task, :status => :created, :location => @workflow_task }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @workflow_task.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /workflow_tasks/1
  # PUT /workflow_tasks/1.xml
  def update
    @workflow_task = WorkflowTask.find(params[:id])

    respond_to do |format|
      if @workflow_task.update_attributes(params[:workflow_task])
        flash[:notice] = 'WorkflowTask was successfully updated.'
        format.html { redirect_to(@workflow_task) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @workflow_task.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /workflow_tasks/1
  # DELETE /workflow_tasks/1.xml
  def destroy
    @workflow_task = WorkflowTask.find(params[:id])
    @workflow_task.destroy

    respond_to do |format|
      format.html { redirect_to(workflow_tasks_url) }
      format.xml  { head :ok }
    end
  end
end
