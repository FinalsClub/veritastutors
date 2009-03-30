class WorkflowTaskTypesController < ApplicationController
  # GET /workflow_task_types
  # GET /workflow_task_types.xml
  def index
    @workflow_task_types = WorkflowTaskType.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @workflow_task_types }
    end
  end

  # GET /workflow_task_types/1
  # GET /workflow_task_types/1.xml
  def show
    @workflow_task_type = WorkflowTaskType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @workflow_task_type }
    end
  end

  # GET /workflow_task_types/new
  # GET /workflow_task_types/new.xml
  def new
    @workflow_task_type = WorkflowTaskType.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @workflow_task_type }
    end
  end

  # GET /workflow_task_types/1/edit
  def edit
    @workflow_task_type = WorkflowTaskType.find(params[:id])
  end

  # POST /workflow_task_types
  # POST /workflow_task_types.xml
  def create
    @workflow_task_type = WorkflowTaskType.new(params[:workflow_task_type])

    respond_to do |format|
      if @workflow_task_type.save
        flash[:notice] = 'WorkflowTaskType was successfully created.'
        format.html { redirect_to(@workflow_task_type) }
        format.xml  { render :xml => @workflow_task_type, :status => :created, :location => @workflow_task_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @workflow_task_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /workflow_task_types/1
  # PUT /workflow_task_types/1.xml
  def update
    @workflow_task_type = WorkflowTaskType.find(params[:id])

    respond_to do |format|
      if @workflow_task_type.update_attributes(params[:workflow_task_type])
        flash[:notice] = 'WorkflowTaskType was successfully updated.'
        format.html { redirect_to(@workflow_task_type) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @workflow_task_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /workflow_task_types/1
  # DELETE /workflow_task_types/1.xml
  def destroy
    @workflow_task_type = WorkflowTaskType.find(params[:id])
    @workflow_task_type.destroy

    respond_to do |format|
      format.html { redirect_to(workflow_task_types_url) }
      format.xml  { head :ok }
    end
  end
end
