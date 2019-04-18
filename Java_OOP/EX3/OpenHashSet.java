
public class OpenHashSet extends SimpleHashSet {
	private WrapperLinkedList[] hashSet;
	/**
	 * A default constructor. Constructs a new, empty table with default initial capacity (16), upper load
	 * factor (0.75) and lower load factor (0.25).
	 */
	public OpenHashSet(){
		super();
		hashSet = new WrapperLinkedList[INITIAL_CAPACITY];
	}

	/**
	 * Constructs a new, empty table with the specified load factors, and the default initial capacity (16).
	 * @param upperLoadFactor - The upper load factor of the hash table.
	 * @param lowerLoadFactor - The lower load factor of the hash table.
	 */
	public OpenHashSet(float upperLoadFactor, float lowerLoadFactor){
		super(upperLoadFactor, lowerLoadFactor);
		hashSet = new WrapperLinkedList[INITIAL_CAPACITY];

	}

	/**
	 * Data constructor - builds the hash set by adding the elements one by one. Duplicate values should be
	 * ignored. The new table has the default values of initial capacity (16), upper load factor (0.75), and
	 * lower load factor (0.25).
	 * @param data - Values to add to the set.
	 */
	public OpenHashSet(java.lang.String[] data){
		super();
		hashSet = new WrapperLinkedList[INITIAL_CAPACITY];
		for (int i = 0; i < data.length; i++){
			this.add(data[i]);
		}
	}

	/**
	 * @param newValue New value to add to the set
	 * @return - true, if added successfully, false otherwise (if already in the hashset)
	 */
	public boolean add(String newValue){
		if(!this.contains(newValue)){ //checks if the string already in the hashSet,if it is,than return false
			this.checksForExpand(); // checks if after adding the upperbound is still valid, if not, expand
			int index = this.clamp(newValue.hashCode());  // the index to append the string
			if(hashSet[index] == null){ // if the hashSet is null in that index, the initialize
				hashSet[index] = new WrapperLinkedList();
			}
			this.hashSet[index].linkL.add(newValue); // add the string to the index
			this.updateSize(1); // add +1 to the size
			return true;
		}
		return false; // if the string already in the set, return False
	}

	/*
	This function get OpenHashSet and string, and add the string to that hashSet
	I used this function for the rehashing
	String newValue - string to add
	WrapperLinkedList[] newHashSe - The hashSet that we want to append that string
	 */
	private void add(String newValue, WrapperLinkedList[] newHashSe ){
		int index = this.clamp(newValue.hashCode());
		if(newHashSe[index]== null){
			newHashSe[index] = new WrapperLinkedList();
		}
		newHashSe[index].linkL.add(newValue);
	}
	/*
	Checks if the load factor after adding a string is still legal, if not, rehashing.
	 */
	private void checksForExpand(){
		if(this.LoadFactor(1) > this.getUpperLoadFactor()){
			this.reHashing(EXPAND);
		}
	}

	/*
	Checks if the loaf factor after deleting a string is still legal, if not, rehashing.
	 */
	private void checksForShrink(){
		if(this.LoadFactor(-1) < this.getLowerLoadFactor() && this.capacity >= 2){
			this.reHashing(SHRINK);
		}
	}


	/*
	As the name suggest, this function responsibilities is to reHashing, meaning that this function gets an
	int represent shrink or expand, and according to that expand/shrink the HashSet and reindexing all of the
	string (because the index of string is depend of the hashSet capacity)
	 */
	private void reHashing(int shrinkOrExpand){
		int oldLen = hashSet.length;
		this.updateCapacity(shrinkOrExpand); // expand or shrink the capacity according to shrinkOrExpand
		WrapperLinkedList[] newHashSet = new WrapperLinkedList[this.capacity];
		for (int i=0; i < oldLen ; i++){
			while(hashSet[i] != null && hashSet[i].linkL.peek() != null){
				this.add(hashSet[i].linkL.poll(),newHashSet);
			}
		}
		this.hashSet = newHashSet;
	}



	@Override
	public boolean contains(String searchVal){
		int indexIn = this.clamp(searchVal.hashCode());
		if(this.hashSet[indexIn] == null){
			return false;
		}
		return this.hashSet[indexIn].linkL.contains(searchVal);
	}


	@Override
	public boolean delete(String toDelete) {
		if (this.contains(toDelete)){ // checks if the string is actually in the HashSet
			this.checksForShrink(); //check if after delete the load factor would be still legal,if not Rehash
			int index = this.clamp(toDelete.hashCode());
			this.hashSet[index].linkL.remove(toDelete);
			this.updateSize(-1); // update the size after deleting.
			return true;
		}
		return false;

	}

}
