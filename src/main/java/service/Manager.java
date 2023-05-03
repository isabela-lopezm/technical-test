package service;

import java.util.ArrayList;
import org.json.simple.*;

public class Manager {

	public JSONArray getJSONContractData(String input) {

		DAO dao = new DAO();
		ArrayList<String[]> contractData = dao.getContractData(input);
		JSONArray jsonContractData = new JSONArray();

		for (String[] contract : contractData) {
			JSONObject jsonContract = new JSONObject();
			jsonContract.put("code", contract[0]);
			jsonContract.put("address", contract[1]);
			jsonContract.put("full_name", contract[2]);
			jsonContract.put("role", contract[3]);
			jsonContractData.add(jsonContract);
		}
		
		return jsonContractData;
	}
}
