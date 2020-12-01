package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
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



import entity.goods;
import dao.PhotoDao;
import dao.goodsDao;

/**
 * Servlet implementation class goodsServlet
 */
@WebServlet("/goodsServlet")
public class goodsServlet extends HttpServlet {
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
		
		List<String> list=new ArrayList<String>();
        String filename=PhotoDao.getPhotoNewName();
        ServletContext servletContext=null;
        servletContext=request.getSession().getServletContext();
       
        //数据库中存储格式:/webTest/imgs/***.jpg
        //第一步:获取页面上上传的图片资源
        List<FileItem> items=PhotoDao.getRequsetFileItems(request,servletContext);
        boolean isLoadToSQL=false;
        String goods_id = null;
        String goods_classify = null;
        String goods_title = null;
        float goods_price = 0;
        for(FileItem item:items) {
            if(!item.isFormField()){
                //判断后缀名是否是jpg
                if(PhotoDao.isGif(item)) {
                    isLoadToSQL=PhotoDao.saveFile(item,filename);
                }else {
                    System.out.println("后缀格式有误，保存文件失败");
                }
            }else {
            	if(item.getFieldName().equals("goods_id"))
	       		{
            		goods_id = item.getString("UTF-8");
		       	}
	       		else if(item.getFieldName().equals("goods_classify"))
	       		{
	       			goods_classify = item.getString("UTF-8");
		       	}
	       		else if(item.getFieldName().equals("goods_title"))
	       		{
	       		    goods_title = item.getString("UTF-8");
		        }else {
		        	goods_price = Float.parseFloat(item.getString("UTF-8"));
		        }           	
            }
        }
        //存在数据库里面的照片路径是在项目里的相对路径
        String finalPhotoName= "resources/img/"+filename;
        goods g = new goods(goods_id,goods_classify,goods_title,goods_price,finalPhotoName);
        boolean bol=goodsDao.addgoods(g);
        if(true) {
            if(bol) {
            	response.setContentType("text/html;charset=UTF-8");
            	PrintWriter pw = response.getWriter();
                pw.write("<script language='javascript'>alert('添加成功！');</script>");
                pw.close();
            }else {
            	response.setContentType("text/html;charset=UTF-8");
            	PrintWriter pw = response.getWriter();
                pw.write("<script language='javascript'>alert('添加失败！');</script>");
                pw.close();
            }
        }
	}

}
