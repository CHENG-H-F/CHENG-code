package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.OrderDao;
import dao.UserDao;
import dao.noticeDao;
import dao.goodsDao;
import dao.shopDao;
import entity.Order;
import entity.notice;
import entity.goods;
import entity.shop;

public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public loginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//获取登录信息
		
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        HttpSession session = request.getSession();
        
        UserDao userDao = new UserDao();
        if (UserDao.login(username, password))
        {        		
        		//向session域中放置用户信息
            	session.setAttribute("username", username); 
            	session.setAttribute("password", password); 
//            	response.setContentType("text/html;charset=UTF-8");
//            	PrintWriter pw=response.getWriter();
//                pw.write("<script language='javascript'>alert('登陆成功！');</script>");
//                pw.close();
            	noticeDao noticedao = new noticeDao();
            	List<notice> list = new ArrayList<notice>();
            	list = noticedao.getAllpassnotice();
            	session.setAttribute("notice", list);
            	
            	noticeDao noticedao1 = new noticeDao();
            	List<notice> list4 = new ArrayList<notice>();
            	list4 = noticedao.getAllpassnotice(username);
            	session.setAttribute("notice1", list4);
//            	OrderDao orderdao = new OrderDao();
//            	List<Order> list1 = new ArrayList<Order>();
//            	list1 = orderdao.getAllOrder(username);
//            	request.setAttribute("order", list1);
            	
            	goodsDao goodsdao = new goodsDao();
            	List<goods> list2 = new ArrayList<goods>();
            	list2 = goodsdao.getAllgoods();
            	session.setAttribute("goods", list2);
            	
            	shopDao shopdao = new shopDao();
            	List<shop> list3 = new ArrayList<shop>();
            	list3 = shopdao.getAllshop();
            	session.setAttribute("shop", list3);
            	
            	List<goods> list1 = new ArrayList<goods>();
            	session.setAttribute("cart", list1);
            	
            	
            	UserDao userdao = new UserDao();
            	String url = userdao.geturl(username);
            	session.setAttribute("photo_url", url);
            	
                if(userDao.getgrade(username) == 2) {                	
       
                	request.getRequestDispatcher("/china.jsp").forward(request,response);
                }
                else if(userDao.getgrade(username) == 1) {
                	request.getRequestDispatcher("/eshophome.jsp").forward(request,response);

                }
                else {
                	
                	request.getRequestDispatcher("/admin.jsp").forward(request,response);
                }            	
        }
        else
        {
        	response.setContentType("text/html;charset=UTF-8");
        	PrintWriter pw=response.getWriter();
            pw.write("<script language='javascript'>alert('登陆失败！');</script>");
            pw.close();
        }
	}
    
}
