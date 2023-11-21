package getBookings;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *  implementation class bookingsTable
 */
public class bookingsTable extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public bookingsTable() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://172.187.178.153:3306/isec_assessment2?useSSL=false", "isec", "EUHHaYAmtzbv");
			PreparedStatement pst = conn.prepareStatement("SELECT * FROM vehicle_service WHERE username = ?");
			
			ResultSet resultSet = pst.executeQuery();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	


}
