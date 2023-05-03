package service;

import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

public class Service extends HttpServlet {
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.addHeader("Access-Control-Allow-Origin", "*");
		response.addHeader("Access-Control-Allow-Methods", "GET, POST, PUT, DELETE, OPTIONS");
		response.addHeader("Access-Control-Allow-Headers", "Content-Type, Authorization");

		String contractParam = request.getParameter("contractParam");
		System.out.println(contractParam);

		Manager manager = new Manager();
		JSONArray jsonContractData = manager.getJSONContractData(contractParam);

		JSONObject jsonResponse = new JSONObject();
		jsonResponse.put("contractData", jsonContractData);

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(jsonResponse.toJSONString());
	}
}
