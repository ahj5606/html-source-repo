package ajax.picture;

public class Equals {
	public static void main(String[] args) {
		String s = "안녕";
		String s1 = new String("안녕");
		System.out.println(s1==s); //주소번지가 같니? 
		System.out.println(s1.equals(s));//값이 같니?
		if(s==s1) {
			System.out.println("같다");
		}
		else {
			System.out.println("다르다.");
		}
		if(s1.equals(s)) {
			System.out.println("같다");
		}
		else {
			System.out.println("다르다.");
			
		}
		
	}
}
