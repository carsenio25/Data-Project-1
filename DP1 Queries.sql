use music_data;

# Getting everything from each table
SELECT * FROM dim_tracks;
SELECT * FROM dim_artist;
SELECT * FROM dim_date;
SELECT * FROM fact_sales;

# Getting each artist and number of songs they have from dim_tracks
SELECT Artist, COUNT(TrackId) AS NumberOfSongs
FROM dim_tracks
GROUP BY Artist
ORDER BY NumberOfSongs DESC;

# Getting total sales revenue and quantity sold per artist and year
SELECT 
    dt.Artist AS ArtistName,
    dd.Year,
    SUM(fs.UnitPrice * fs.Quantity) AS TotalRevenue,
    SUM(fs.Quantity) AS TotalQuantitySold
FROM 
    fact_sales fs
JOIN 
    dim_tracks dt ON fs.TrackId = dt.TrackId
JOIN 
    dim_date dd ON fs.SaleDate = dd.Date
GROUP BY 
    dt.Artist, dd.Year
ORDER BY 
    TotalRevenue DESC, TotalQuantitySold DESC;