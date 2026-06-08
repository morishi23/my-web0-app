package controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import service.TodoSevice;

/**
 * Servlet implementation class TodoCreate
 */
@WebServlet("/TodoCreate")
public class TodoCreate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TodoCreate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/todo_create.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		TodoSevice es = new TodoSevice();
		System.out.println("サーブレット");
		String t = request.getParameter("title");
	    String d = request.getParameter("detail");
	    String s = request.getParameter("status");
	    String date =request.getParameter("due_date");
	    
	    es.addTodo(t, d, s, date);
		response.sendRedirect("TodoList");
	}

}
