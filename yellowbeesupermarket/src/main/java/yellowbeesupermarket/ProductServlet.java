package yellowbeesupermarket;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet("/ProductServlet")
public class ProductServlet extends HttpServlet {
	String page="pro.jsp";
private static final long serialVersionUID = 1L;// List<Product1> productList = new ArrayList<>();
    
@SuppressWarnings("unused")
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    response.setCharacterEncoding("UTF-8");
    List<Object> dataList = new ArrayList<Object>();

    PreparedStatement p = null;
         ResultSet rs = null;
                 try {
            Class.forName("com.mysql.jdbc.Driver");  
            Connection con=DriverManager.getConnection(  
            		"jdbc:mysql://localhost/yellowbees","root","");
            String sql=("SELECT pcode, pname, type, rate FROM product");
            Statement s= con.createStatement();
            s.executeQuery(sql);
    		rs=s.getResultSet();
             while (rs.next()) {   
            	 dataList.add(rs.getString("pcode"));
     			dataList.add(rs.getString("pname"));
     			dataList.add(rs.getString("type"));
     			dataList.add(rs.getString("rate"));
            //Statement stmt = con.createStatement();
            //ResultSet rs = stmt.executeQuery("select pcode, pname, type, rate from product");
            //while (rs.next()) {
             //   Product1 product = new Product1(rs.getString("pcode"), rs.getString("pname"), rs.getString("type"), rs.getDouble("rate"));
             //   productList.add(product);
            }
            rs.close();
            s.close();
            // Set the result in request attribute
        }
        catch (Exception e) {
             throw new ServletException(e);
         }
                 
            request.setAttribute("data",dataList);
            
            // Forward the request to second.jsp
           // RequestDispatcher rd = request.getRequestDispatcher(page);
           // rd.forward(request, response);
           // if(rd !=null) {
            //	rd.forward(request, response);	
            }

           
    }

//}


