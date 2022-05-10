# xkcd_demo

-Paginated listview to browse through comics using bloc for state management 

-xkcd search couldn't be implemented the server seems to be down (always returning 500)

-notifications could be implemented in 2 main ways I can think of:

       1: have the app be always running in the background polling the rss server (not recommended)
   
       2: have a firebase function poll the rss server and send the notifications through firebase messaging (or using a similar service from aws)
 -share functionality done using share_plus package
 
 -favourites are saved using shared_preferences package for the comic data and optimized_cached_image package for all image data
 
 
