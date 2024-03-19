package controller;

import dao.FlightDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Flight;

@WebServlet(name = "FlightController", urlPatterns = {"/FlightController", "/AdminFlight"})
public class FlightController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession(false);
            if (session == null || session.getAttribute("user") == null) {
                response.sendRedirect("home");
                return;
            }
        if (action == null) {
            // Default action if 'action' parameter is not provided
            action = "list";
        }

        switch (action) {
            case "list":
                listFlightes(request, response);
                break;
            case "add":
                showAddFlightForm(request, response);
                break;
            case "detail":
                showFlightDetail(request, response);
                break;
            case "update":
                showUpdateFlightForm(request, response);
                break;
            case "delete":
                deleteFlight(request, response);
                break;
            default:
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action parameter");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        
        switch (action) {
            case "add":
                addFlight(request, response);
                break;
            case "update":
                updateFlight(request, response);
                break;
            default:
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action parameter");
        }
    }

    // List Flightes (Empty method, provide the actual code here)
    private void listFlightes(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        request.setAttribute("FlightList", new FlightDAO().getAllFlightes());
        
        request.getRequestDispatcher("/admin/AdminFlight.jsp").forward(request, response);
        
    }
    
    // List Flightes (Empty method, provide the actual code here)
    private void listHomeFlightes(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        request.setAttribute("FlightList", new FlightDAO().getAllFlightes());
        
        request.getRequestDispatcher("template.jsp").forward(request, response);
        
    }

    // Show add Flight form (Empty method, provide the actual code here)
    private void showAddFlightForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("action", "add");
        
        request.getRequestDispatcher("/admin/AddEditFlight.jsp").forward(request, response);
    }

    // Show Flight detail (Empty method, provide the actual code here)
    private void showFlightDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    // Show update Flight form (Empty method, provide the actual code here)
    private void showUpdateFlightForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       int id = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("Flight", new FlightDAO().getFlightById(id));
        request.setAttribute("action", "update");
        
        request.getRequestDispatcher("/admin/AddEditFlight.jsp").forward(request, response);
    }

    // Add a Flight (Empty method, provide the actual code here)
    private void addFlight(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        int seats = Integer.parseInt(request.getParameter("seats"));
        String departureTime = request.getParameter("departureTime");
        String source = request.getParameter("source");
        String destination = request.getParameter("destination");
        String arrivalTime = request.getParameter("arrivalTime");

        // Create a Flight object and set its properties
        Flight Flight = new Flight();
        Flight.setSeats(seats);
        Flight.setDepartureTime(departureTime);
        Flight.setSource(source);
        Flight.setDestination(destination);
        Flight.setArrivalTime(arrivalTime);
        
        new FlightDAO().createFlight(Flight);
        
        response.sendRedirect("AdminFlight");
    }

    // Update a Flight (Empty method, provide the actual code here)
    private void updateFlight(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        int id = Integer.parseInt(request.getParameter("id"));
        int seats = Integer.parseInt(request.getParameter("seats"));
        String departureTime = request.getParameter("departureTime");
        String source = request.getParameter("source");
        String destination = request.getParameter("destination");
        String arrivalTime = request.getParameter("arrivalTime");

        // Create a Flight object and set its properties
        Flight Flight = new Flight();
        Flight.setId(id);
        Flight.setSeats(seats);
        Flight.setDepartureTime(departureTime);
        Flight.setSource(source);
        Flight.setDestination(destination);
        Flight.setArrivalTime(arrivalTime);
        
        new FlightDAO().updateFlight(Flight);
        
        response.sendRedirect("AdminFlight");
    }

    // Delete a Flight (Empty method, provide the actual code here)
    private void deleteFlight(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        int id = Integer.parseInt(request.getParameter("id"));
        new FlightDAO().deleteFlight(id);
        
        response.sendRedirect("AdminFlight");
        
    }
}

