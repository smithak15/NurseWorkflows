package com.cs522.project;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.*;

/**
 * Servlet implementation class ControlServlet
 */
@WebServlet("/ControlServlet")
public class ControlServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControlServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		doProcess(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
	}

	private void doProcess(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException  {
		// TODO Auto-generated method stub
		
		String requestUri = request.getRequestURI();
		if(requestUri.equalsIgnoreCase("/NurseWorkflows/addProject.do")){
			addProject(request,response);
		}else if(requestUri.equalsIgnoreCase("/NurseWorkflows/addParticipantsAjax.do")){
			addParticipantsAjax(request,response);
		}else if(requestUri.equalsIgnoreCase("/NurseWorkflows/addParticipants.do")){
			addParticipants(request,response);
		}else if(requestUri.equalsIgnoreCase("/NurseWorkflows/addActivitiesAjax.do")){
			addActivitiesAjax(request,response);
		}else if(requestUri.equalsIgnoreCase("/NurseWorkflows/addActivities.do")){
			addActivities(request,response);
		}else if(requestUri.equalsIgnoreCase("/NurseWorkflows/addLocations.do")){
			addLocations(request,response);
		}else{
		
		
	    //TODO : We need to save these values in the database, call a database function here
	    
	    String param = request.getParameter("getJson");
	    if(param.equalsIgnoreCase("true")){
	    	//TODO : function which calls the db to fetch the rectangle values
	    }
	    
	    Map<String,Rectangle> rectList = new HashMap<String,Rectangle>();
	    
	   /* Rectangle rect = new Rectangle();
	    rect.setId("rectangleId_1");
	    rect.setTop(50);
	    rect.setLeft(198);
	    rect.setHeight(86);
	    rect.setWidth(161);
	    
	    rectList.put("rectangle1",rect);
	    
	    rect = new Rectangle();
	    rect.setId("rectangleId_2");
	    rect.setTop(50);
	    rect.setLeft(476);
	    rect.setHeight(82);
	    rect.setWidth(115);
	    rectList.put("rectangle2",rect);*/
	    
	    JSONObject json = new JSONObject();
	    json.accumulate("rectangles",rectList);
	    
	    
	    
	    System.out.println(json.toString());
	    //response.setContentType("application/json");
	    response.getWriter().write(json.toString());
	    //request.getRequestDispatcher("dataCollection.jsp").forward(request, response);
		}
	}
	
	private void addProject(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException  {
		String projName = request.getParameter("projName");
		String projDesc = request.getParameter("projDesc");
		int layoutId = Integer.parseInt(request.getParameter("layoutId"));
		
		HttpSession session = request.getSession(true);
		Project project = new Project(projName,projDesc,layoutId);
		session.setAttribute("project", project);
		request.getRequestDispatcher("addParticipants.jsp").forward(request, response);
	}
	
	@SuppressWarnings("unchecked")
	private void addParticipantsAjax(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException  {
		List<Participant> participants = null;
		HttpSession session = request.getSession();
		if(session != null){
			if(null == session.getAttribute("participants")){
				participants = new ArrayList<Participant>();
			}else{
				participants = (List<Participant>) session.getAttribute("participants");
			}
		}
		
		Participant participant = new Participant();
		participant.setPartiName(request.getParameter("partiName"));
		participant.setPartiDesc(request.getParameter("partiDesc"));
		
		participants.add(participant);
		session.setAttribute("participants", participants);
	}
	
	private void addParticipants(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException  {
		request.getRequestDispatcher("addActivities.jsp").forward(request, response);
	}
	
	@SuppressWarnings("unchecked")
	private void addActivitiesAjax(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException  {
		List<Activity> activities = null;
		HttpSession session = request.getSession();
		if(session != null){
			if(null == session.getAttribute("activities")){
				activities = new ArrayList<Activity>();
			}else{
				activities = (List<Activity>) session.getAttribute("activities");
			}
		}
		
		Activity activity = new Activity();
		activity.setActivityName(request.getParameter("actiName"));
		activity.setActivityDesc(request.getParameter("actiDesc"));
		
		activities.add(activity);
		session.setAttribute("activities", activities);
	}
	
	private void addActivities(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException  {
		request.getRequestDispatcher("addLocations.jsp").forward(request, response);
	}
	
	@SuppressWarnings("unchecked")
	private void addLocations(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException  {
		StringBuilder sb = new StringBuilder();
	    BufferedReader br = request.getReader();
	    String str;
	    Project project = new Project();
	    List<Participant> participants = null;
	    List<Activity> activities = null;
	    while( (str = br.readLine()) != null ){
	        sb.append(str);
	    }    
	    List<Rectangle> rectangles = new ArrayList<Rectangle>();
	    String[] jsonObjects = sb.toString().split(";");
	    for(String s: jsonObjects){
	    	JSONObject jObj = new JSONObject(s);
	    	Iterator<String> it = jObj.keys();
	    	Rectangle rect = new Rectangle();
	    	 while(it.hasNext())
	 	    {
	 	        String key = (String) it.next(); // get key
	 	        Object o = jObj.get(key); // get value
	 	        System.out.println(key + " : " +  o+"\n"); // print the key and value
	 	        
	 	        if(key.equalsIgnoreCase("id")){
	 	        	rect.setId(o.toString());
	 	        }else if(key.equalsIgnoreCase("top")){
	 	        	rect.setTop(Integer.parseInt(o.toString()));
	 	        }else if(key.equalsIgnoreCase("left")){
	 	        	rect.setLeft(Integer.parseInt(o.toString()));
	 	        }else if(key.equalsIgnoreCase("height")){
	 	        	rect.setHeight(Integer.parseInt(o.toString()));
	 	        }else if(key.equalsIgnoreCase("width")){
	 	        	rect.setWidth(Integer.parseInt(o.toString()));
	 	        }
	 	    }
	    	 rectangles.add(rect);
	    }
	   HttpSession session = request.getSession();
	   /* if(session != null){
			session.setAttribute("rectangles", rectangles);
		}*/
		if(null != session.getAttribute("project")){
			project = (Project) session.getAttribute("project");
		}if(null != session.getAttribute("participants")){
			participants = (List<Participant>) session.getAttribute("participants");
		}if(null != session.getAttribute("activities")){
			activities = (List<Activity>) session.getAttribute("activities");
		}
		DatabaseConnector dao = new DatabaseConnector();
		try {
			dao.getConnection();
			dao.addDetails(project, participants, activities, rectangles);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	    JSONObject json = new JSONObject();
	    json.accumulate("success","true");
	    response.getWriter().write(json.toString());
	    /*request.setAttribute("setupProfileSuccess", true);
	    request.getRequestDispatcher("index.jsp").forward(request, response);*/
	}
}
