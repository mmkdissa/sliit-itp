package com.sms.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sms.bean.Student;
import com.sms.manager.DatabaseManager;

/**
 * Servlet implementation class StudentServlet
 */
@WebServlet("/StudentServlet")
public class StudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DatabaseManager databaseManager;

    /**
     * Default constructor. 
     */
    public StudentServlet() {
        // TODO Auto-generated constructor stub
    }

	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		super.init();
		databaseManager = new DatabaseManager(); 
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String view = request.getParameter("view");
		if("all".equals(view)){
			List<Student> students = databaseManager.getStudents();
			request.setAttribute("data", students);
			request.getRequestDispatcher("/WEB-INF/students.jsp").forward(request, response);
		}else{
			request.getRequestDispatcher("/WEB-INF/addstudent.jsp").forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Student student = this.getStudentFromRequest(request);
        databaseManager.addStudent(student);
        response.sendRedirect("/StudentMS/StudentServlet?view=all");
        
	}
	
	private Student getStudentFromRequest(HttpServletRequest request){
		Student student = new Student();
		student.setFirstName(request.getParameter("firstName"));
		student.setLastName(request.getParameter("lastName"));
		student.setAddress(request.getParameter("address"));
		student.setPhone(request.getParameter("phone"));		
		
		return student;
	}

}
