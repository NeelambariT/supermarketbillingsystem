package yellowbeesupermarket;
import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/Y")
public class Y extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        List<Map<String, Object>> dataList = new ArrayList<>();
        
        String sql = "SELECT pcode, pname, type, rate FROM product";
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            //Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/yellowbees","root","");
            PreparedStatement stmt = con.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            
            ResultSetMetaData metaData = rs.getMetaData();
            int columnCount = metaData.getColumnCount();
            
            while (rs.next()) {
            	Map<String, Object> columns = new LinkedHashMap<>();
                for (int i = 1; i <= columnCount; i++) {
                    columns.put(metaData.getColumnLabel(i), rs.getObject(i));
                }
                dataList.add(columns);
            }
            rs.close();
            stmt.close();
            con.close();
        } catch (SQLException sqle) {
            sqle.printStackTrace(); // Log SQL Exceptions
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("{\"error\":\"A database connection error occurred. Check the database connection details.\"}");
            return;
        } catch (ClassNotFoundException cnfe) {
            cnfe.printStackTrace(); // Log ClassNotFound Exceptions
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("{\"error\":\"Database driver class not found. Ensure the driver is correctly included in the project.\"}");
            return;
        }
        
        Type listType = new TypeToken<List<Map<String, Object>>>() {}.getType();
        String json = new Gson().toJson(dataList, listType);
        response.getWriter().write(json);
        
    }
}