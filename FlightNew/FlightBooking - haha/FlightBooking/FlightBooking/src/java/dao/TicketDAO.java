package dao;

import dal.DBContext;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import model.Ticket;

public class TicketDAO extends DBContext {

    public TicketDAO() {
        super();
    }

    public void createTicket(Ticket ticket) {
     
        String query = "INSERT INTO ticket (username, flightId, seatNumber ) "
                + "VALUES (?, ?, ?)";
        try ( PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, ticket.getUsername());
            preparedStatement.setInt(2, ticket.getFlightId());
            preparedStatement.setInt(3, ticket.getNumberSeat());
            preparedStatement.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
    
    public void editTicket(Ticket ticket) {
        if(checkExisted(ticket)) {
            updateNumberSeat(ticket);
        }
        else {
            createTicket(ticket);
        }
    }
    
    
    public void updateNumberSeat(Ticket ticket) {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        String query = "Update [ticket] set [seatNumber] = [seatNumber] + ? where [username] = ? and [flightId] = ? and [bookedDate] = ?";
        try ( PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(2, ticket.getUsername());
            preparedStatement.setInt(3, ticket.getFlightId());
            preparedStatement.setString(4, format.format(ticket.getBookedDate()));
            preparedStatement.setInt(1, ticket.getSeatNumber());
            System.out.println(ticket.getSeatNumber());
            preparedStatement.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
    
    public boolean checkExisted(Ticket ticket) {
        java.util.Date date = new java.util.Date();
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        String query = "SELECT * FROM ticket where [username] = ? and [flightId] = ? and [bookedDate] = ?";
        try ( PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, ticket.getUsername());
            preparedStatement.setInt(2, ticket.getFlightId());
            preparedStatement.setString(3, format.format(date));
            ResultSet rs = preparedStatement.executeQuery();
            return rs.next();
        } catch (SQLException ex) {
            System.out.println("checkExisted: " + ex.getMessage());
        }
        return false;
    }

    public List<Ticket> getAllTickets() {
        List<Ticket> tickets = new ArrayList<>();
        String query = "select * from ticket join Flight on ticket.FlightId = flight.id";
        try ( PreparedStatement preparedStatement = connection.prepareStatement(query);  ResultSet resultSet = preparedStatement.executeQuery()) {
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String username = resultSet.getString("username");
                int FlightId = resultSet.getInt("flightId");
                int seatNumber = resultSet.getInt("seatNumber");
                Date bookedDate = resultSet.getDate("bookedDate"); // Retrieve the booking date
                int price = resultSet.getInt("price");


                Ticket ticket = new Ticket();
                ticket.setId(id);
                ticket.setUsername(username);
                ticket.setFlightId(FlightId);
                ticket.setSeatNumber(seatNumber);
                ticket.setBookedDate(bookedDate); // Set the booking date
                ticket.setPrice(price);
                
                tickets.add(ticket);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return tickets;
    }

    
    
    public Ticket getTicketById(int ticketId) {
        Ticket ticket = null;
        String query = "SELECT * FROM ticket WHERE id = ?";
        try ( PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, ticketId);
            try ( ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    int id = resultSet.getInt("id");
                    String username = resultSet.getString("username");
                    int FlightId = resultSet.getInt("flightId");
                    int seatNumber = resultSet.getInt("seatNumber");
                    Date bookedDate = resultSet.getDate("bookedDate"); // Retrieve the booking date
                 

                    ticket = new Ticket();
                    ticket.setId(id);
                    ticket.setUsername(username);
                    ticket.setFlightId(FlightId);
                    ticket.setSeatNumber(seatNumber);
                    ticket.setBookedDate(bookedDate); // Set the booking date
                   
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return ticket;
    }

    public boolean updateTicket(Ticket ticket) {
        String query = "UPDATE ticket SET username = ?, flightId = ?, seatNumber = ?, bookedDate = ? WHERE id = ?";
        try ( PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, ticket.getUsername());
            preparedStatement.setInt(2, ticket.getFlightId());
            preparedStatement.setInt(3, ticket.getSeatNumber());
            preparedStatement.setDate(4, new Date(ticket.getBookedDate().getTime())); // Convert Date to java.sql.Date
            preparedStatement.setInt(5, ticket.getId());
            preparedStatement.executeUpdate();
            return true;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
    }

    public void deleteTicket(int ticketId) {
        String query = "DELETE FROM ticket WHERE id = ?";
        try ( PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, ticketId);
            preparedStatement.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public List<Ticket> getBookedTicketsByUsername(String username) {
        List<Ticket> tickets = new ArrayList<>();
        String query = "SELECT\n"
                + "    [dbo].[ticket].[id],\n"
                + "    [dbo].[ticket].[flightId],\n"
                + "    [dbo].[ticket].[seatNumber],\n"
                + "    [dbo].[ticket].[bookedDate], [seatNumber]\n"
                + "FROM\n"
                + "    [dbo].[ticket]\n"
                + "WHERE\n"
                + "    [dbo].[ticket].[username] = '" + username + "'";
        try ( PreparedStatement preparedStatement = connection.prepareStatement(query);  ResultSet resultSet = preparedStatement.executeQuery()) {

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                int FlightId = resultSet.getInt("flightId");
                int seatNumber = resultSet.getInt("seatNumber");
                Date bookedDate = resultSet.getDate("bookedDate"); // Retrieve the booking date

                Ticket ticket = new Ticket();
                ticket.setId(id);
                ticket.setUsername(username);
                ticket.setFlightId(FlightId);
                ticket.setSeatNumber(seatNumber);
                ticket.setBookedDate(bookedDate); // Set the booking date
             
                tickets.add(ticket);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return tickets;
    }
    
    public int getseatNumber(int FlightId) {
        int seatbooked = 0;
//        java.util.Date date = new java.util.Date();
//        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        String query = "select sum(seatNumber) as TotalSeatNumber from ticket where FlightId = ?  "; //  and bookedDate =  + format.format(date).toString(); 
        try ( PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, FlightId);

            try ( ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    seatbooked = resultSet.getInt("TotalSeatNumber");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return seatbooked;
    }
    
    

    public int getTotalTicketsByFlightId1(int FlightId) {
        int ticket = 0;
//        java.util.Date date = new java.util.Date();
//        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        String query = "sELECT seats FROM Flight WHERE id= ?  "; //  and bookedDate =  + format.format(date).toString(); 
        try ( PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, FlightId);

            try ( ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    ticket = resultSet.getInt("seats");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return ticket;
    }
    
    
    
    
    public int getTotalTicketsByFlightId(int FlightId) {
        int totalTickets = 0;
//        java.util.Date date = new java.util.Date();
//        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        String query = "SELECT COUNT(*) AS total FROM ticket WHERE flightId = ?  "; //  and bookedDate =  + format.format(date).toString(); 
        try ( PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, FlightId);

            try ( ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    totalTickets = resultSet.getInt("total");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return totalTickets;
    }
    
    public static void main(String[] args) {
        java.util.Date date = new java.util.Date();
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        System.out.println(format.format(date).toString());
    }

}
