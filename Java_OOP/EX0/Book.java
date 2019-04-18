/* Author: Ori Frenkel                                            */
/* Class Name : Book.java                                         */
/* Id: 314643164                                                  */
/* Description: A class that demonstrate a book                   */
/******************************************************************/
public class Book {
    final String bookTitle, bookAuthor;
    final int bookYearOfPublication;
    final int notInLibrary = -2;
    int  bookComicValue, bookDramaticValue, bookEducationalValue, bookId;
    int currentBorrowerId; // the borrower Id, -1 if has no borrower

    /**
     *
     * @param bookTitle - the book title
     * @param bookAuthor - the book author
     * @param bookYearOfPublication - what year the book has been published
     * @param bookComicValue - each book has cosmic value
     * @param bookDramaticValue - each book has dramatic value
     * @param bookEducationalValue - each book has educational value
     */
    Book(String bookTitle, String bookAuthor, int bookYearOfPublication,
         int bookComicValue, int bookDramaticValue, int bookEducationalValue){
        this.bookTitle = bookTitle;
        this.bookAuthor = bookAuthor;
        this.bookYearOfPublication = bookYearOfPublication;
        this.bookComicValue = bookComicValue;
        this.bookDramaticValue = bookDramaticValue;
        this.bookEducationalValue = bookEducationalValue;
        this.currentBorrowerId = -1; // -1 means that the book isn't borrowed, and that's by default
        this.bookId = notInLibrary; // default value - not in library
    }

    /**
     * @return the literary value of this book, which is defined as the sum of its comic value, its dramatic
     * value and its educational value.
     */
    int getLiteraryValue() {
        int sumOfValues = 0;
        sumOfValues += this.bookComicValue + this.bookDramaticValue + this.bookEducationalValue;
        return sumOfValues;
    }

    /**
     * @return the String representation of this book.
     */
    String stringRepresentation(){
        String finalRepresentation="";
        int finalValue = this.getLiteraryValue();
        finalRepresentation += "[" + this.bookTitle + "," + this.bookAuthor + "," + this.bookYearOfPublication
                + "," + finalValue + "]";
        return finalRepresentation;
    }

    /**
     * This Function sets the given id as the id of the current borrower of this book, -1 if no patron is
     * currently borrowing it.
     */
    void setBorrowerId(int borrowerId){
        this.currentBorrowerId = borrowerId;
    }

    /**
     * @return the book's borrower Id
     */
    int getCurrentBorrowerId(){
        return this.currentBorrowerId;
    }

    /**
     * This function Marks this book as returned.
     */
    void returnBook(){
        int bookIsReturned = -1;
        this.setBorrowerId(bookIsReturned);
    }
}
