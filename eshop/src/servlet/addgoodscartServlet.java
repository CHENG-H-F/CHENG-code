package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.goodsDao;
import entity.goods;

/**
 * Servlet implementation class addgoodscartServlet
 */
@WebServlet("/addgoodscartServlet")
public class addgoodscartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addgoodscartServlet() {
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
		HttpSession session = request.getSession();
		String goods_id = request.getParameter("goods_id");
		goodsDao goodsdao = new goodsDao();
		goods g = new goods();
		g = goodsdao.getonegoods(goods_id);
		List<goods> list1 = new ArrayList<goods>();
		list1 = (List<goods>)session.getAttribute("cart");
		list1.add(g);
		session.setAttribute("cart",list1);
	}

}
