package membership;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.ServletContext;

import common.JDBConnect;
import model1.board.BoardDTO;

public class MemberDAO extends JDBConnect {

	public MemberDAO(ServletContext application) {
		super(application);
	}

	public MemberDTO getMemberDTO(String uid, String upass) {
		MemberDTO dto = new MemberDTO();
		String query = "SELECT * FROM MEMBER WHERE id=? AND pass=?";

		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, uid);
			psmt.setString(2, upass);
			rs = psmt.executeQuery();

			if (rs.next()) {
				dto.setId(rs.getString("id"));
				dto.setPass(rs.getString("pass"));
				dto.setName(rs.getString(3));
				dto.setRegidate(rs.getDate(4));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	public int addMember(MemberDTO dto) {
		int result = 0;		
		try {
			// insert 쿼리문 작성
			String query = "INSERT INTO MEMBER ("
					+ " id,pass,name) "
					+ " VALUES ( "
					+ " ?, ?, ?)";			
			psmt=con.prepareStatement(query);	// 동적 쿼리
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPass());
			psmt.setString(3, dto.getName());			
			result = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("가입 프로세스 중 에러 발생");
			e.printStackTrace();
		}		
		return result;		
	}
	
	public int selectCount(Map<String, Object> map) {
		int totalCount = 0;
		// 게시물 수를 얻어오는 쿼리문 작성
		String query = "SELECT COUNT(*) FROM MEMBER";
		if (map.get("searchWord") != null) {
			query += " WHERE " + map.get("searchField") 
			+ " " + " LIKE '%" + map.get("searchWord") + "%'";
		}
		try {
			stmt = con.createStatement();	// 쿼리문 생성
			rs = stmt.executeQuery(query);	// 쿼리 실행
			rs.next();	// 커서를 첫번째 행으로 이동
			totalCount = rs.getInt(1);	// 첫번째 컬럼 값을 가져옴
		} catch (Exception e) {
			System.out.println("게시물 수를 구하는 중 예외 발생!");
			e.printStackTrace();
		}		
		return totalCount; 
	}
	
	public List<MemberDTO> selectList(Map<String,Object> map) {
		List<MemberDTO> bbs = new Vector<>();
		// 결과(게시물 목록)를 담을 변수
		String query = "SELECT * FROM MEMBER ";		
		if(map.get("searchWord") != null) {
			query += " WHERE " + map.get("searchField") 
			+ " " + " LIKE '%" + map.get("searchWord") + "%'";			
		}
		query += " ORDER BY regidate DESC";	// 내림차순 정렬 추가
		try {
			stmt = con.createStatement();	// 쿼리문 생성
			rs = stmt.executeQuery(query);	// 쿼리 실행
			while(rs.next()) {	// 결과를 순차적으로 반복 출력
				// 한 행(게시물 하나)의 내용을 DTO로 보냄
				MemberDTO dto = new MemberDTO();	// dto 객체 생성
				dto.setId(rs.getString("id"));
				dto.setPass(rs.getString("pass"));
				dto.setName(rs.getString("name"));
				dto.setRegidate(rs.getDate("regidate"));
				bbs.add(dto);	// dto를 list 컬렉션에 담는다.
			}
		} catch (Exception e) {
			System.out.println("회원 목록을 불러오는 중 예외 발생!");
			e.printStackTrace();
		}
		return bbs;		// 쿼리 결과를 list 컬렉션으로 jsp 반환
	}
	
	public List<MemberDTO> selectListPage(Map<String,Object> map) { 
		List<MemberDTO> bbs = new Vector<>();		
		String query = "SELECT * FROM ( "
				+ " SELECT Tb.*, ROWNUM rNum FROM ( "
				+ " SELECT * FROM MEMBER ";
		if(map.get("searchWord")!=null) {
			query+=" WHERE "+ map.get("searchField")
			+ " LIKE '%'" + map.get("searchWord")+"'%' ";
		}
		query += " ORDER BY regidate DESC "
				+ " ) Tb "
				+ " ) "
				+ " WHERE rNum BETWEEN ? AND ?";		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, map.get("start").toString());
			psmt.setString(2, map.get("end").toString());
			rs=psmt.executeQuery();			
			while (rs.next()) {
				MemberDTO dto = new MemberDTO();	// dto 객체 생성
				dto.setId(rs.getString("id"));
				dto.setPass(rs.getString("pass"));
				dto.setName(rs.getString("name"));
				dto.setRegidate(rs.getDate("regidate"));
				bbs.add(dto);	// dto를 list 컬렉션에 담는다.
			}
		} catch (Exception e) {
			System.out.println("회원 목록을 불러오는 중 예외 발생");
			e.printStackTrace();
		}
		return bbs;
	}
	
	public MemberDTO selectView(String id) {
		MemberDTO dto = new MemberDTO();		
		String query = "SELECT * FROM MEMBER "
				+ " WHERE id=?";		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, id);	// 인파라미터를 일련번호로 설정
			rs = psmt.executeQuery();	// 쿼리문 실행하여 rs에 저장
			// 결과처리
			if(rs.next()) {
				dto.setId(rs.getString(1));
				dto.setPass(rs.getString(2));
				dto.setName(rs.getString(3));
				dto.setRegidate(rs.getDate("regidate"));
			}
		} catch (SQLException e) {
			System.out.println("회원 상세보기 중 예외 발생");
			e.printStackTrace();
		}
		return dto;
	}
	
	public int updateMember(MemberDTO dto) {	
		int result = 0;		
		try {	// 쿼리문 작성
			String query = "UPDATE MEMBER SET "
					+" pass=?, name=? "
					+" WHERE id=?";
			// 쿼리문 완성
			psmt=con.prepareStatement(query);
			psmt.setString(1, dto.getPass());
			psmt.setString(2, dto.getName());	
			psmt.setString(3, dto.getId());	
			// 쿼리문 실행
			result=psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("회원 정보 수정 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
	
	public int deleteMember(MemberDTO dto) {
		int result = 0;
		 try {
			 // ON DELETE CASCADE 구문(자식테이블에서도 삭제) 넣어야됨
			 String query = "DELETE FROM MEMBER WHERE id=?";
			 psmt = con.prepareStatement(query);
			 psmt.setString(1, dto.getId());
			 result=psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("회원 삭제 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
}
