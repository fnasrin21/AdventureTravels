SELECT 
    Customer.FirstName,
    Customer.LastName,
    TravelBooking.BookingID,
    Destination.DestinationName
FROM 
    Customer
RIGHT JOIN 
    TravelBooking
ON 
    Customer.CustomerID = TravelBooking.CustomerID
RIGHT JOIN 
    Destination
ON 
    TravelBooking.DestinationID = Destination.DestinationID;

