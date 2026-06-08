package entity;

import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class Todo {
	private int todo_id;
	private String title;
	private String detail;
	private String status;
	private LocalDate due_date;

	public Todo(String title, String detail, String status, LocalDate due_date) {
		this.title = title;
		this.detail = detail;
		this.status = status;
		this.due_date = due_date;
	}

}
