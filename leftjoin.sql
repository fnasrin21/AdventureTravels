SELECT 
    Customer.FirstName,
    Customer.LastName,
    Destination.DestinationName,
    Transportation.TransportationType,
    Payment.PaymentAmount,
    Payment.PaymentMethod
FROM 
    TravelBooking
LEFT JOIN 
    Customer
ON 
    TravelBooking.CustomerID = Customer.CustomerID
LEFT JOIN 
    Destination
ON 
    TravelBooking.DestinationID = Destination.DestinationID
LEFT JOIN 
    Transportation
ON 
    TravelBooking.TransportationModeID = Transportation.TransportationModeID
LEFT JOIN 
    Payment
ON 
    TravelBooking.BookingID = Payment.BookingID;
