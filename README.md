# Data-Project-1
Carson Colyer

Tables: fact_sales, dim_date, dim_tracks, dim_artist

Development Summary:
Most of the lines of code I wrote also have comments with details so I will keep this summary brief and high-level. I had to start with creating the chinook schema in MySQL and then running the Chinook_MySql.sql to create the tables and populate it. Then I had to extract data from the Spotify API for each music track. In order to do this, I had to start with extracting all the track names from the chinook db in a .txt file which I then iterated through to send requests for various pieces of Spotify information for each track name. This was intially in a json file but then stored in a dictionary and then sent off to be the initial dim_tracks in a new db called music_data. Every step was done in Spotify API Part.ipynb.

I then had to refine the dim_track table as well as create the dim_artist table, dim_date table, and fact_sales table. The fact_sales table was derived from the chinook db data as well as some other information I decided to include from the dim_track spotify data. To refine the dim_track table I changed most of the column names as well as merged it the dataframe for song_pop.csv to add extra info about each track. I also merged it with the track table from the chinook db so I could get the original ID for each song. For dim_artist, I extracted the basis of it from the artist table in chinook db, but then augmented it with popularity data from artist_pop.csv via merging. I had to first merge it with the old dim_track table because it contained each spotify id for each artist, which was info I need in order to merge with artist_pop.csv. To make dim_date, I used pandas to generate a sequence of dates using the date range from Jan 1 2000 to Dec 31 2024. I then exctracted and calculated different components like WeekOfYear, DayOfWeek, etc. also using Pandas. For all tables, I dropped a lot of columns I deemed unnecessary and changed a lot of remaining column names. This all happened in Rest of Work.ipynb.

How to use:

-You want to open a local instance of MySQL, then create a schema called all-lowercase 'chinook'. Then you want to import the Chinook_MySql.sql file and then run it to create and populate the chinook db. Keep this open the whole time.

-Then you want to download Spotify API Part.ipynb, Rest of Work.ipynb, song_pop.csv, and artist_pop.csv into the same directory.

-You then first open and run all cells in Spotify API Part.ipynb (make sure they're finished running) before opening and running all cells in Rest of Work.ipynb. There will be a slight wait time for some of the cells in the first file, some take around 30 secs to complete.

-Then go back into the opened instance of MySQL and you should see the populated music_data db with the fact_sales, dim_date, dim_tracks, dim_artist tables that are also all populated. You can then download DP1 Queries.sql and run each query to test the data mart.


Note about Spotify API Part.ipynb: The line "cursor.execute("SELECT Name FROM track LIMIT 50")" makes it so only the first 50 tracks in the chinook db have spotify data have data extracted for them. This is for the sake of keeping running times short, albeit at the cost of losing a lot of data. If you want you can change the value from 50 to something else or remove the LIMIT statement altogether. If you decide to change it to a higher value and run into issues, that is likely because of the usage limits of the Spotify API. Let me know if this happens and I will replace the keys in the code with new ones for it to start afresh. If you hit an error regardless, that is probably the usage limits, so still let me know and I will replace the keys with new ones.
