object @impression

#sharing store and distance that the ad is bringing the user to
child :store do
	attributes :name, :address, :latitude, :longitude
	node(:distance) { @distance }
end

#actual ad to show for the store that is close by the user
child :ad do
		attributes :id, :name, :headline, :body, :category
end


