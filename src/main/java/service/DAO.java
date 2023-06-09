package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.mysql.cj.jdbc.result.ResultSetMetaData;

public class DAO {
	private Connection connect;
	private ConnectionDB connectDB = new ConnectionDB();

	/**
	 * Execute the SQL statement to get contract information (contract code, address
	 * and contract parts) of the contracts that match the given parameter
	 * 
	 * @param contractParam
	 * @return ArrayList<String[]> with the contract(s) info found
	 */
	public ArrayList<String[]> getContractData(String contractParam) {
		PreparedStatement ps;
		ResultSet rs;
		String sql = "SELECT contracts.code, properties.address, CONCAT(people.name, ' ', people.last_name) AS full_name, "
				+ "contracts_people.role FROM contracts_people "
				+ "INNER JOIN people ON people.id = contracts_people.person_id "
				+ "INNER JOIN contracts ON contracts.id = contracts_people.contract_id "
				+ "INNER JOIN properties ON properties.id = contracts.property_id " 
				+ "WHERE contracts.code IN ("
				+ "SELECT contracts.code FROM contracts_people "
				+ "INNER JOIN people ON people.id = contracts_people.person_id "
				+ "INNER JOIN contracts ON contracts.id = contracts_people.contract_id "
				+ "WHERE people.name LIKE ? OR people.last_name LIKE ? OR people.id_document LIKE ? "
				+ "OR people.email LIKE ? OR properties.address LIKE ? OR contracts.code LIKE ?);";
		try {
			connect = connectDB.getConnection();
			ps = connect.prepareStatement(sql);
			for (int i = 1; i <= 6; i++) {
				ps.setString(i, "%" + contractParam + "%");
			}
			rs = ps.executeQuery();

			ResultSetMetaData metaData = (ResultSetMetaData) rs.getMetaData();
			int numColumns = metaData.getColumnCount();

			ArrayList<String[]> data = new ArrayList<String[]>();

			while (rs.next()) {
				String[] row = new String[numColumns];
				for (int i = 0; i < numColumns; i++) {
					row[i] = rs.getString(i + 1);
				}
				data.add(row);
			}

			rs.close();
			ps.close();
			connect.close();
			return data;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
