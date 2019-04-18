/* Author: Ori Frenkel                                            */
/* Class Name : Library.java                                      */
/* Id: 314643164                                                  */
/* Description: A class that represent the patron                 */
/******************************************************************/

public class Library {
    int maxBookCapacity, maxBorrowedBooks, maxPatronCapacity;
    Book[] bookArray;
    Patron[] patronsArray;

    /**
     * constructor
     * @param maxBookCapacity - The maximal number of books this library can hold.
     * @param maxBorrowedBooks - The maximal number of books this library allows a single patron to borrow
     *                           at the same time.
     * @param maxPatronCapacity - The maximal number of registered patrons this library can handle.
     */
    Library(int maxBookCapacity, int maxBorrowedBooks, int maxPatronCapacity){
        this.maxBookCapacity = maxBookCapacity;
        this.maxBorrowedBooks = maxBorrowedBooks;
        this.maxPatronCapacity = maxPatronCapacity;
        this.bookArray = new Book[maxBookCapacity];
        this.patronsArray = new Patron[maxPatronCapacity];
    }

    /**
     * Adds the given book to this library, if there is place available, and it isn't already in the library.
     * @param book - The book to add to this library.
     * @return a non-negative id number for the book if there was a spot and the book was successfully added,
     * or if the book was already in the library; a negative number otherwise.
     */
    int addBookToLibrary(Book book){
        int notAdded = -1; // if the book was not added to the library return this (negative number)
        int indexToAddTheBook=-1;
        int defaultValue = -1;
        boolean keepCheckingForEmptySlot = true;
        for(int i=0; i<this.bookArray.length; i++){
            if (this.bookArray[i] == null && keepCheckingForEmptySlot){
                indexToAddTheBook = i;
                keepCheckingForEmptySlot = false; /* so if already found empty slot, stop searching for
                 another */
            }
            if(book == bookArray[i]){
                return bookArray[i].bookId; // if the book already in the book array - return book's id
            }
        }
        if(indexToAddTheBook == defaultValue){
            return notAdded; // meaning the array is full - because there is no empty index.
        }
        this.bookArray[indexToAddTheBook] = book;
        this.bookArray[indexToAddTheBook].bookId = indexToAddTheBook; /* change the default negative book id,
         to positive - the index which he is in the array */
        return book.bookId; // if the book has been successfully added, then,return the book Id
    }

    /**
     * @param patron - The patron to register to this library.
     * @return - a non-negative id number for the patron if there was a spot and the patron was successfully
     * registered, a negative number otherwise.
     */
    int registerPatronToLibrary(Patron patron){
        int notRegistered = -1; // return this if the patron was not registered
        int emptyIndexInArray=-1;
        int defaultValue = -1;
        boolean keepSearchingForEmptySlot = true;
        for(int i=0; i<this.patronsArray.length; i++){
            if(this.patronsArray[i] == null && keepSearchingForEmptySlot){
                emptyIndexInArray=i;
                keepSearchingForEmptySlot = false;
            }
            if((this.patronsArray[i] != null)&& (patron == patronsArray[i])){
                return i; /* if the patron already in the patron array then return his id (which is the index
                 in the patron array) */
            }
        }
        if(emptyIndexInArray == defaultValue){ //if the array of patrons Full - return negative number
            return notRegistered;
        }
        this.patronsArray[emptyIndexInArray] = patron;
        return emptyIndexInArray; // if the patron has been successfully added, then,return the patron Id
        //which is the index in the patron array
    }

    /**
     *
     * @param patronId - The id to check.
     * @return - true if the given number is an id of a patron in the library, false otherwise.
     */
    boolean isPatronIdValid(int patronId){
        int notInThePatronArray = -1;
        if(this.findThePatronIndexInThePatronArray(patronId) == notInThePatronArray ||
                this.patronsArray[patronId] == null){ /* if the patron id which equals the index of the patron
                 in the array is empty , then that patron not register to the library, so return false */
            return false;
        }
        return true;
    }

    /**
     *
     * @param patronId - the patron Id
     * @return - the number of books that the patron borrowed
     */
    int findTheNumberOfBooksBorrrowedByPatron(int patronId){
        int count = 0;
        for(int i=0; i<this.bookArray.length; i++){
            if (this.bookArray[i] != null && this.bookArray[i].currentBorrowerId == patronId){
                count++;

            }
        }
        return count;
    }
    /**
     *Marks the book with the given id number as borrowed by the patron with the given patron id, if this book
     *  is available, the given patron isn't already borrowing the maximal number of books allowed, and if
     *  the patron will enjoy this book.
     * @param bookId - The id number of the book to borrow.
     * @param patronId - The id number of the patron that will borrow the book.
     * @return - true if the book was borrowed successfully, false otherwise.
     */
    boolean borrowBook(int bookId, int patronId){
        if (!this.isBookIdValid(bookId) || !this.isPatronIdValid(patronId) ){
            return false; // return false if the book or the patron aren't register in the library
        }
        if((this.isBookAvailable(bookId)&& (this.patronsArray[patronId].willEnjoyBook(this.bookArray[bookId]))
                && (this.findTheNumberOfBooksBorrrowedByPatron(patronId) < this.maxBorrowedBooks))){
            this.bookArray[bookId].setBorrowerId(patronId);
            return true;
        }
        return false;
    }

