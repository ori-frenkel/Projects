
import java.lang.String;
import java.util.LinkedList;


public class WrapperLinkedList implements SimpleSet {
	 LinkedList<String> linkL;
	public WrapperLinkedList(){
		this.linkL = new LinkedList<>();
	}

	@Override
	public boolean add(String s)
	{
		return linkL.add(s);
	}

	@Override
	public boolean contains(String s) {
		return linkL.contains(s);
	}

	@Override
	public int size(){
		return linkL.size();
	}

	@Override
	public boolean delete(String s){
		return linkL.remove(s);
	}

}




