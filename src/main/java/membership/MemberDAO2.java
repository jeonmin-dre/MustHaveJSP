package membership;

import common.JDBConnect;

public class MemberDAO2 extends JDBConnect {

	public MemberDAO2(String driver, String url, String id, String pwd) {
		super(driver, url, id, pwd);
	}

	public MemberDTO2 getMemberDTO(String uid, String upass) {
		MemberDTO2 dto = new MemberDTO2();
		String query = "SELECT * FROM MEMBER2 WHERE id=? AND pass=?";

		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, uid);
			psmt.setString(2, upass);
			rs = psmt.executeQuery();

			if (rs.next()) {
				dto.setId(rs.getString("id"));
				dto.setPass(rs.getString("pass"));
				dto.setName(rs.getString(3));
				dto.setBirth(rs.getString(4));
				dto.setEmail(rs.getString(5));
				dto.setPhone(rs.getString(6));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
}
