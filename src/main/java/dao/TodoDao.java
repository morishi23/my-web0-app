package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import entity.Todo;
import utils.DbUtil;

public class TodoDao {
	public ArrayList<Todo> findAll() throws SQLException {
		String sql = "select * from todos order by todo_id;";

		ArrayList<Todo> result = new ArrayList<Todo>();

		try (Connection conn = DbUtil.open();//utilで表示
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(sql)) {

			while (rs.next()) {
				
				Todo a = new Todo(rs.getInt("todo_id"), rs.getString("title"), rs.getString("detail"),
						rs.getString("status"), rs.getDate("due_date").toLocalDate());
				result.add(a);
			}
		}

		return result;
	}
	public int create(Todo todo) throws SQLException {
		System.out.println("DAO");
		String sql = "INSERT INTO todos (title,detail,status, due_date) VALUES (?,?,?,?);";
 
		int id = 0;
 
		try (Connection conn = DbUtil.open();
				PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);) {
			stmt.setString(1, todo.getTitle());
			stmt.setString(2, todo.getDetail());
			stmt.setString(3, todo.getStatus());
			stmt.setDate(4, Date.valueOf(todo.getDue_date()));
			int affectedRows = stmt.executeUpdate();
 
			if (affectedRows > 0) {
				try (ResultSet rs = stmt.getGeneratedKeys()) {
					if (rs.next()) {
						id = rs.getInt(1); // Retrieves the inserted ID
					}
				}
			}
		}
		return id;
	}
	public ArrayList<Todo> findByKeyword(String keyword) throws SQLException {
		String sql = "select * from todos where title like ? or detail like ?";

		ArrayList<Todo> result = new ArrayList<Todo>();

		try (Connection conn = DbUtil.open();
				PreparedStatement stmt = conn.prepareStatement(sql);) {
			stmt.setString(1, "%" + keyword + "%");
			stmt.setString(2, "%" + keyword + "%");
			
			try (ResultSet rs = stmt.executeQuery()){
				while (rs.next()) {
					Todo a = new Todo(rs.getInt("todo_id"), rs.getString("title"), rs.getString("detail"), rs.getString("status"),
							rs.getDate("due_date").toLocalDate());
					result.add(a);
				}
			}
		} 

		return result;
	}
	public ArrayList<Todo> Filter(String status) throws SQLException {
		String sql = "select * from todos where status like ?";
		ArrayList<Todo> result = new ArrayList<Todo>();

		try (Connection conn = DbUtil.open();
				PreparedStatement stmt = conn.prepareStatement(sql);) {
			stmt.setString(1, "%" + status + "%");
			try (ResultSet rs = stmt.executeQuery()){
				while (rs.next()) {
					Todo a = new Todo(rs.getInt("todo_id"), rs.getString("title"), rs.getString("detail"), rs.getString("status"),
							rs.getDate("due_date").toLocalDate());
					result.add(a);
				}
			}
		} return result;
		}

}
