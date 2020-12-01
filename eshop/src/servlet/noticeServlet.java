package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.*;
import java.text.SimpleDateFormat;

import entity.notice;
import dao.noticeDao;
/**
 * Servlet implementation class noticeServlet
 */
@WebServlet("/noticeServlet")
public class noticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
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
		
		
		String notice_id = request.getParameter("notice_id");
		String title = new String(request.getParameter("title").getBytes("iso-8859-1"),"utf-8");
		String content = new String(request.getParameter("content").getBytes("iso-8859-1"),"utf-8");
		String username =(String)request.getSession().getAttribute("username");
		notice n = new notice();
		n.setNotice_title(title);
		n.setNotice_content(content);
		n.setNotice_id(notice_id);
		Date now = new Date();  
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");//可以方便地修改日期格式 
		String notice_time = dateFormat.format( now );
		n.setNotice_time(notice_time);
		n.setUsername(username);
		noticeDao noticedao = new noticeDao();
		if(noticedao.addnotice(n))
        {
        	response.setContentType("text/html;charset=UTF-8");
        	PrintWriter pw = response.getWriter();
            pw.write("<script language='javascript'>alert('添加成功！');</script>");
            pw.close();
        }
        else
        {
        	response.setContentType("text/html;charset=UTF-8");
        	PrintWriter pw = response.getWriter();
            pw.write("<script language='javascript'>alert('添加失败！');</script>");
            pw.close();
        }
		

	}

}
