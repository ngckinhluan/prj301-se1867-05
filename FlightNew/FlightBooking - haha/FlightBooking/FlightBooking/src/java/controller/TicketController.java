package controller;

import dao.FlightDAO;
import dao.TicketDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Date;
import javax.servlet.http.HttpSession;
import model.Ticket;

/**
 *
 * @author anhdu
 */
@WebServlet(name = "TicketController", urlPatterns = {"/TicketController", "/AdminTicket"})
public class TicketController extends HttpServlet {

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
                listTickets(request, response);
                break;
            case "add":
                showAddTicketForm(request, response);
                break;
            case "detail":
                showTicketDetail(request, response);
                break;
            case "update":
                showUpdateTicketForm(request, response);
                break;
            case "delete":
                deleteTicket(request, response);
                break;
            default:
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action parameter");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        switch (action) {
            case "add":
                addTicket(request, response);
                break;
            case "update":
                updateTicket(request, response);
                break;
            default:
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action parameter");
        }
    }

    // List tickets (Empty method, provide the actual code here)
    private void listTickets(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setAttribute("ticketList", new TicketDAO().getAllTickets());

        request.getRequestDispatcher("/admin/AdminTicket.jsp").forward(request, response);

    }

    // Show add ticket form (Empty method, provide the actual code here)
    private void showAddTicketForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    // Show ticket detail (Empty method, provide the actual code here)
    private void showTicketDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    // Show update ticket form (Empty method, provide the actual code here)
    private void showUpdateTicketForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Ticket ticket = new TicketDAO().getTicketById(id);

        if (request.getParameter("error") != null) {
            request.setAttribute("msg", "Update failed!");
        }
        request.setAttribute("FlightList", new FlightDAO().getAllFlightes());
        request.setAttribute("ticket", ticket);
        request.getRequestDispatcher("/admin/AddEditTicket.jsp").forward(request, response);
    }

    // Add a ticket (Empty method, provide the actual code here)
    private void addTicket(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    // Update a ticket (Empty method, provide the actual code here)
    private void updateTicket(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        String username = request.getParameter("username");
        int FlightId = Integer.parseInt(request.getParameter("FlightId"));
        
        int seatNumber = Integer.parseInt(request.getParameter("seatNumber"));
        String dateString = request.getParameter("bookedDate");
        Date bookedDate = null;

        if (dateString != null && !dateString.isEmpty()) {
            try {
                // Parse the string date into a java.sql.Date
                bookedDate = Date.valueOf(dateString);
            } catch (IllegalArgumentException e) {
                e.printStackTrace(); // Handle parsing error if necessary
            }
        }

        if (seatNumber <= new TicketDAO().getTotalTicketsByFlightId1(FlightId)-new TicketDAO().getseatNumber(FlightId)) {

            // Create a Ticket object and set its properties
            Ticket ticket = new Ticket();
            ticket.setId(id);
            ticket.setUsername(username);
            ticket.setFlightId(FlightId);
            ticket.setSeatNumber(seatNumber);
            ticket.setBookedDate(bookedDate);

            if (new TicketDAO().updateTicket(ticket)) {
                response.sendRedirect("AdminTicket");
            } else {
                response.sendRedirect("AdminTicket?action=update&id=" + id + "&error");
            }
        } else {
            response.sendRedirect("AdminTicket");
        }
    }

    // Delete a ticket (Empty method, provide the actual code here)
    private void deleteTicket(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        new TicketDAO().deleteTicket(id);

        response.sendRedirect("AdminTicket");
    }
    
    
   
}
