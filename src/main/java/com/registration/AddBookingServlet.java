package com.registration;

import jakarta.servlet.DispatcherType;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.ObjectInputFilter.Status;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Servlet implementation class AddBookingServlet
 */
@WebServlet("/BkingServlet")
public class AddBookingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String contact = request.getParameter("contact");
        String mileageStr = request.getParameter("mileage");
        String vehicle_no = request.getParameter("vehicle_no");
        String location = request.getParameter("location");
        String message = request.getParameter("message");
        String dateStr = request.getParameter("date");
        String selectedTimeValue = request.getParameter("selectedTime");

        int mileage = Integer.parseInt(mileageStr);

              
        Connection con = null;
        RequestDispatcher dispatcher = null;
        
        

        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd"); 
        SimpleDateFormat timeFormat = new SimpleDateFormat("hh:mm:ss");
        
        
        
        Time newTime = null;
        try {
            Date parsedTime = timeFormat.parse(selectedTimeValue);
            newTime = new Time(parsedTime.getTime());
        } catch (ParseException e) {
            e.printStackTrace();
        }
        
        
        
        Date date = null;
        try {
            date = dateFormat.parse(dateStr);
            java.sql.Date sqlDate = new java.sql.Date(date.getTime());

            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://51.132.137.223:3306/isec_assessment2?useSSL=false", "isec", "EUHHaYAmtzbv");
            PreparedStatement pst = con.prepareStatement("INSERT INTO vehicle_service(date, time, location, vehicle_no, mileage, message, username) VALUES (?, ?, ?, ?, ?, ?, ?)");

            pst.setDate(1, sqlDate); 
            pst.setTime(2, newTime);
            pst.setString(3, location);
            pst.setString(4, vehicle_no);
            pst.setInt(5, mileage);
            pst.setString(6, message);
            pst.setString(7, username);

            int rowCount = pst.executeUpdate();
            dispatcher = request.getRequestDispatcher("index.jsp");

            if (rowCount > 0) {
                request.setAttribute("status", "success");
            } else {
                request.setAttribute("status", "failed");
            }
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		
	}
}
