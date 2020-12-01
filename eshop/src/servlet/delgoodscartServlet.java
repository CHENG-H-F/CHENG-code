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
 * Servlet implementation class delgoodscartServlet
 */
@WebServlet("/delgoodscartServlet")
public class delgoodscartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public delgoodscartServlet() {
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
		goodsDao goodsdao = new goodsDao();
		goods g = new goods();
		String goods_id = request.getParameter("goods_id");
		g = goodsdao.getonegoods(goods_id);
		List<goods> list1 = new ArrayList<goods>();
		list1 = (List<goods>)session.getAttribute("cart");
		list1.remove(g);
		session.setAttribute("cart",list1);
	}

}