    /**
     *
     * @param book - The book for which to find the id number.
     * @return - a non-negative id number of the given book if he is owned by this library, -1 otherwise.
     */
    int getBookId(Book book){
        int notOwnedByLibrary = -1;
        for(int i=0; i<this.bookArray.length; i++){
            if(this.bookArray[i] == book){
                return this.bookArray[i].bookId;
            }
        }
        return notOwnedByLibrary;
    }

    /**
     *
     * @param patron - The patron for which to find the id number.
     * @return - a non-negative id number of the given patron if he is registered to this library, -1
     * otherwise.
     */
    int getPatronId(Patron patron){
        int notRegisteredInLibrary = -1;
        for(int i=0; i<this.patronsArray.length; i++){
            if(this.patronsArray[i] == patron){
                return i; // the patron id is, the index which the patron located in the patron array
            }
        }
        return notRegisteredInLibrary;
    }

    /**
     *
     * @param bookId -The id number of the book to check.
     * @return - true if the book with the given id is available, false otherwise.
     */
    boolean isBookAvailable(int bookId){
        int outOfBoundariesIndex = -2;
        int indexInArray = outOfBoundariesIndex;
        int bookNotBorrowed = -1;
        for(int i=0; i<this.bookArray.length; i++){ // find the book index in the library array
            if(this.bookArray[i] != null && this.bookArray[i].bookId == bookId){
                indexInArray = i;
                break;
            }
        }
        if(indexInArray != outOfBoundariesIndex){
            return this.bookArray[indexInArray].currentBorrowerId == bookNotBorrowed; /* if the book id is
             good, then check if the book is borrowed or not, if not - return true */
        }
        return false;
    }

    /**
     *
     * @param bookId - The id to check.
     * @return - true if the given number is an id of some book in the library, false otherwise.
     */
    boolean isBookIdValid(int bookId){
        for(int i=0; i<this.bookArray.length; i++){
            if(bookId < 0 || bookId >= this.bookArray.length){
                return false; // if the book id is out of boundary - not in the boundaries of the book array
            }
            if(this.bookArray[i] != null && this.bookArray[i].bookId == bookId){
                return true;
            }
        }
        return false;

    }

    /**
     *
     * @param bookId - the book id
     * @return - the book index in the books array
     */
    int findTheBookIndexInBookArray(int bookId){
        int notInTheBookArray = -1;
        if(bookId<0 || bookId >= this.bookArray.length || this.bookArray[bookId] == null){
            return notInTheBookArray; // if the id is wrong - not in the book array
        }
        for(int i=0; i<this.bookArray.length; i++){
            if(this.bookArray[i].bookId == bookId){
                return i;
            }
        }
        return notInTheBookArray;
    }
    /**
     * purpose - Return the given book.
     * @param bookId - The id number of the book to return.
     */
    void returnBook(int bookId){
        int notInTheBookArray = -1;
        int notBorrowed = -1;
        int bookIndex = this.findTheBookIndexInBookArray(bookId); /* this part is a bit useless, because the
         book index in the array, is the book id, but I kept it so it would be clearer, though the function
          checks if the ID is good (in the array boundaries and if the book exist in the library ) */
        if (bookIndex != notInTheBookArray){
            int borrowedId = this.bookArray[bookIndex].currentBorrowerId;
            if(borrowedId != notBorrowed)
            {
                this.bookArray[bookIndex].returnBook();
            }

        }
    }

    /**
     *
     * @param patronIdd - the patron id
     * @return - the patron index in the patron array, if not in the array return -1
     */
    int findThePatronIndexInThePatronArray(int patronIdd){
        int notInThePatronArray = -1;
        if(patronIdd < 0 || patronIdd >= this.patronsArray.length || this.patronsArray[patronIdd] == null){
            return notInThePatronArray; /* checks if the patron id (which is the index in the patron array)
            is in the boundaries of he array, and if the array in the location empty = not register patron) */
        }
        else{
            return patronIdd; // because the patron id, is the index which the patron in, in the patron array
        }
    }

    /**
     *
     * @param patronId - The id number of the patron to suggest the book to.
     * @return - The available book the patron with the given will enjoy the most. Null if no book is
     * available.
     */
    Book suggestBookToPatron(int patronId){
        final int notInThePatronArray = -1;
        int index = this.findThePatronIndexInThePatronArray(patronId);
        int currentMaxBookScore = -1;
        int currentMaxBookScoreIndex = -1;
        int defaultValue = -1 ;
        if ((patronId < 0) || (index > this.patronsArray.length) || (index == notInThePatronArray)){
            return null; // if the patron id is wrong return null
        }
        for(int i=0; i<this.bookArray.length; i++){ /* find the book that patron will enjoy the most, if such
             exist*/
            if(this.patronsArray[index].willEnjoyBook(this.bookArray[i])&&
                    (currentMaxBookScore < this.patronsArray[index].getBookScore(this.bookArray[i]))&&
                    (this.bookArray[i].currentBorrowerId == -1) ){
                currentMaxBookScore = this.patronsArray[index].getBookScore(this.bookArray[i]);
                currentMaxBookScoreIndex = i;
            }
        }
        if (currentMaxBookScore != defaultValue){ /* if the currentMaxBookScore isn't the default value, then
         return the book with the max score (the book that the patron will enjoy the most */
            return bookArray[currentMaxBookScoreIndex];
        }
        else{
            return null;
        }

    }
}
