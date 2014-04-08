class CharactersController < ApplicationController
  #before_filter  :login_required #function provided by authenticated system

  # GET /characters
  # GET /characters.json
  # index needs to be selective (ie. all characters in dublin 2)
  def index
    if params[:search]
     @characters = Character.find(:all, :conditions => ['name LIKE ?', "%#{params[:search]}%"])
   
   else
         @characters = Character.find(:all)

    @time = Time.now

    @characters = Character.all

    @json = Character.all.to_gmaps4rails

    @files = Dir.glob('*')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @characters }
    end
  end
end


  # GET /characters/1
  # GET /characters/1.json
  # the show could be used to display the discount profile page to the user after selecting from the list
  def show
    @character = Character.find(params[:id])
    @json = Character.find(params[:id]).to_gmaps4rails

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @character }
    end
  end

  # GET /characters/new
  # GET /characters/new.json
  def new
    @character = Character.new
    @json = Character.all.to_gmaps4rails

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @character }
    end
  end

  # GET /characters/1/edit
  def edit
    @character = Character.find(params[:id])
    @json = Character.find(params[:id]).to_gmaps4rails
  end

  # POST /characters
  # POST /characters.json
  def create
    @character = Character.new(params[:character])

    respond_to do |format|
      if @character.save
        format.html { redirect_to @character, :notice => 'Character was successfully created.' }
        format.json { render :json => @character, :status => :created, :location => @character }
      else
        format.html { render :action => "new" }
        format.json { render :json => @character.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /characters/1
  # PUT /characters/1.json
  def update
    @character = Character.find(params[:id])
    @json = Character.all.to_gmaps4rails
    respond_to do |format|
      if @character.update_attributes(params[:character])
        flash[:success] = "Character's updated."
        format.html { redirect_to @character, :notice => 'Character was successfully updated.' }
        format.json { head :no_content }
        redirect_to character_path(@character)
      else
        format.html { render :action => "edit" }
        format.json { render :json => @character.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # DELETE /characters/1
  # DELETE /characters/1.json
  def destroy
    @character = Character.find(params[:id])
    @character.destroy

    respond_to do |format|
      format.html { redirect_to characters_url }
      format.json { head :no_content }
    end
  end
end


