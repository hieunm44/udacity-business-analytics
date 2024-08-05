-- 1 - Which countries have the most Invoices?
SELECT "BillingCountry", COUNT("InvoiceId") AS Invoices
FROM "Invoice"
GROUP BY 1
ORDER BY 2 DESC;

-- 2 - Which city has the best customers?
SELECT "BillingCity", SUM("Total") AS Sum_Total
FROM "Invoice"
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;

--3 - Who is the best customer?
SELECT c."CustomerId", SUM(i."Total")
FROM "Customer" c
JOIN "Invoice" i
ON  c."CustomerId" = i."CustomerId"
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;

-- 4 - Use your query to return the email, first name, last name, and Genre of all Rock Music listeners.
--     Return your list ordered alphabetically by email address starting with A.
SELECT DISTINCT c."Email", c."FirstName", c."LastName", g."Name"
FROM "Customer" c
JOIN "Invoice" i
ON  c."CustomerId" = i."CustomerId"
JOIN "InvoiceLine" il
ON il."InvoiceId" = i."InvoiceId"
JOIN "Track" t
ON t."TrackId" = il."TrackId"
JOIN "Genre" g
ON g."GenreId" = t."GenreId"
WHERE g."Name" = 'Rock'
ORDER BY 1;

-- 5 - Returns the Artist name and total track count of the top 10 rock bands.
SELECT ar."ArtistId", ar."Name", COUNT(t."TrackId") AS Songs
FROM "Artist" ar
JOIN "Album" al
ON ar."ArtistId" = al."ArtistId"
JOIN "Track" t
ON t."AlbumId" = al."AlbumId"
JOIN "Genre" g
ON g."GenreId" = t."GenreId"
WHERE g."Name" = 'Rock'
GROUP BY 1, 2
ORDER BY 3 DESC
LIMIT 10;


-- 6 - Which artist has earned the most according to the InvoiceLines?
SELECT ar."Name", SUM(il."UnitPrice"*il."Quantity")
FROM "InvoiceLine" il
JOIN "Track" t
ON t."TrackId" = il."TrackId"
JOIN "Album" al
ON t."AlbumId" = al."AlbumId"
JOIN "Artist" ar
ON ar."ArtistId" = al."ArtistId"
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;

-- Use this artist to find which customer spent the most on this artist.
WITH top_artist AS (
    SELECT ar."ArtistId", ar."Name", SUM(il."UnitPrice"*il."Quantity")
    FROM "InvoiceLine" il
    JOIN "Track" t
    ON t."TrackId" = il."TrackId"
    JOIN "Album" al
    ON t."AlbumId" = al."AlbumId"
    JOIN "Artist" ar
    ON ar."ArtistId" = al."ArtistId"
    GROUP BY 1, 2
    ORDER BY 3 DESC
    LIMIT 1
)

SELECT tar."Name", SUM(i."Total"), c."CustomerId", c."FirstName", c."LastName"
FROM "Customer" c
JOIN "Invoice" i ON  c."CustomerId" = i."CustomerId"
JOIN "InvoiceLine" il ON il."InvoiceId" = i."InvoiceId"
JOIN "Track" t ON t."TrackId" = il."TrackId"
JOIN "Album" al ON t."AlbumId" = al."AlbumId"
JOIN top_artist tar ON tar."ArtistId" = al."ArtistId"
GROUP BY 1, 3, 4, 5
ORDER BY 2 DESC;

-- 7 - Find out the most popular music Genre for each country.
WITH count_genres_in_countries AS (
    SELECT COUNT(il."InvoiceLineId") n_purchases, i."BillingCountry" "Country", g."GenreId"
    FROM "Invoice" i
    JOIN "InvoiceLine" il ON il."InvoiceId" = i."InvoiceId"
    JOIN "Track" t ON t."TrackId" = il."TrackId"
    JOIN "Genre" g ON t."GenreId" = g."GenreId"
    GROUP BY 2, 3
),

max_genres_in_countries AS (
    SELECT MAX(cgic.n_purchases) max_purchases, cgic."Country"
    FROM count_genres_in_countries cgic
    GROUP BY 2
)

SELECT mgic.max_purchases, cgic."Country", g."Name", g."GenreId"
FROM max_genres_in_countries mgic
JOIN count_genres_in_countries cgic
ON mgic."Country" = cgic."Country" AND mgic.max_purchases = cgic.n_purchases
JOIN "Genre" g
ON cgic."GenreId" = g."GenreId"
ORDER BY 2;


-- 8 - Return all the track names that have a song length longer than the average song length
WITH avg_song_len AS (
    SELECT AVG("Milliseconds") avg
    FROM "Track"
)

SELECT "Name", "Milliseconds"
FROM "Track", avg_song_len
WHERE "Milliseconds" > avg_song_len.avg
ORDER BY 2 DESC;


-- 9 - Determine the customer that has spent the most on music for each country.
WITH customer_spending_country AS (
    SELECT i."BillingCountry" "Country", c."CustomerId", SUM(i."Total") sum_total
    FROM "Customer" c
    JOIN "Invoice" i
    ON i."CustomerId" = c."CustomerId"
    GROUP BY 1, 2
),

max_customer_country AS (
    SELECT csc."Country", MAX(csc.sum_total) max_total
    FROM customer_spending_country csc
    GROUP BY 1
)

SELECT mcc."Country", mcc.max_total, c."FirstName", c."LastName", c."CustomerId"
FROM max_customer_country mcc
JOIN customer_spending_country msc
ON mcc."Country" = msc."Country" AND mcc.max_total = msc.sum_total
JOIN "Customer" c
ON msc."CustomerId" = c."CustomerId"
ORDER BY 1;
