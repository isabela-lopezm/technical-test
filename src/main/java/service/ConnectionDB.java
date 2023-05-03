package service;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionDB {
	Connection connect;

	public ConnectionDB() {
		try {
			System.out.println("Estableciendo conexi�n...");
			Class.forName("com.mysql.cj.jdbc.Driver");
			this.connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/test_service", "root", "");
			System.out.println("Conexi�n establecida correctamente");

		}catch (Exception e) {
			System.out.println("Error en la conexi�n:");
			e.printStackTrace();
		}
	}

	public Connection getConnection() {
		return this.connect;
	}
}
