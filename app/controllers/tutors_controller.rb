class TutorsController < ApplicationController

#  require_role "admin", :for_all_except => :home
  require_role "tutor", :for => :home

  
  def home

    @tutor = Tutor.find_by_user_id(current_user.id) 
    @requests = @tutor.appointment_requests
  end

  # GET /tutors
  # GET /tutors.xml
  def index
    @tutors = Tutor.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tutors }
    end
  end

  # GET /tutors/1
  # GET /tutors/1.xml
  def show
    @tutor = Tutor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tutor }
    end
  end

  # GET /tutors/new
  # GET /tutors/new.xml
  def new
    @tutor = Tutor.new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tutor }
    end
  end

  # GET /tutors/1/edit
  def edit
    @tutor = Tutor.find(params[:id])
  end

  # POST /tutors
  # POST /tutors.xml
  def create

    @user = User.new(params[:user])
    tutorRole = Role.find_by_name('tutor')
    @user.roles = [ tutorRole ]
    @user.save
    success = @user.save && @user.errors.empty?
    errors = @user.errors
    if(success) 
      @tutor = Tutor.new()
      @tutor.user_id = @user.id
      success = @tutor.save && @tutor.errors.empty? 
      errors = @tutor.errors
      if(! success)
        @user.delete
      end
    end
  
    respond_to do |format|
      if success
        flash[:notice] = 'Tutor was successfully created.'
        format.html { redirect_to(@tutor) }
        format.xml  { render :xml => @tutor, :status => :created, :location => @tutor }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tutors/1
  # PUT /tutors/1.xml
  def update
    @tutor = Tutor.find(params[:id])

    respond_to do |format|
      if @tutor.update_attributes(params[:tutor])
        flash[:notice] = 'Tutor was successfully updated.'
        format.html { redirect_to(@tutor) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tutor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tutors/1
  # DELETE /tutors/1.xml
  def destroy
    @tutor = Tutor.find(params[:id])
    @tutor.destroy

    respond_to do |format|
      format.html { redirect_to(tutors_url) }
      format.xml  { head :ok }
    end
  end
end
