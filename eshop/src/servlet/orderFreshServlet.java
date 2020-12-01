package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;

import dao.OrderDao;
import entity.Order;

public class orderFreshServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public orderFreshServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("UTF-8");
    	response.setHeader("Content-type","text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
		//获取jsp页面传过来的参数
		String username =(String)request.getSession().getAttribute("username");
		OrderDao orderDao = new OrderDao();
		List<Order> list2 = new ArrayList<Order>();
    	list2 = orderDao.getAllOrder(username);
    	String str = JSON.toJSONString(list2);//用fastjson将list转化为json
    	response.getWriter().append(str);
        
        
	}
}
