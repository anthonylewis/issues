class IssuesController < ApplicationController
  authorize_resource

  # GET /issues
  # GET /issues.xml
  def index
    @issues = Issue.paginate :page => params[:page],
      :per_page => 5

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @issues }
    end
  end

  # GET /issues/1
  # GET /issues/1.xml
  def show
    @issue = Issue.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @issue }
    end
  end

  # GET /issues/new
  # GET /issues/new.xml
  def new
    @issue = Issue.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @issue }
    end
  end

  # GET /issues/1/edit
  def edit
    @issue = Issue.find(params[:id])
  end

  # POST /issues
  # POST /issues.xml
  def create
    @issue = Issue.new(params[:issue])
    @issue.user_id = current_user

    respond_to do |format|
      if @issue.save
        format.html { redirect_to(@issue, :notice => 'Issue was successfully created.') }
        format.xml  { render :xml => @issue, :status => :created, :location => @issue }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @issue.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /issues/1
  # PUT /issues/1.xml
  def update
    @issue = Issue.find(params[:id])

    respond_to do |format|
      if @issue.update_attributes(params[:issue])
        format.html { redirect_to(@issue, :notice => 'Issue was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @issue.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /issues/1
  # DELETE /issues/1.xml
  def destroy
    @issue = Issue.find(params[:id])
    @issue.destroy

    respond_to do |format|
      format.html { redirect_to(issues_url) }
      format.xml  { head :ok }
    end
  end
end
