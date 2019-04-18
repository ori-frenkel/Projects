package oop.ex4.data_structures;

public class AvlNode {
	private AvlNode left, right, father;
	private int data;


	/**
	 * Default constrictor, create a node with default data (0)
	 */
	public AvlNode()
	{
		this.left = null;
		this.right = null;
		this.data = 0;
		this.father = null;
	}

	/**
	 *
	 * @param data - Create a node with the given data as data, and given father as father
	 */
	public AvlNode(int data, AvlNode father)
	{
		this.left = null;
		this.right = null;
		this.data = data;
		this.father = father;
	}

	public AvlNode(int data)
	{
		this.left = null;
		this.right = null;
		this.data = data;
		this.father = null;
	}

	/**
	 *
	 * @return - return the data that in the node
	 */
	public int getData() {
		return data;
	}

	/**
	 * set that data in the node to the given data
	 * @param data - data to set
	 */
	public void setData(int data) {
		this.data = data;
	}

	/**
	 *
	 * @return - return the node father
	 */
	public AvlNode getFather() {
		return father;
	}

	/**
	 * set the node father to the given father
	 * @param father - father to set
	 */
	public void setFather(AvlNode father) {
		this.father = father;
	}

	/**
	 *
	 * @return return the left son of the node
	 */
	public AvlNode getLeft() {
		return this.left;
	}

	/**
	 * set the left son of the node
	 * @param left - the son to be set as the left son
	 */
	public void setLeft(AvlNode left) {
		this.left = left;
	}

	/**
	 *
	 * @return - the right son of the node
	 */
	public AvlNode getRight() {
		return right;
	}

	/**
	 * Set the right son of the node to the given node
	 * @param right - the node to set as right son
	 */
	public void setRight(AvlNode right) {
		this.right = right;
	}

}
