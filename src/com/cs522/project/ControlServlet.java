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
		/*StringBuilder sb = new StringBuilder();
	    BufferedReader br = request.getReader();
	    String str;
	    while( (str = br.readLine()) != null ){
	        sb.append(str);
	    }    
	    JSONObject jObj = new JSONObject(sb.toString());
	    Iterator<String> it = jObj.keys(); //gets all the keys

	    while(it.hasNext())
	    {
	        String key = (String) it.next(); // get key
	        Object o = jObj.get(key); // get value
	        System.out.println(key + " : " +  o); // print the key and value
	    }*/
	    //TODO : We need to save these values in the database, call a database function here
	    
	    String param = request.getParameter("getJson");
	    if(param.equalsIgnoreCase("true")){
	    	//TODO : function which calls the db to fetch the rectangle values
	    }
	    
	    Map<String,Rectangle> rectList = new HashMap<String,Rectangle>();
	    
	    Rectangle rect = new Rectangle();
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
	    rectList.put("rectangle2",rect);
	    
	    JSONObject json = new JSONObject();
	    json.accumulate("rectangles",rectList);
	    
	    
	    
	    System.out.println(json.toString());
	    //response.setContentType("application/json");
	    response.getWriter().write(json.toString());
	    //request.getRequestDispatcher("dataCollection.jsp").forward(request, response);
	}
	
	

}
