import java.util.*;

public class CollectionFacadeSet implements SimpleSet {

	/**
	 * Creates a new facade wrapping the specified collection.
	 * @param collection - The Collection to wrap.
	 */
	int size = 0;
	protected Collection<String> collection;
	public CollectionFacadeSet(java.util.Collection<java.lang.String> collection){
		this.collection = collection;

		TreeSet<String> set = new TreeSet<>(collection); // remove duplicates
		this.collection.clear();
		this.collection.addAll(set);

	}


	@Override
	public boolean add(java.lang.String newValue){
		if(!this.contains(newValue)){
			this.collection.add(newValue);
			return true;
		}
		return false;
	}

	@Override
	public boolean contains(java.lang.String searchVal){
		return (collection != null) && (collection.contains(searchVal));
	}

	@Override
	public boolean delete(java.lang.String toDelete){
		if(toDelete != null && this.collection.remove(toDelete)){
			this.collection.remove(toDelete);
			return true;
		}
		return false;
	}

	@Override
	public int size() {
		return this.collection.size();

	}
}

