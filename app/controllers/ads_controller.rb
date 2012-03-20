class AdsController < ApplicationController
  before_filter :authenticate_advertiser!, :except => [:show, :index, :return]
  # GET /ads
  # GET /ads.xml
  def index
    @ads = Ad.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ads }
      format.json { render :json => @ads }
    end
  end

  # GET /ads/1
  # GET /ads/1.xml
  def show
    @ad = Ad.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ad }
      format.json 
    end
  end
  
  def return
    developer_id = params[:developer_id]
    @category = params[:category]
    latitude = params[:latitude].to_f
    longitude = params[:longitude].to_f
    user_info = params[:user_info]
    
    @closest_store = Store.near([latitude, longitude], 10000).first
    closest_store = Store.near([latitude, longitude], 10000).first
    @ad = closest_store.ads.first
    @distance = closest_store.distance.to_f.round(1)
    #http://localhost:3000/ads/1/sports/36.77219/-122.129/young.json Wahoo!
    #http://adreality.heroku.com/ads/1/sports/36.77219/-122.129/young.json
    #AdStoreRelationship.create(:ad_id => 1, :store_id => 1)

    #create the impression of serving the ad
	developer = Developer.find(developer_id)
	@impression = developer.impressions.create(:latitude => latitude , :longitude => longitude, :developer_id => developer_id, :store_id => closest_store.id, :ad_id => @ad.id, :user_info => user_info)

    #API responds with ad in json, should also give store information
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ad }
      format.json 
    end
  end
  
  def clicks
    developer_id = params[:developer_id]
    @category = params[:category]
    latitude = params[:latitude].to_f
    longitude = params[:longitude].to_f
    user_info = params[:user_info]

	#need to pass a variable containing the id of the ad being shown on impression above! Then find the ad to store it in the click entry.
	@ad = Ad.find(2)
	
    #create the click
	developer = Developer.find(developer_id)
	developer.clicks.create(:latitude => latitude , :longitude => longitude, :store_id => closest_store.id, :ad_id => @ad.id, :user_info => user_info)

    #API responds with ad in json, should also give store information
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ad }
      format.json 
    end
  end

  # GET /ads/new
  # GET /ads/new.xml
  
  def new
    @ad = Ad.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ad }
    end
  end

  # GET /ads/1/edit
  
  def edit
    @ad = Ad.find(params[:id])
  end

  # POST /ads
  # POST /ads.xml
  def create
    @ad = current_advertiser.ads.new(params[:ad])
    respond_to do |format|
      if @ad.save
        format.html { redirect_to(@ad, :notice => 'Ad was successfully created.') }
        format.xml  { render :xml => @ad, :status => :created, :location => @ad }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ad.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ads/1
  # PUT /ads/1.xml
  def update
    @ad = Ad.find(params[:id])

    respond_to do |format|
      if @ad.update_attributes(params[:ad])
        format.html { redirect_to(@ad, :notice => 'Ad was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ad.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ads/1
  # DELETE /ads/1.xml
  def destroy
    @ad = Ad.find(params[:id])
    @ad.destroy

    respond_to do |format|
      format.html { redirect_to(ads_url) }
      format.xml  { head :ok }
    end
  end
end
