
public abstract class SimpleHashSet implements SimpleSet {

	/** Describes the higher load factor of a newly created hash set  */
	protected static final float DEFAULT_HIGHER_CAPACITY = 0.75f;
	/** Describes the lower load factor of a newly created hash set */
	protected static final float DEFAULT_LOWER_CAPACITY = 0.25f;
	/** Describes the capacity of a newly created hash set */
	protected static final int INITIAL_CAPACITY = 16;
	/**Describes the capacity - 1 */
	protected int capacityMinusOne;
	private float upperLoadFactor, lowerLoadFactor;
	protected int capacity,size;
	/*Describes if there is a need to expand the hashset **/
	protected final int EXPAND = 1;
	/*Describes if there is a need to shrink the hashset **/
	protected final int SHRINK = 0;
	/**
	 * Constructs a new hash set with the default capacities given in DEFAULT_LOWER_CAPACITY and
	 * DEFAULT_HIGHER_CAPACITY
	 */
	protected SimpleHashSet(){
		this.upperLoadFactor = DEFAULT_HIGHER_CAPACITY;
		this.lowerLoadFactor = DEFAULT_LOWER_CAPACITY;
		this.capacity = INITIAL_CAPACITY;
		this.capacityMinusOne = this.capacity-1;
		this.size=0; // the number of elements currently in the set
	}

	/**
	 * Constructs a new hash set with capacity INITIAL_CAPACITY
	 * @param upperLoadFactor- the upper bound of numbers
	 * @param lowerLoadFactor- the lower bound of numbers
	 */
	public SimpleHashSet (float upperLoadFactor, float lowerLoadFactor){
		this.upperLoadFactor = upperLoadFactor;
		this.lowerLoadFactor = lowerLoadFactor;
		this.capacity = INITIAL_CAPACITY;
		this.capacityMinusOne = this.capacity-1;
		this.size=0; // the number of elements currently in the set
	}

	/**
	 *
	 * @return - return the load factor
	 */
	public float LoadFactor(int i){
		return (float) (this.size+i) / (float) this.capacity;
	}
	/**
	 *
	 * @return - the upper load factor
	 */
	protected float getUpperLoadFactor(){
		return this.upperLoadFactor;
	}

	/**
	 *
	 * @return - the lower load factor
	 */
	protected float getLowerLoadFactor(){
		return this.lowerLoadFactor;
	}

	/**
	 * Add a specified element to the set.
	 * @param newValue New value to add to the set
	 * @return False iff newValue already exists in the set
	 */
	public abstract boolean add(String newValue);

	/**
	 * Look for a specified value in the set.
	 * @param searchVal Value to search for
	 * @return True iff searchVal is found in the set
	 */
	public abstract boolean contains(String searchVal);

	/**
	 * Remove the input element from the set.
	 * @param toDelete Value to delete
	 * @return True iff toDelete is found and deleted
	 */
	public abstract boolean delete(String toDelete);

	/**
	 * @return The number of elements currently in the set
	 */
	public int size(){
		return size;
	}

	/**
	 * @return - The current capacity (number of cells) of the table.
	 */
	public int capacity(){
		return this.capacity;
	}

	/*
	 * This function update/set the capacity (expand of shrink), according to the given int, which represent
	 * the desire action
	 * @param shrinkOrExpand - The desire action, shrink/expand the HashSet
	 */
	protected void updateCapacity(int shrinkOrExpand){
		if(shrinkOrExpand == EXPAND){
			this.capacity = (this.capacity*2);
		}
		else { this.capacity = (this.capacity/2);}
		this.capacityMinusOne = (this.capacity-1);
	}

	/**
	 * Clamps hashing indices to fit within the current table capacity
	 * @param index - the index before clamping
	 * @return - an index properly clamped
	 */
	protected  int clamp(int index){
		return index&(capacityMinusOne);
	}

	/*
	 *
	 * @param amount - the amount to add to the size
	 */
	protected void updateSize(int amount){
		this.size += amount;
	}

}