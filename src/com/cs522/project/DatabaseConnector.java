/**
 * 
 */
package com.cs522.project;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Smitha
 *
 */
public class DatabaseConnector {
	private Connection connect = null;
	private Statement statement = null;
	private PreparedStatement preparedStatement = null;
	private ResultSet resultSet = null;
	
	final private String host = "localhost";
	final private String user = "root";
	final private String passwd = "Kitty.123";
	
	public void getConnection() throws Exception{
		try{
			Class.forName("com.mysql.jdbc.Driver");
			connect = DriverManager
			          .getConnection("jdbc:mysql://" + host + "/NURSE_WORKFLOW?"
			              + "user=" + user + "&password=" + passwd );
			System.out.println("Connection success");
		}catch(Exception e){
			System.out.println("Connection failed");
		}
	}
	
	public void addDetails(Project project,List<Participant> participants,List<Activity> activities,List<Rectangle> rectList) 
			throws Exception{
	try{
		int projectId = 0;
		int participantId = 0;
		int activityId = 0;
		String sql = "INSERT INTO PROJECT(PROJECT_NAME,PROJECT_DESCRIPTION,LAYOUT_ID_FK) VALUES(?,?,?)";
		preparedStatement = connect.prepareStatement(sql,PreparedStatement.RETURN_GENERATED_KEYS);
		preparedStatement.setString(1, project.getProjectName());
		preparedStatement.setString(2, project.getProjectDesc());
		preparedStatement.setInt(3, project.getLayoutId());
		preparedStatement.executeUpdate();
		resultSet = preparedStatement.getGeneratedKeys();
		if (resultSet != null && resultSet.next()) {
		    projectId = resultSet.getInt(1);
		}
		
		for (Participant participant : participants) {
			sql = "INSERT INTO PARTICIPANT(PARTICIPANT_NAME,PARTICIPANT_DESCRIPTION) VALUES(?,?)";
			preparedStatement = connect.prepareStatement(sql,PreparedStatement.RETURN_GENERATED_KEYS);
			preparedStatement.setString(1, participant.getPartiName());
			preparedStatement.setString(2, participant.getPartiDesc());
			preparedStatement.executeUpdate();
			resultSet = preparedStatement.getGeneratedKeys();
			if (resultSet != null && resultSet.next()) {
			    participantId = resultSet.getInt(1);
			}
			sql = "INSERT INTO PARTICIPANT_REL(PARTICIPANT_ID_FK,PROJECT_ID_FK) VALUES(?,?)";
			preparedStatement = connect.prepareStatement(sql);
			preparedStatement.setInt(1, participantId);
			preparedStatement.setInt(2, projectId);
			preparedStatement.executeUpdate();
		}
		
		for (Activity activity : activities) {
			sql = "INSERT INTO ACTIVITY(ACTIVITY_NAME,ACTIVITY_DESCRIPTION) VALUES(?,?)";
			preparedStatement = connect.prepareStatement(sql,PreparedStatement.RETURN_GENERATED_KEYS);
			preparedStatement.setString(1, activity.getActivityName());
			preparedStatement.setString(2, activity.getActivityDesc());
			preparedStatement.executeUpdate();
			resultSet = preparedStatement.getGeneratedKeys();
			if (resultSet != null && resultSet.next()) {
			    activityId = resultSet.getInt(1);
			}
			sql = "INSERT INTO ACTIVITY_REL(ACTIVITY_ID_FK,PROJECT_ID_FK) VALUES(?,?)";
			preparedStatement = connect.prepareStatement(sql);
			preparedStatement.setInt(1, activityId);
			preparedStatement.setInt(2, projectId);
			preparedStatement.executeUpdate();
		}
		
		for (Rectangle rectangle : rectList){
			sql = "INSERT INTO LAYOUT_LOC_REL(LOCATION_NAME,LAYOUT_ID_FK,PROJECT_ID_FK,LOC_TOP,LOC_LEFT,LOC_HEIGHT,LOC_WIDTH) VALUES(?,?,?,?,?,?,?)";
			preparedStatement = connect.prepareStatement(sql);
			preparedStatement.setString(1, rectangle.getLocation());
			preparedStatement.setInt(2,project.getLayoutId());
			preparedStatement.setInt(3,projectId);
			preparedStatement.setInt(4,rectangle.getTop());
			preparedStatement.setInt(5, rectangle.getLeft());
			preparedStatement.setInt(6,rectangle.getHeight());
			preparedStatement.setInt(7, rectangle.getWidth());
			preparedStatement.executeUpdate();
		}
	}finally {
        if (preparedStatement != null) try { preparedStatement.close(); } catch (SQLException logOrIgnore) {}
        if (connect != null) try { connect.close(); } catch (SQLException logOrIgnore) {}
        if (resultSet != null) try { resultSet.close(); } catch (SQLException logOrIgnore) {}
    }
	}
	
	public List<Project> getAllProjects()throws Exception{
		List<Project> projList = new ArrayList<Project>();
		String sql = "SELECT * FROM PROJECT";
		try{
			statement = connect.createStatement();
			resultSet = statement.executeQuery(sql);
			while(resultSet.next()){
				Project project = new Project();
				project.setProjectId(resultSet.getInt(1));
				project.setProjectName(resultSet.getString(2));
				project.setProjectDesc(resultSet.getString(3));
				project.setLayoutId(resultSet.getInt(4));
				projList.add(project);
			}
		}finally {
	        if (preparedStatement != null) try { preparedStatement.close(); } catch (SQLException logOrIgnore) {}
	        if (connect != null) try { connect.close(); } catch (SQLException logOrIgnore) {}
	        if (resultSet != null) try { resultSet.close(); } catch (SQLException logOrIgnore) {}
	    }
		return projList;
	}
	
	public List<Participant> getProjectParticipants(int projectId)throws Exception{
		List<Participant> partiList = new ArrayList<Participant>();
		String sql = "SELECT PARTICIPANT_ID,PARTICIPANT_NAME "
				+ "FROM PARTICIPANT "
				+ "INNER JOIN PARTICIPANT_REL "
				+ "ON PARTICIPANT.PARTICIPANT_ID = PARTICIPANT_REL.PARTICIPANT_ID_FK "
				+ "WHERE PARTICIPANT_REL.PROJECT_ID_FK = ?";
		try{
			preparedStatement = connect.prepareStatement(sql);
			preparedStatement.setInt(1, projectId);
			resultSet = preparedStatement.executeQuery();
			while(resultSet.next()){
				Participant parti = new Participant();
				parti.setPartiId(resultSet.getInt(1));
				parti.setPartiName(resultSet.getString(2));
				partiList.add(parti);
			}
		}finally {
	        if (preparedStatement != null) try { preparedStatement.close(); } catch (SQLException logOrIgnore) {}
	        if (connect != null) try { connect.close(); } catch (SQLException logOrIgnore) {}
	        if (resultSet != null) try { resultSet.close(); } catch (SQLException logOrIgnore) {}
	    }
		return partiList;
	}
	
	
}
