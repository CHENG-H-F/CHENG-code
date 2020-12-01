package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDao;
import entity.User;

/**
 * Servlet implementation class registServlet
 */
@WebServlet("/registServlet")
public class registServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public registServlet() {
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
		//获取jsp页面传过来的参数
        String username = request.getParameter("username1"); 
        String password = request.getParameter("password1");
        String question;
        if(request.getParameter("question1").equals("1") ){
        	question = "您的生日？";
        }
        else if(request.getParameter("question1").equals("2")) {
        	question = "您父亲的生日？";
        }
        else {
        	question = "您母亲的生日？";
        }
        String answer = request.getParameter("answer1");
        String grade;
        int audit = 1;
        if(request.getParameter("optradio1").equals("1") ){
        	grade = "普通用户";
        }
        else{
        	grade = "超市用户";
        	audit = 0;
        }
        System.out.print(request.getParameter("optradio1"));
        
        //实例化一个对象，组装属性
        User user = new User(); 
        user.setUsername(username);
        user.setPassword(password);
        user.setQuestion(question);
        user.setAnswer(answer);
        user.setGrade(grade);
        user.setAudit(audit);
        user.setPhoto("resources/img/defaultuser1.png");
        
        UserDao userDao = new UserDao();

        if(userDao.regist(user))
        {
        	response.setContentType("text/html;charset=UTF-8");
        	PrintWriter pw = response.getWriter();
            pw.write("<script language='javascript'>alert('注册成功！');</script>");
            pw.close();
        }
        else
        {
        	response.setContentType("text/html;charset=UTF-8");
        	PrintWriter pw = response.getWriter();
            pw.write("<script language='javascript'>alert('注册失败！请更换用户名！');</script>");
            pw.close();
        }
	}

}
