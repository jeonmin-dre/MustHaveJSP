package membership;

public class MemberDTO3 {
	// 멤버 변수 선언
	private String id;
	private String pass;
	private String name;
	private java.sql.Date regidate;	
	private String conCount;	
	
	public String getId() {
		return id;
	}
	public String getPass() {
		return pass;
	}
	public String getName() {
		return name;
	}
	public java.sql.Date getRegidate() {
		return regidate;
	}
	public String getConCount() {
		return conCount;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setRegidate(java.sql.Date regidate) {
		this.regidate = regidate;
	}
	public void setConCount(String conCount) {
		this.conCount = conCount;
	}
}
