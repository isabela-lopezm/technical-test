package service;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionDB {
	Connection connect;

	public ConnectionDB() {
		try {
			System.out.println("Estableciendo conexión...");
			Class.forName("com.mysql.cj.jdbc.Driver");
			this.connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/test_service", "root", "");
			System.out.println("Conexión establecida correctamente");

		}catch (Exception e) {
			System.out.println("Error en la conexión:");
			e.printStackTrace();
		}
	}

	public Connection getConnection() {
		return this.connect;
	}
}
