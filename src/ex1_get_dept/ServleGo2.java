package ex1_get_dept;

import com.google.gson.JsonArray;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/servlet_gson.bo")
public class ServleGo2 extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        VO vo = new VO();
        vo.setName(request.getParameter("name"));
        vo.setPrice(Integer.parseInt(request.getParameter("price")));
        vo.setMaker(request.getParameter("maker"));
        DAO dao = new DAO();
        int result = dao.insert(vo);
        if(result == 1) {
            System.out.println("삽입성공");
        }
        else {
            System.out.println("삽입 실패");
        }

        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DAO dao = new DAO();
        JsonArray array = dao.getList();
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        out.println(array);
        System.out.println(array);
    }
}
