package oop.ex4.data_structures;
import java.util.Iterator;
import java.util.NoSuchElementException;


public class AvlTree extends BST implements Iterable<Integer> {
	/**
	 * A default constructor.
	 */
	public AvlTree(){
		super();
	}

	/**
	 * A copy-constructor that builds the tree from existing tree
	 * @param tree - tree to be copied
	 */
	public AvlTree(AvlTree tree){
		super(); // first create empty tree (meaning root = null)
		if(tree != null)
		inorder(tree.root);
	}
	// inorder recursively copy the tree
	void inorder(AvlNode copy)
	{
		inorderRec(copy);
	}

	// helps to copy the tree
	void inorderRec(AvlNode copyRoot)
	{

		if (copyRoot != null)
		{
			inorderRec(copyRoot.getLeft());
			this.add(copyRoot.getData());
			inorderRec(copyRoot.getRight());
		}
	}

	/**
	 * A constructor that builds the tree by adding the elements in the input array one-by-one If the same
	 * values appears twice (or more) in the list, it is ignored.
	 * @param data - values to add to tree
	 */
	public AvlTree(int[] data){
		super(); // first create empty tree (meaning root = null)
		if (data != null) /* if got an acutally valid array, and not
		 a null reference, then add all the data
		 from array to the tree */
			for (int index=0; index < data.length ; index++){
				this.add(data[index]);
			}
	}

	/**
	 * Add a new node with key newValue into the tree.
	 * @param newValue - new value to add to the tree.
	 * @return - false iff newValue already exist in the tree
	 */
	public boolean add(int newValue){
		if(!super.add(newValue)){
			return false;
		}

		if(this.root == null){
			return false;
		}
		AvlNode NewlyAddedNode = this.search(this.root,newValue);
		while(NewlyAddedNode != null){
			this.balanceTheTreeToAvl(NewlyAddedNode);
			NewlyAddedNode = NewlyAddedNode.getFather();
		}
		this.size += 1;
		return true;
	}

	/*
	Call to the right rotation when needed, does that according to the height and dast. (propriety of avl)
	 */
	private void balanceTheTreeToAvl(AvlNode node){

		if(node == null){
			return;
		}



		int mainBalanceFactor = this.balanceFactor(node); // the balance factor of the node
		int leftSonBalanceFactor = this.balanceFactor(node.getLeft()); // the balance factor of the left son
		int rightSonBalanceFactor = this.balanceFactor(node.getRight()); //the balance factor of the right son
		if(mainBalanceFactor == 2){
			if(rightSonBalanceFactor == 1 || rightSonBalanceFactor == 0){
				this.rotateLeft(node);
			}
			else if(rightSonBalanceFactor == -1){
				this.RL(node);
			}
		}
		else if(mainBalanceFactor == -2){
			if(leftSonBalanceFactor == -1 || leftSonBalanceFactor == 0){
				this.rotateRight(node);

			}
			else if(leftSonBalanceFactor == 1){
				this.LR(node);
			}
		}
		// do nothing, the tree is already balance

	}

	/*
	This function gets a node, and return the difference between left subtree height and right subtree height
	h (AL) − h (AR)
	 */
	private int balanceFactor(AvlNode node){
		int HL = 0; // left sub tree height
		int HR = 0; // right sub tree height
		// if there is no right sub tree, than the height of the right subtree defined to be -1
		if(node == null){
			return 0;
		}
		HR = this.height(node.getRight());
		HL = this.height(node.getLeft());

		return (HR-HL);
	}
	/*This function does a LL rotation */
	/*This function does a LL rotation */
	private void rotateLeft(AvlNode node){
		AvlNode nodeFather = node.getFather();
		boolean right = false;
		boolean thisIsTheRoot = false;
		if(nodeFather == null){
			thisIsTheRoot = true;
		}
		if(nodeFather != null && nodeFather.getRight() != null && nodeFather.getRight() == node){
			right = true;
		}

		AvlNode rightSubTree = node.getRight();
		AvlNode LeftSubTreeOfRightSubTree = rightSubTree.getLeft();

		rightSubTree.setLeft(node);
		// 22.6 new line
		node.setFather(rightSubTree);
		rightSubTree.setFather(null);
		node.setRight(LeftSubTreeOfRightSubTree);
		node.setFather(rightSubTree);

		// Here we update the node to the node after the rotation
		if(thisIsTheRoot){
			this.root = rightSubTree;
			return;
		}
		if(right){
			nodeFather.setRight(rightSubTree);
			rightSubTree.setFather(nodeFather);
			return;
		}
		nodeFather.setLeft(rightSubTree);
		// new - added this line
		rightSubTree.setFather(nodeFather);
	}

