node("layer") { "wikihistory" }

object false

#sharing store and distance that the ad is bringing the user to
child @ad => :hotspots do
	node ("id") {"2"}
	node :text do
		{:title => @ad.headline, :description => @ad.body, :footnote => @ad.category }
	end
	glue @closest_store do
		node :anchor do
			{:lat => @closest_store.latitude.to_i, :lon => @closest_store.longitude.to_i }
		end
	end	
end





node("errorCode") { 0.to_i }
node("errorStrng") { "No POI found. Please increase the search range to try again." }


