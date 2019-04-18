/* Author: Ori Frenkel                                            */
/* Class Name : Patron.java                                       */
/* Id: 314643164                                                  */
/* Description: A class that represent the patron                 */
/******************************************************************/
public class Patron {

    final String patronFirstName, patronLastName;
    int comicTendency, dramaticTendency, educationalTendency, patronEnjoymentThreshold;

    /**
     *
     * @param patronFirstName - The Patron First Name
     * @param patronLastName - The Patron Last Name
     * @param comicTendency - The Patron's Comic Tendency
     * @param dramaticTendency - The Patron's dramatic Tendency
     * @param educationalTendency - The Patrons's educational Tendency
     * @param patronEnjoymentThreshold - The minimal literary value a book must have for this patron to enjoy
     * it.
     */
    Patron(String patronFirstName, String patronLastName, int comicTendency, int dramaticTendency,
           int educationalTendency, int patronEnjoymentThreshold){
        this.patronFirstName = patronFirstName;
        this.patronLastName = patronLastName;
        this.comicTendency = comicTendency;
        this.dramaticTendency = dramaticTendency;
        this.educationalTendency = educationalTendency;
        this.patronEnjoymentThreshold = patronEnjoymentThreshold;

    }

    /**
     * @param book - The book to asses
     * @return the literary value this patron assigns to the given book.
     */
    int getBookScore(Book book){
        int totalComicValue = this.comicTendency * book.bookComicValue;
        int totalDramaticValue = this.dramaticTendency* book.bookDramaticValue;
        int totalEducationalValue = this.educationalTendency * book.bookEducationalValue;
        return (totalComicValue + totalDramaticValue + totalEducationalValue);
    }

    /**
     * @return Returns a string representation of the patron, which is a sequence of its first and last name,
     * separated by a single white space.
     */
    String stringRepresentation(){
        String patronFirstName = this.patronFirstName;
        String patronLastName = this.patronLastName;
        return (patronFirstName + " " + patronLastName);
    }

    /**
     *
     * @param book - The book that we check if the Patron would enjoy
     * @return - true of this patron will enjoy the given book, false otherwise.
     */
    boolean willEnjoyBook(Book book){
        int bookScore = this.getBookScore(book);
        if(this.patronEnjoymentThreshold < bookScore){
            return true;
        }
        else{
            return false;
        }

    }
}
