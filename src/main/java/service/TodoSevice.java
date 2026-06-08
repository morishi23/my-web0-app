package service;

import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;

import dao.TodoDao;
import entity.Todo;

public class TodoSevice {
	public ArrayList<Todo> getTodo(String keyword, String status) {
		ArrayList<Todo> result = null;
		TodoDao td = new TodoDao();
		try {
			result = (keyword == null)? td.findAll(): td.findByKeyword(keyword);			
		} catch (SQLException se) {
		
			System.out.println("全件取得失敗");
		}
		
		return result;
	}
	

	public void addTodo(String title, String detail, String status, String due_date) {
		System.out.println("サビース");
		LocalDate d =LocalDate.parse(due_date);

		try {
		Todo a = new Todo(title, detail, status, d);
			new TodoDao().create(a);
		} catch (SQLException se) {

		}

	}
}
