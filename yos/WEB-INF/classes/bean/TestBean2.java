package bean;

public class TestBean2{
	private int num;

	public void setNum(int num){
		for(int i=1; i<=num; i++)
			this.num+=i;
	}
	public int getNum(){
		return num;
	}
}