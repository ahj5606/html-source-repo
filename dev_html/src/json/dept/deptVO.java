package json.dept;

public class deptVO {
	private int deptno = 0;
	public int getDeptno() {
		return deptno;
	}
	public void setDeptno(int depno) {
		this.deptno = depno;
	}
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	public String getLoc() {
		return loc;
	}
	public void setLoc(String loc) {
		this.loc = loc;
	}
	private String dname = null;
	private String loc = null;
}
