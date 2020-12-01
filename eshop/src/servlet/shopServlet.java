package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.shop;
import dao.shopDao;
/**
 * Servlet implementation class shopServlet
 */
@WebServlet("/shopServlet")
public class shopServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public shopServlet() {
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
		request.setCharacterEncoding("UTF-8");
    	response.setHeader("Content-type","text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
		String name = request.getParameter("shop_name");
		String province = request.getParameter("shop_province");
		String city = request.getParameter("shop_city");
		String title = request.getParameter("shop_title");
		String address = request.getParameter("shop_address");
		String tel = request.getParameter("shop_tel");
		String time = request.getParameter("shop_time");
		shop s = new shop();
		s.setShop_name(name);
		s.setShop_province(province);
		s.setShop_city(city);
		s.setShop_title(title);
		s.setshop_address(address);;
		s.setShop_tel(tel);
		s.setShop_time(time);
		shopDao shopdao = new shopDao();
		if(shopdao.addshop(s))
        {
        	response.setContentType("text/html;charset=UTF-8");
        	PrintWriter pw = response.getWriter();
            pw.write("<script language='javascript'>alert('成功！');</script>");
            pw.close();
        }
        else
        {
        	response.setContentType("text/html;charset=UTF-8");
        	PrintWriter pw = response.getWriter();
            pw.write("<script language='javascript'>alert('失败！');</script>");
            pw.close();
        }
		
	}

}
