node("layer") { "wikihistory" }

object false

#sharing store and distance that the ad is bringing the user to
child @ad => :hotspots do
	attributes :id
	node :text do
		{:title => @ad.headline, :description => @ad.body, :footnote => @ad.category }
	end
	glue @closest_store do
		node :anchor do
			{:lat => @closest_store.latitude, :long => @closest_store.longitude }
		end
	end	
end





node("errorCode") { 0 }
node("errorStrng") { "No POI found. Please increase the search range to try again." }


