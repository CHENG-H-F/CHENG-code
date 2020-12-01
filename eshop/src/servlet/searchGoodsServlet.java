package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import java.util.List;

import dao.goodsDao;
import entity.goods;

public class searchGoodsServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public searchGoodsServlet() {
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
		String goods_title = request.getParameter("goods_title");
		goodsDao goodsdao = new goodsDao();
		
    	List<goods> list = new ArrayList<goods>();
		list = goodsdao.fuzzyQuery(goods_title);
		String carJson = JSON.toJSONString(list);
		response.getWriter().append(carJson);
		
		
        
	}

}
