package com.deleteBookings;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

/**
 * Servlet implementation class DeleteBookingServlet
 */


@WebServlet("/DltBookingServlet")
public class DeleteBookingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteBookingServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		 String bookingId = request.getParameter("booking_id");
	        String driver = "com.mysql.cj.jdbc.Driver";
	        String connectionUrl = "jdbc:mysql://51.132.137.223:3306/isec_assessment2";
	        String userid = "isec";
	        String password = "EUHHaYAmtzbv";

	        try {
	            Class.forName(driver);
	            Connection connection = DriverManager.getConnection(connectionUrl, userid, password);
	            String sql = "DELETE FROM vehicle_service WHERE booking_id = ?";
	            PreparedStatement preparedStatement = connection.prepareStatement(sql);
	            preparedStatement.setString(1, bookingId);
	            preparedStatement.executeUpdate();
	            preparedStatement.close();
	            connection.close();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	        // Redirect back to the same page or any other page as needed
	        response.sendRedirect(request.getContextPath() + "/index.jsp");
	}

}