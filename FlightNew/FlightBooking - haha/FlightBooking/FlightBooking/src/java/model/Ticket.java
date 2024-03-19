package model;

import java.util.Date;

public class Ticket {
    private int id;
    private String username;
    private int FlightId;
    private int seatNumber;
    private Date bookedDate; // Add the bookedDate field
    private int numberSeat;
    private int price;

    public Ticket() {
    }

    public Ticket(int id, String username, int FlightId, int seatNumber, Date bookedDate, int numberSeat) {
        this.id = id;
        this.username = username;
        this.FlightId = FlightId;
        this.seatNumber = seatNumber;
        this.bookedDate = bookedDate;
        this.numberSeat = numberSeat;
    }
    

    public Ticket(int id, String username, int FlightId, int seatNumber, Date bookedDate, int numberSeat, int price) {
        this.id = id;
        this.username = username;
        this.FlightId = FlightId;
        this.seatNumber = seatNumber;
        this.bookedDate = bookedDate;
        this.numberSeat = numberSeat;
        this.price = price;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getFlightId() {
        return FlightId;
    }

    public void setFlightId(int FlightId) {
        this.FlightId = FlightId;
    }

    public int getSeatNumber() {
        return seatNumber;
    }

    public void setSeatNumber(int seatNumber) {
        this.seatNumber = seatNumber;
    }

    public Date getBookedDate() {
        return bookedDate;
    }

    public void setBookedDate(Date bookedDate) {
        this.bookedDate = bookedDate;
    }

    public int getNumberSeat() {
        return numberSeat;
    }

    public void setNumberSeat(int numberSeat) {
        this.numberSeat = numberSeat;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    
}
