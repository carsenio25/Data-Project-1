# Data-Project-1
Carson Colyer

Tables: fact_sales, dim_date, dim_tracks, dim_artist

Development Summary:
Most of the lines of code I wrote also have comments with details so I will keep this summary brief and high-level. 

How to use:
-You want to open a local instance of MySQL, then create a schema called all-lowercase 'chinook'. Then you want to import the Chinook_MySql.sql file and then run it to create and populate the chinook db. Keep this open the whole time.
-Then you want to download Spotify API Part.ipynb, ETL.ipynb, song_pop.csv, and artist_pop.csv into the same directory.
-You then first open and run all cells in Spotify API Part.ipynb (make sure they're finished running) before opening and running all cells in ETL.ipynb. There will be a slight wait time for some of the cells in the first file, some take around 30 secs to complete.
-Then go back into the opened instance of MySQL and you should see the populated music_data db with the fact_sales, dim_date, dim_tracks, dim_artist tables that are also all populated. You can then download DP1 Queries.sql and run each query to test the data mart.


Note about Spotify API Part.ipynb: The line "cursor.execute("SELECT Name FROM track LIMIT 50")" makes it so only the first 50 tracks in the chinook db have spotify data have data extracted for them. This is for the sake of keeping running times short, albeit at the cost of losing a lot of data. If you want you can change the value from 50 to something else or remove the LIMIT statement altogether. If you decide to change it to a higher value and run into issues, that is likely because of the usage limits of the Spotify API. Let me know if this happens and I will replace the keys in the code with new ones for it to start afresh. 
