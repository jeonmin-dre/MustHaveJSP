package common;	// 기본 패키지 이외의 패키지 (규약 1번)

public class Person {
	private String name;
	private int age;	// private으로 필드 생성 (규약 2번)

	public Person() {
	}	// 기본생성자 (규약 3번)
	public Person(String name, int age) {
		this.name = name;
		this.age = age;
	}	// 인수를 받는 생성자

	public String getName() {return name;}
	public int getAge() {return age;}
	public void setName(String name) {this.name = name;}
	public void setAge(int age) {this.age = age;}	
	// public으로 getter/setter 생성 (규약 4,5번) 
}
