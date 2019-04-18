package oop.ex4.data_structures;

/*
AVL tree is a BST that is balanced, there is "is a" relation ship, therefor I choose to create BST class,
and the AVL tree would inherit this class, BST AND AVL has the same function, just
 */

import java.util.NoSuchElementException;

public class BST {
	private final int  NOT_FOUND = -1;
	AvlNode root;
	int size;
	public BST(){
		this.root = null;
		this.size = 0;
	}


	/**
	 * Add a new node with key newValue into the tree.
	 * @param newValue - new value to add to the tree.
	 * @return - false iff newValue already exist in the tree
	 */
	public boolean add(int newValue){
		AvlNode current = this.root;
		int count = 0;
		if(newValue == 75){
			count++;
		}

		if (current == null){
			this.root = new AvlNode(newValue, null);
			return true;
		}

		if(this.contains(newValue) != NOT_FOUND){
			return false;
		}
		// Go over the tree
		while(current != null){
			// Search the left sub-tree.
			if (newValue < current.getData()){
				// The value can be added as the
				// left child of the current node.
				if (current.getLeft() == null){
					current.setLeft(new AvlNode(newValue, current));
					return true;
				}
				// We need to go deeper into the left sub-tree.
				else{
					current = current.getLeft();
				}
			}
			// Search the right sub-tree.
			else if (newValue > current.getData()){
				// The value can be added as the
				// right child of the current node.
				if (current.getRight() == null){
					current.setRight(new AvlNode(newValue, current));
					return true;
				}
				// We need to go deeper into the right sub-tree.
				else{
					current = current.getRight();
				}
			}
			// The value is already in the tree and we don't allow duplicates.
			else{
				return false;
			}
		}
		// The data cant be added to the tree.
		return false;

	}

	/**
	 * Does tree contain a given input value.
	 * @param searchVal - value to search for
	 * @return if val is found in the tree, return the depth of its node (where 0 is the root). Otherwise
	 * -- return -1.
	 */
	public int contains(int searchVal){
		// search for the node the value should be in.
		AvlNode nodeThatShouldBeIn = search(this.root,searchVal);
		if (nodeThatShouldBeIn == null){
			return NOT_FOUND;
		}
		return maxDepth(nodeThatShouldBeIn);
	}

	/*
	Return the depth of the given node
	 */
	private  int maxDepth(AvlNode node) {
		return (this.height(this.root) - this.height(node));
	}

	/*
	This function search for the given key in the BST tree, and return the node that the key should be in.
	(if return null, meaning that the key is not in the tree)
	 */
	AvlNode search(AvlNode root, int key)
	{
		AvlNode currentNode = root;
		if (root == null){
			return null;
		}
		while (true){
			// check if the data equals to current
			if (currentNode.getData() == key){
				return currentNode;
			}
			// check if data greater than the current
			if (currentNode.getData() > key){
				if (currentNode.getLeft() != null){
					currentNode = currentNode.getLeft();
				}
				else{
					return null;
				}
			}
			//check if the data lower than the current
			else if (currentNode.getData() < key){
				if (currentNode.getRight() != null){
					currentNode = currentNode.getRight();
				}
				else{
					return null;
				}
			}
		}
	}

	/**
	 * Remove a node from the tree, if it exists.
	 * @param toDelete - value to delete
	 * @return - true iff toDelete found and deleted
	 */
	boolean delete(int toDelete)
	{
		// check if the data to delete actually in the tree, if not return false.
		if(this.contains(toDelete) == NOT_FOUND){
			return false;
		}
		// try to remove the the node with the given data
		this.root = deleteRec(this.root, toDelete);
		// checks if the data has been removed
		if(this.contains(toDelete) == NOT_FOUND){
			return true;
		}
		return false;
	}


	AvlNode deleteRec(AvlNode root, int key)
	{
		/* if trr empty */
		if (root == null){
			return root;
		}

		/* recursively goes down in the tree */
		if (key < root.getData())
			root.setLeft(deleteRec(root.getLeft(), key));
		else if (key > root.getData())
			root.setRight(deleteRec(root.getRight(), key));

			// if key is same as root's key, then This is the node
			// to be deleted
		else
		{
			// node with only one child or no child
			if (root.getLeft() == null)
				return root.getRight();
			else if (root.getRight() == null)
				return root.getLeft();

			// node with two children: Get the inorder successor (smallest
			// in the right subtree)
			root.setData(findMin(root.getRight()).getData());

			// Delete the inorder successor
			root.setRight(deleteRec(root.getRight(), root.getData()));
		}

		return root;
	}



	/*
	find the min value in the given tree and return it's node.
	 */
	AvlNode findMin(AvlNode root){
		if(root == null){
			throw new NoSuchElementException();
		}
		AvlNode minNode = root;
		while (minNode.getLeft() != null){
			minNode = minNode.getLeft();
		}
		return minNode;
	}

	/**
	 *
	 * @return - number of nodes in the tree
	 */
	public int size(){
		return this.size;
	}

	/*
	This function return the height of the given node (find the height recursively)
	 */
	 int  height(AvlNode node){
		return ((this.heightHelper(node)) - 1);
	}
	/*
	Recursively find the height
	 */
	private int heightHelper(AvlNode node){

		if (node == null){
			return 0;
		}
		else{
			return Math.max(heightHelper(node.getLeft()), heightHelper(node.getRight())) + 1;
		}
	}

	/**
	 * A method that calculates the maximum number of nodes in an AVL tree of height h,
	 * @param h - height of the tree (a non-negative number).
	 * @return - maximum number of nodes of height h
	 */
	public static int findMaxNodes(int h){
		return ((int)Math.pow(2,(h+1))-1);
	}



}
