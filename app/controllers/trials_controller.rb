class TrialsController < ApplicationController
  # GET /trials
  # GET /trials.xml
  def index
    @trials = Trial.all.sort_by(&:created_at).reverse

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @trials }
    end
  end

  # GET /trials/1
  # GET /trials/1.xml
  def show
    @trial = Trial.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @trial }
    end
  end

  # GET /trials/new
  # GET /trials/new.xml
  def new
    @mode = params[:mode]
    @eventID = params[:event_id]
    @trial = Trial.new
    if !@eventID.nil?
      @event = Event.find(@eventID)
      @trial.event_id = @eventID
    end

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @trial }
    end
  end

  # GET /trials/1/edit
  def edit
    @trial = Trial.find(params[:id])
  end

  # POST /trials
  # POST /trials.xml
  def create
    @trial = Trial.new(params[:trial])

    respond_to do |format|
      if @trial.save
        format.html { redirect_to(@trial, :notice => 'Trial was successfully created.') }
        format.xml  { render :xml => @trial, :status => :created, :location => @trial }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @trial.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /trials/1
  # PUT /trials/1.xml
  def update
    @trial = Trial.find(params[:id])
    
    startTime = Time.zone.parse(params[:trial]["start"])
    endTime = Time.zone.parse(params[:trial]["end"])
    
    # move to model with before_save.
    # See http://stackoverflow.com/questions/1424777/how-to-convert-user-input-hours-minutes-seconds
    if !startTime.nil? && !endTime.nil?
      elapsedTime = endTime - startTime
      @trial.elapsed = elapsedTime
    end
    
    #params[:trial]["start"] = '2008-10-10 12:11:10.000'

    respond_to do |format|
      if @trial.update_attributes(params[:trial])
        format.html { redirect_to(@trial, :notice => 'Trial was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @trial.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /trials/1
  # DELETE /trials/1.xml
  def destroy
    @trial = Trial.find(params[:id])
    @trial.destroy

    respond_to do |format|
      format.html { redirect_to(trials_url) }
      format.xml  { head :ok }
    end
  end
end
