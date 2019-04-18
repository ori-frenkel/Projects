
public class ClosedHashSet extends SimpleHashSet {
	private String[] hashSet;
	private final String DELETED = "deleted";
	/**
	 * A default constructor. Constructs a new, empty table with default initial capacity (16), upper load
	 * factor (0.75) and lower load factor (0.25).
	 */
	public ClosedHashSet(){
		super();
		hashSet = new String[INITIAL_CAPACITY];
	}

	/**
	 * Constructs a new, empty table with the specified load factors, and the default initial capacity (16).
	 * @param upperLoadFactor - The upper load factor of the hash table.
	 * @param lowerLoadFactor - The lower load factor of the hash table.
	 */
	public ClosedHashSet(float upperLoadFactor, float lowerLoadFactor){
		super(upperLoadFactor,lowerLoadFactor);
		hashSet = new String[INITIAL_CAPACITY];
	}

	/**
	 * Data constructor - builds the hash set by adding the elements one by one. Duplicate values should be
	 * ignored. The new table has the default values of initial capacity (16), upper load factor (0.75), and
	 * lower load factor (0.25).
	 * @param data - Values to add to the set.
	 */
	public ClosedHashSet(java.lang.String[] data){
		super();
		hashSet = new String[INITIAL_CAPACITY];
		for (int i = 0; i < data.length; i++){
			this.add(data[i]);
		}
	}

	@Override
	public boolean contains(String searchVal) {
		int hashCode = searchVal.hashCode();
		int index;
		for (int i = 0; i < hashSet.length; i++){ /* running on all the hashSet length and according to the
		 given formula check if in that index the String is in. */
			index = this.indexFormula(hashCode,i);
			index = this.clamp(index);
			if(this.hashSet[index] == null){
				return false;
			}
			else if(this.hashSet[index] != DELETED && this.hashSet[index].equals(searchVal)){
				return true;
			}
		}
		return false;
	}

	@Override
	public boolean add(java.lang.String newValue){
		if(newValue == null){ // checks for valid string
			return false;
		}
		if(!this.contains(newValue)){ // add it, only if it's not already in the HashSet
			this.checksForExpand(); /* checks if after adding the String the load factor would be legal, if
			not rehashing(and expand the HashSet) */
			int hashCode = newValue.hashCode();
			for (int i = 0; i < hashSet.length; i++){ // searching and adding for to right index
				int index = this.indexFormula(hashCode,i);
				index = this.clamp(index);
				if(this.hashSet[index] == null || this.hashSet[index] == DELETED ){
					this.hashSet[index] = newValue;
					this.updateSize(1);
					return true;
				}
			}
		}
		return false; // if the string wasn't added, return false
	}

	@Override
	public boolean delete(String toDelete) {
		if(toDelete == null || !this.contains(toDelete)){ /* checks that actually got a string and not a null
		and checks that the string is actually in the HashSet */
			return false;
		}
		int hashCode = toDelete.hashCode();
		this.checksForShrink(); /* Checks if after deleting, the load factor would be still legal, if not,
		rehashing (and shrink the HashSet) */
		for (int i = 0; i < hashSet.length; i++){ //Searching and deleting the string(If it is in the HashSet)
			int index = this.indexFormula(hashCode,i);
			index = this.clamp(index);
			if(this.hashSet[index] == null){
				return false;
			}
			else if(this.hashSet[index] != DELETED && this.hashSet[index].equals(toDelete)){
				this.hashSet[index] = DELETED;
				this.updateSize(-1);
				return true;
			}
		}
		return false;
	}
	/*
	Getting hashcode and i, and return an integer according to the given formula (later use this integer for
	clamp)
	 */
	private int indexFormula(int hashcode, int i){
		return (hashcode +((i + i * i)/2));
	}

	/*
	Checks if the load factor after adding a string is still legal, if not, rehashing.
	 */
	private void checksForExpand(){
		if(this.LoadFactor(1) > this.getUpperLoadFactor()){
			this.reHashing(EXPAND);
		}
	}

	private void checksForShrink(){
		if((this.LoadFactor(-1) < this.getLowerLoadFactor()) && (this.capacity >= 2) && (this.size<=(this.capacity/2))){
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
		String[] newHashSet = new String[this.capacity];
		for (int i=0; i < oldLen ; i++){
			if(hashSet[i] == null){
				continue;
			}
			this.add(hashSet[i],newHashSet);
		}
		this.hashSet = newHashSet;
	}

	/*
	This function get an HashSet and String, and add the string to the hashset, (In this function, I doesn't
	check for duplicate, because I use it for ReHash, therefore this function won't get duplicates)
	 */
	private boolean add(String newValue, String[] newHashSe ){
		int hashCode = newValue.hashCode();
		int index;
		for (int i = 0; i < newHashSe.length; i++){
			index = this.indexFormula(hashCode,i);
			index = this.clamp(index);
			if(newHashSe[index] == null || newHashSe[index] == DELETED ){
				newHashSe[index] = newValue;
				return true;
			}
		}
		return false;
	}
}
