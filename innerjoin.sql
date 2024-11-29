SELECT 
    TravelBooking.BookingID,
    TravelBooking.CustomerID,
    Customer.FirstName,
    Customer.LastName,
    Destination.DestinationName,
    Transportation.TransportationType
FROM 
    TravelBooking
INNER JOIN 
    Customer
ON 
    TravelBooking.CustomerID = Customer.CustomerID
INNER JOIN 
    Destination
ON 
    TravelBooking.DestinationID = Destination.DestinationID
INNER JOIN 
    Transportation
ON 
    TravelBooking.TransportationModeID = Transportation.TransportationModeID;

