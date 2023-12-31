package com.registration;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 *  implementation class AddBookingServlet
 */
@WebServlet("/BkingServlet")
public class AddBookingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	

    	 String username = encodeHTML(request.getParameter("username"));
         String contact = encodeHTML(request.getParameter("contact"));
         String mileageStr = encodeHTML(request.getParameter("mileage"));
         String vehicle_no = encodeHTML(request.getParameter("vehicle_no"));
         String location = encodeHTML(request.getParameter("location"));
         String message = encodeHTML(request.getParameter("message"));
         String dateStr = encodeHTML(request.getParameter("date"));
         String selectedTimeValue = encodeHTML(request.getParameter("selectedTime"));

    	


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
            con = DriverManager.getConnection("jdbc:mysql://172.187.178.153:3306/isec_assessment2?useSSL=false", "isec", "EUHHaYAmtzbv");
            
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
	  private String encodeHTML(String input) {
	        return input == null ? "" : input.replaceAll("<", "&lt;").replaceAll(">", "&gt;");
	    }
}
