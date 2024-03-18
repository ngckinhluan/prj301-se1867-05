package dao;

import dal.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Flight;

public class FlightDAO extends DBContext {

    public FlightDAO() {
        super();
    }

    public void createFlight(Flight Flight) {
        String query = "INSERT INTO Flight (seats, departureTime, source, destination, arrivalTime) "
                + "VALUES (?, ?, ?, ?, ?)";
        try ( PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, Flight.getSeats());
            preparedStatement.setString(2, Flight.getDepartureTime());
            preparedStatement.setString(3, Flight.getSource());
            preparedStatement.setString(4, Flight.getDestination());
            preparedStatement.setString(5, Flight.getArrivalTime());
            preparedStatement.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public List<Flight> getAllHomeFlightes() {
        List<Flight> Flightes = new ArrayList<>();
        String query = "SELECT\n"
                + "    [dbo].[Flight].[id],\n"
                + "    [dbo].[Flight].[seats] - COALESCE(SUM(CASE WHEN CAST([dbo].[ticket].[bookedDate] AS DATE) = CAST(GETDATE() AS DATE) THEN [dbo].[ticket].[seatNumber] END), 0) AS seats,\n"
                + "    [dbo].[Flight].[departureTime],\n"
                + "    [dbo].[Flight].[source],\n"
                + "    [dbo].[Flight].[destination],\n"
                + "    [dbo].[Flight].[arrivalTime]\n"
                + "FROM\n"
                + "    [dbo].[Flight]\n"
                + "LEFT JOIN\n"
                + "    [dbo].[ticket]\n"
                + "ON\n"
                + "    [dbo].[Flight].[id] = [dbo].[ticket].[flightId]\n"
                + "GROUP BY\n"
                + "    [dbo].[Flight].[id],\n"
                + "    [dbo].[Flight].[seats],\n"
                + "    [dbo].[Flight].[departureTime],\n"
                + "    [dbo].[Flight].[source],\n"
                + "    [dbo].[Flight].[destination],\n"
                + "    [dbo].[Flight].[arrivalTime]\n"
                + "ORDER BY\n"
                + "    [dbo].[Flight].[id];";
        try ( PreparedStatement preparedStatement = connection.prepareStatement(query);  ResultSet resultSet = preparedStatement.executeQuery()) {
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                int seats = resultSet.getInt("seats");
                String departureTime = resultSet.getString("departureTime");
                String source = resultSet.getString("source");
                String destination = resultSet.getString("destination");
                String arrivalTime = resultSet.getString("arrivalTime");

                Flight Flight = new Flight(id, seats, departureTime, source, destination, arrivalTime);
                Flightes.add(Flight);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return Flightes;
    }

    public List<Flight> getAllFlightes() {
        List<Flight> Flightes = new ArrayList<>();
        String query = "SELECT * FROM Flight";
        try ( PreparedStatement preparedStatement = connection.prepareStatement(query);  ResultSet resultSet = preparedStatement.executeQuery()) {
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                int seats = resultSet.getInt("seats");
                String departureTime = resultSet.getString("departureTime");
                String source = resultSet.getString("source");
                String destination = resultSet.getString("destination");
                String arrivalTime = resultSet.getString("arrivalTime");

                Flight Flight = new Flight(id, seats, departureTime, source, destination, arrivalTime);
                Flightes.add(Flight);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return Flightes;
    }

    public Flight getFlightById(String FlightId) {
        Flight Flight = null;
        String query = "SELECT * FROM Flight WHERE id = ?";
        try ( PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, FlightId);
            try ( ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    int id = resultSet.getInt("id");
                    int seats = resultSet.getInt("seats");
                    String departureTime = resultSet.getString("departureTime");
                    String source = resultSet.getString("source");
                    String destination = resultSet.getString("destination");
                    String arrivalTime = resultSet.getString("arrivalTime");

                    Flight = new Flight(id, seats, departureTime, source, destination, arrivalTime);
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return Flight;
    }

    public void updateFlight(Flight Flight) {
        String query = "UPDATE Flight SET seats = ?, departureTime = ?, source = ?, destination = ?, arrivalTime = ? WHERE id = ?";
        try ( PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, Flight.getSeats());
            preparedStatement.setString(2, Flight.getDepartureTime());
            preparedStatement.setString(3, Flight.getSource());
            preparedStatement.setString(4, Flight.getDestination());
            preparedStatement.setString(5, Flight.getArrivalTime());
            preparedStatement.setInt(6, Flight.getId());
            preparedStatement.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public void deleteFlight(int FlightId) {
        String query = "DELETE FROM Flight WHERE id = ?";
        try ( PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, FlightId);
            preparedStatement.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
}
