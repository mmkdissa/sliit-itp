package com.sms.manager;

import java.util.ArrayList;
import java.util.List;

import com.sms.bean.Student;

public class DatabaseManager {
	//TODO remove this and need to persist data on db
	private List<Student> database = new ArrayList<Student>();
	//temporary solution to give id for student
	private  static int index =0;

	//TODO code should be modified to add student infor in to database
	public void addStudent(Student student) {
		student.setId(index++);
		database.add(student);
		System.out.println("Student Added Successfully");
	}
	
	public List<Student> getStudents(){
		return database;
	}
	
	public void removeStudent(int id){
		database.remove(this.getStudentIndexById(id));
	}

	private int getStudentIndexById(int id) {
		int count = 0;
		for(Student student : database){
			if(student.getId() == id){
				return count; 
			}
			count ++;
		}
		return -1;
	}

}
