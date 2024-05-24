--PROBLEM STATEMENT:
-- Write a query to find the busiest route along with total ticket count
--oneway_round= 'O' - one way trip, oneway_round = 'R'- round trip
-- DEL to BOM route is different from BOM to DEL
--Practice daily SQL challenge #2

--Create the tickets table
CREATE TABLE tickets (
  airline_number VARCHAR(10),
  origin VARCHAR(3),
  destination VARCHAR(3),
  oneway_round CHAR(1),
  ticket_count INT
);

--Insert values into the tickets table
INSERT INTO tickets (airline_number, origin, destination, oneway_round, ticket_count)
VALUES
  ('DEF456', 'BOM', 'DEL', 'O', 150),
  ('GHI789', 'DEL', 'BOM', 'R', 50),
  ('JKL012', 'BOM', 'DEL', 'R', 75),
  ('MNO345', 'DEL', 'NYC', 'O', 200),
  ('PQR678', 'NYC', 'DEL', 'O', 180),
  ('STU901', 'NYC', 'DEL', 'R', 60),
  ('ABC123', 'DEL', 'BOM', 'O', 100),
  ('VWX234', 'DEL', 'NYC', 'R', 90);


--The Query

WITH TripCounts AS (
  SELECT
    CASE WHEN origin = destination THEN  -- Same origin and destination is considered round trip
      origin + destination
    ELSE
  	  origin + destination + oneway_round
    END AS route,
    SUM(ticket_count) AS total_tickets
  FROM tickets
  GROUP BY route
)
SELECT route, total_tickets
FROM TripCounts
ORDER BY total_tickets DESC
LIMIT 1;


