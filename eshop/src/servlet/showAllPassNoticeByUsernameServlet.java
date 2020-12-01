package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import java.util.List;

import dao.noticeDao;
import entity.notice;



public class showAllPassNoticeByUsernameServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public showAllPassNoticeByUsernameServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
    	response.setHeader("Content-type","text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
		doPost(request,response);
    } 
    

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
    	response.setHeader("Content-type","text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
		//获取jsp页面传过来的参数
		String username =(String)request.getSession().getAttribute("username");
		// 获取json字符串
		
		noticeDao noticedao = new noticeDao();
    	List<notice> list = new ArrayList<notice>();
    	list = noticedao.getAllpassnotice(username);
		 //String carJson = personalDao.getJsonStr(user);
		String carJson = JSON.toJSONString(list);
		// response.getWriter().write(carJson);
		response.getWriter().append(carJson);
		// 更新个人信息
		
		
        
	}

}
