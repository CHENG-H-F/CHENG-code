package servlet;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;

import com.alibaba.fastjson.JSON;
import com.mysql.cj.Session;

import dao.PhotoDao;
import dao.UserDao;
import dao.personalDao;
import entity.User;



public class updatePersonalServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updatePersonalServlet() {
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
		
		//获取jsp页面传过来的参数
		
		
		List<String> list=new ArrayList<String>();
        String filename=PhotoDao.getPhotoNewName();
        ServletContext servletContext=null;
        servletContext=request.getSession().getServletContext();
       
        //数据库中存储格式:/webTest/imgs/***.jpg
        //第一步:获取页面上上传的图片资源
        List<FileItem> items=PhotoDao.getRequsetFileItems(request,servletContext);
        boolean isLoadToSQL=false;
        String sex = null;
        String tel = null;
        String birthday = null;
        String address = null;
        String email =null;
        for(FileItem item:items) {
            if(!item.isFormField()){
                //判断后缀名是否是jpg
                if(PhotoDao.isGif(item)) {
                    isLoadToSQL=PhotoDao.saveFile(item,filename);
                }else {
                    System.out.println("后缀格式有误，保存文件失败");
                }
            }else {
            	if(item.getFieldName().equals("sex"))
	       		{
            		sex = item.getString("UTF-8");
		       	}
	       		else if(item.getFieldName().equals("tel"))
	       		{
	       			tel = item.getString("UTF-8");
		       	}
	       		else if(item.getFieldName().equals("birthday"))
	       		{
	       		    birthday = item.getString("UTF-8");
		        }
	       		else if(item.getFieldName().equals("address"))
	       		{
	       			address = item.getString("UTF-8");
		        }
	       		else {
	       			email = item.getString("UTF-8");
		        }           	
            }
        }
        //存在数据库里面的照片路径是在项目里的相对路径
        String finalPhotoName= "resources/img/"+filename;
		 
		 
	        request.setCharacterEncoding("UTF-8");
	    	response.setHeader("Content-type","text/html;charset=UTF-8");
	        response.setCharacterEncoding("UTF-8");
		 
	        String username =(String)request.getSession().getAttribute("username");
		 
				
		String[] arr = {
				finalPhotoName,
				sex,
				tel,
				birthday,
				address,
				email
				};
		
		if (personalDao.updatePersonal(arr, username)) {
			response.setContentType("text/html;charset=UTF-8");
        	PrintWriter pw = response.getWriter();
            pw.write("<script language='javascript'>alert('修改成功！');</script>");
            pw.close();
		} else {
			response.setContentType("text/html;charset=UTF-8");
        	PrintWriter pw = response.getWriter();
            pw.write("<script language='javascript'>alert('修改失败！');</script>");
            pw.close();
		}
		// response.getWriter().append(request.getParameter("photo")+request.getParameter("sex")+request.getParameter("tel")+request.getParameter("birthday")+request.getParameter("address")+request.getParameter("email"));
        
        
	}

}
