import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@javax.servlet.annotation.WebServlet(name = "CustomerServlet" , value = "/customer")
public class CustomerServlet extends javax.servlet.http.HttpServlet {
    private static List<Customer> customerList = new ArrayList<>();
    static {
        customerList.add(new Customer("Mai Văn Hoàn","1983-08-20","Hà Nội","https://tse1.mm.bing.net/th?id=OIP.0pgyUCIOys-Liq86dJ7YFAHaJQ&pid=Api&rs=1&c=1&qlt=95&w=94&h=117"));
        customerList.add(new Customer("Mai Văn Hoàn","1983-08-20","Hà Nội","https://tse1.mm.bing.net/th?id=OIP.0pgyUCIOys-Liq86dJ7YFAHaJQ&pid=Api&rs=1&c=1&qlt=95&w=94&h=117"));
        customerList.add(new Customer("Mai Văn Hoàn","1983-08-20","Hà Nội","https://tse1.mm.bing.net/th?id=OIP.0pgyUCIOys-Liq86dJ7YFAHaJQ&pid=Api&rs=1&c=1&qlt=95&w=94&h=117"));
        customerList.add(new Customer("Mai Văn Hoàn","1983-08-20","Hà Nội","https://tse1.mm.bing.net/th?id=OIP.0pgyUCIOys-Liq86dJ7YFAHaJQ&pid=Api&rs=1&c=1&qlt=95&w=94&h=117"));
    }
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {

    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        request.setAttribute("customerList",customerList);
        request.getRequestDispatcher("list.jsp").forward(request,response);
    }
}
