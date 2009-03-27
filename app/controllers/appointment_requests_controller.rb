class AppointmentRequestsController < ApplicationController
  # GET /appointment_requests
  # GET /appointment_requests.xml
  def index
    @appointment_requests = AppointmentRequest.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @appointment_requests }
    end
  end

  # GET /appointment_requests/1
  # GET /appointment_requests/1.xml
  def show
    @appointment_request = AppointmentRequest.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @appointment_request }
    end
  end

  # GET /appointment_requests/new
  # GET /appointment_requests/new.xml
  def new
    @appointment_request = AppointmentRequest.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @appointment_request }
    end
  end

  # GET /appointment_requests/1/edit
  def edit
    @appointment_request = AppointmentRequest.find(params[:id])
  end

  # POST /appointment_requests
  # POST /appointment_requests.xml
  def create
    @appointment_request = AppointmentRequest.new(params[:appointment_request])

    respond_to do |format|
      if @appointment_request.save
        flash[:notice] = 'AppointmentRequest was successfully created.'
        format.html { redirect_to(@appointment_request) }
        format.xml  { render :xml => @appointment_request, :status => :created, :location => @appointment_request }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @appointment_request.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /appointment_requests/1
  # PUT /appointment_requests/1.xml
  def update
    @appointment_request = AppointmentRequest.find(params[:id])

    respond_to do |format|
      if @appointment_request.update_attributes(params[:appointment_request])
        flash[:notice] = 'AppointmentRequest was successfully updated.'
        format.html { redirect_to(@appointment_request) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @appointment_request.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /appointment_requests/1
  # DELETE /appointment_requests/1.xml
  def destroy
    @appointment_request = AppointmentRequest.find(params[:id])
    @appointment_request.destroy

    respond_to do |format|
      format.html { redirect_to(appointment_requests_url) }
      format.xml  { head :ok }
    end
  end
end
