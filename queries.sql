-- Shows all flight transportation details
SELECT TransportationType, CompanyName
FROM Transportation
WHERE TransportationType = 'Flight';

-- Shows customers traveling to Tokyo
SELECT CustomerID
FROM TravelBooking
WHERE DestinationID = 3;

-- Shows total cost of all bookings
SELECT SUM(TotalCost) AS TotalRevenue
FROM TravelBooking;
