package servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.OrderDao;
import entity.Order;
/**
 * Servlet implementation class ordergoodsServlet
 */
@WebServlet("/ordergoodsServlet")
public class ordergoodsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ordergoodsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String order_title = request.getParameter("goods_title");
		int order_num = Integer.parseInt(request.getParameter("goods_num"));
		String order_goods = order_title + "*" + order_num + ";"; 
				
		float order_price = Float.parseFloat(request.getParameter("goods_price"));
		Date now = new Date();  
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");//可以方便地修改日期格式 
		String order_time = dateFormat.format( now );
		String order_id = "002";
		 
		HttpSession session = request.getSession();
		String order_username = (String)session.getAttribute("username");
		Order o = new Order(order_id,order_goods,order_price,order_time,order_username);
		OrderDao orderdao = new OrderDao();
		orderdao.ordergoods(o);
	}

}
