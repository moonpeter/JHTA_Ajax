package ex1_get_dept;

import com.google.gson.JsonArray;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/dept_lib")
public class DeptGet_lib  extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("여기는 서버");
        DAO dao = new DAO();
        JsonArray array = dao.getList_lib();
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        out.print(array);
        System.out.println(array);
    }
}