	/* This function does RR rotation */
	private void rotateRight(AvlNode node){
		AvlNode nodeFather = node.getFather();
		boolean left = false;
		boolean thisIsTheRoot = false;
		if(nodeFather == null){
			thisIsTheRoot = true;
		}
		if(nodeFather != null && nodeFather.getLeft() != null && nodeFather.getLeft() == node){
			left = true;
		}
		AvlNode leftSubTree = node.getLeft();
		node.setFather(leftSubTree);
		AvlNode rightSubTreeOfLeftSubTree = leftSubTree.getRight();

		// Here the actual rotation happens
		leftSubTree.setRight(node);
		// 22.6 new line
		node.setFather(leftSubTree);
		leftSubTree.setFather(null);
		node.setLeft(rightSubTreeOfLeftSubTree);
		// newly added line
		node.setFather(leftSubTree);
		// Here we update the node to the node after the rotation
		if(thisIsTheRoot){
			this.root = leftSubTree;
			return;
		}
		if(left){
			nodeFather.setLeft(leftSubTree);
			leftSubTree.setFather(nodeFather);
			return;
		}
		nodeFather.setRight(leftSubTree);
		// new - added this line
		leftSubTree.setFather(nodeFather);

	}
	/* LR rotation */
	private void LR(AvlNode node){
		this.rotateLeft(node.getLeft());
		this.rotateRight(node);
	}
	/* RL rotation */
	private void RL(AvlNode node){
		this.rotateRight(node.getRight());
		this.rotateLeft(node);
	}

	/**
	 * Remove a node from the tree, if it exists.
	 * @param toDelete - value to delete
	 * @return - true iff toDelete found and deleted
	 */
	public boolean delete(int toDelete){
		AvlNode needToDelete = super.search(this.root,toDelete);
		if(needToDelete != null){
			needToDelete = needToDelete.getFather();
		}
		if(!super.delete(toDelete)){
			return false;
		}
		while(needToDelete != null){
			this.balanceTheTreeToAvl(needToDelete);
			needToDelete = needToDelete.getFather();
		}
		this.size --;
		return true;
	}

	/**
	 * A method that calculates the minimum numbers of nodes in an AVL tree of height h,
	 * @param h - height of the tree (a non-negative number).
	 * @return - minimum number of nodes of height h
	 * using fibonacci fourmula. (with out recursion)
	 */
	public static int findMinNodes(int h){
		int fibo = 1;
		int fiboPrev = 0;
		for(int i = 1; i < h+1; ++i){
			int fiboTemp = fibo + fiboPrev + 1;
			fiboPrev = fibo;
			fibo = fiboTemp;
		}
		return fibo;
	}



	/**
	 * @return iReturns an iterator for the Avl Tree. The returned iterator iterates over the tree nodes in
	 * an ascending order, and does NOT implement the remove() method.
	 */
	public Iterator <Integer> iterator(){
		return new TreeIterator(this.root);
	}

	private class TreeIterator implements Iterator<Integer>{
		AvlNode iterCurrent;
		boolean firstTime = true;
		TreeIterator(AvlNode root){
			try{
				this.iterCurrent=findMin(root);
			}
			catch (NoSuchElementException e){
				this.iterCurrent = null;
			}
		}

		@Override
		public boolean hasNext() {
			try{
				if (Successor(iterCurrent) != null){
					return true;
				}
				return false;
			}
			catch (Exception e){
				throw new NoSuchElementException();
			}

		}
		/*
		Find Successor
		 */
		AvlNode Successor(AvlNode node){
			if (node == null)
				//throw new NullPointerException("Got null reference - thrown at Successor function");
				return null;
			// if has a right son, than return the min value at the right subtree
			if (node.getRight() != null) {
				return findMin(node.getRight());
			}

			// if it doesn't has a right son, than
			AvlNode NodeFather = node.getFather();
			while (NodeFather != null && node == NodeFather.getRight()) {
				node = NodeFather;
				NodeFather = NodeFather.getFather();
			}
			return NodeFather;
		}

		@Override
		public Integer next() {
			if(firstTime && iterCurrent == null){
				throw new NoSuchElementException();
			}
			if (firstTime) {
				firstTime = false;
				return iterCurrent.getData();
			}
			iterCurrent = Successor(iterCurrent);
			if (iterCurrent == null) {
				throw new NoSuchElementException();
			}
			return iterCurrent.getData();

		}

		@Override
		public void remove() {
			throw new UnsupportedOperationException();
		}
	}
}
