package common;

import java.sql.Statement;

import javax.servlet.ServletContext;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class JDBConnect {
	public Connection con; // 데이터베이스 연결을 담당
	public Statement stmt; // 인파라미터가 없는 정적 쿼리문 실행
	public PreparedStatement psmt; // 동적 퀴리문 실행
	// 인파라미터가 있는 동적 쿼리문 (인파라미터는 쿼리문 작성 시 매개변수 전달된 값을 설정)
	// ?로 표현하는데 sql문법 대체용
	public ResultSet rs; // select 쿼리문 결과를 저장할 때 사용

	public JDBConnect() { // 기본 생성자
		try {
			// JDBC 드라이버 로드
			Class.forName("oracle.jdbc.OracleDriver");
			// DB 연결
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String id = "musthave";
			String pwd = "1234";
			con = DriverManager.getConnection(url, id, pwd);
			System.out.println("DB 연결 성공 (기본 생성자)");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 두번째 생성자 (web.xml을 통한 application 내장 객체 사용)
	public JDBConnect(String driver, String url, String id, String pwd) {
		try {
			// JDBC 드라이버 로드
			Class.forName(driver);
			// DB 연결
			con = DriverManager.getConnection(url, id, pwd);
			System.out.println("DB 연결 성공 (인수 생성자 1)");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 세번째 생성자 (ServletContext를 활용)
	public JDBConnect(ServletContext application) {
		try {
			// JDBC 드라이버 로드
			String driver = application.getInitParameter("OracleDriver");
			Class.forName(driver);
			// DB 연결
			String url = application.getInitParameter("OracleURL");
			String id = application.getInitParameter("OracleId");
			String pwd = application.getInitParameter("OraclePwd");
			con = DriverManager.getConnection(url, id, pwd);
			System.out.println("DB 연결 성공 (인수 생성자 2)");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void close() {
		try {
			if (rs != null)
				rs.close();
			if (stmt != null)
				stmt.close();
			if (psmt != null)
				psmt.close();
			if (con != null)
				con.close();
			System.out.println("JDBC 자원 해제 완료");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
