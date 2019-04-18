/**
 * @file CompareSequences.c
 * @author  Ori Frenkel <ori.frenkel@mail.huji.ac.il>
 * @version 1.0
 * @date 15/11/2018
 *
 * @brief This program is analyzing the structure of proteins
 *
 * @section LICENSE
 * This program is not a free software;
 *
 * @section DESCRIPTION
 * The program compare sequences
 * Input  : File that contain sequences
 * Process: Finding the score of alignment between each sequences
 * Output : The score of alignment between each sequence
 */
// ------------------------------ includes ------------------------------
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <errno.h>
#include <ctype.h>

// -------------------------- const definitions -------------------------
#define MSG_ERROR_OPEN_FILE "Error"
#define NUMBER_OF_LINES 200 // 100 sequences
#define NUMBER_OF_CHAR_IN_LINE 100
#define FALSE 0
#define TRUE 1
#define ERROR_ALLOCATE_MEM "cannot allocate memory"
#define ALIGNMENT_RESULT_MSG "Score for alignment of %s to %s is %d\n"
#define ERROR_NUMBER_OF_SEQ "1Error"
#define ERROR_NOT_NUMBER "2Error"
#define ERROR_USAGE "3Error"
#define MIN_NUMBER_OF_ARGUMENT 5

// ------------------------------ functions -----------------------------
/**
 *
 * @param p - pointer to allocated memory
 * exit the program if there was a problem to allocate memory.
 */
void checkAllocation(void*p)
{
    if (p == NULL)
    {
        fprintf(stderr, ERROR_ALLOCATE_MEM);
        exit(EXIT_FAILURE);
    }
}
/**
 *
 * @param a - int number
 * @param b - int number
 * @param c - int number
 * @return  - The maximum out of a,b and c
 */
int findingMax(const int a, const int b, const int c)
{
    if (a >= b && a >= c)
    {
        return a;
    }
    else if (b >= a && b >= c)
    {
        return b;
    }
    else
    {
        return c;
    }
}

/**
 * Calculate the score in the alignment table
 * @param arrAlignment - alignment table
 * @param row - the row that we want to find the score
 * @param column - the column in the alignment table that we want to find the score
 * @param match - The 'm' parameter from arguments line (math parameter)
 * @param mismatch - The 's' parameter from arguments line (mismatch parameter)
 * @param gap - The 'g' parameter from arguments line (gap parameter)
 * @param seq1 - sequence that we want to find the alignment table too
 * @param seq2 - sequence that we want to find the alignment table too
 * @return - The score in the alignment table for seq1 and seq1 in row and column as got.
 */
int findingMaxScore(int **arrAlignment, const int row, const int column, const int match,
                    const int mismatch, const int gap, const char seq1[], const char seq2[])

{
    int beside = arrAlignment[row][column-1] + gap;
    int upper = arrAlignment[row-1][column] + gap;
    int diagonal = arrAlignment[row-1][column-1];
    if (seq1[row-1] == seq2[column-1])
    {
        diagonal += match;
    }
    else
    {
        diagonal += mismatch;
    }
    int max = findingMax(beside, upper, diagonal);
    return max;

}

/**
 * Find the best score for alignment between sequence1 to sequence 2
 * @param seq1 - sequence 1
 * @param size_seq1_row - size of sequence 1
 * @param seq2 - sequence 2
 * @param size_seq2_column - size of sequence 2
 * @param m - match value (gets it from the arguments line)
 * @param s - mismatch value (gets it from the arguments line)
 * @param g - gap value  (gets it from the arguments line)
 * @return - The best score for alignment between sequence1 to sequence 2
 */
int scoreForAlignmentAlg(const char seq1[], const int size_seq1_row, const char seq2[],
                         const int size_seq2_column, const int m, const int s, const int g)

{
    // init 2d array
    int **array;
    array = (int**) calloc ((size_t) size_seq1_row + 1, sizeof(int*));
    checkAllocation(array);
    for (int i = 0; i < size_seq1_row + 1; i++)
    {
        array[i] = (int*) calloc ((size_t) size_seq2_column + 1, sizeof(int));
        checkAllocation(array[i]);
    }
    // puts the seq in array, init the array corners
    array[0][0] = 0;
    for (int row = 1; row < size_seq1_row + 1; row++)
    {
        array[row][0] = row*g;
    }
    for(int column = 1; column < size_seq2_column + 1; column++)
    {
        array[0][column] = column*g;
    }
    // calculating full table
    for(int row = 1; row < size_seq1_row + 1; row++)
    {
        for(int column = 1; column < size_seq2_column + 1; column++)
        {
            array[row][column] = findingMaxScore(array, row, column, m, s, g, seq1, seq2);
        }
    }
    int score = array[size_seq1_row][size_seq2_column];
    // freeing the array
    for (int i = 0; i < size_seq1_row + 1; i++)
    {
        free(array[i]);
    }
    free(array);

    return score;
}

/**
 * Read a file, put the file in array as one line sequence and the line after in the content of the
 * sequence
 * @param argv - The arguments line parameters in array
 * @param fileNumber - what index in the array in the file that we want to read
 * @param array_of_lines - The array that will contain lines of the file
 * @param currNumOfLines - The number of lines in the array
 */
void readFile(char *argv[], const int fileNumber,
              char *array_of_lines[NUMBER_OF_LINES + 1], int *currNumOfLines)
{
    int header = TRUE;
    FILE* fp;
    // "can assume that number of character in line no more than 100 and the number of line is
    // no more than 100"
    fp = fopen(argv[fileNumber], "r");
    if (fp == NULL)
    {
        fprintf(stderr, MSG_ERROR_OPEN_FILE);
        exit(EXIT_FAILURE);
    }
    char line[101];
    int count = 0;
    while (fgets(line, sizeof(line), fp))
    {
        line[strcspn ( line, "\r\n")] = 0;
        if(line[0] ==  '>')
        {
            header = TRUE;
            array_of_lines[count] = (char*) calloc (strlen(line) + 1, sizeof(char));
            strcpy(array_of_lines[count], line);
        }
        else
        {
            if(header == TRUE)
            {
                array_of_lines[count] = (char*) calloc(strlen(line) + 1, sizeof(char));
                strncpy(array_of_lines[count], line, strlen(line));
                header = FALSE;
            }
            else
            {

                array_of_lines[count-1] = (char*) realloc(array_of_lines[count-1],
                                           strlen(array_of_lines[count-1])*sizeof(char) +\
                                           (strlen(line))*sizeof(char));
                if(array_of_lines[count-1] == NULL)
                {
                    exit(EXIT_FAILURE);
                }
                strcat(array_of_lines[count-1], line);
                count--;
            }
        }
        count++;
        if(count >= NUMBER_OF_LINES)
        {
            break;
        }

    }
    *currNumOfLines = count;
    fclose(fp);
}

/**
 * Checks that the file is not empty / contains more than one sequences
 * @param numberOfLine - number of line (which is one line is header followed by line that in the
 * content of the sequence and repeat)
 */
void checkValidNumberOfSeq(const int numberOfLine)
{
    if(numberOfLine <= 2)
    {
        fprintf(stderr, ERROR_NUMBER_OF_SEQ);
        exit(EXIT_FAILURE);
    }
}
/**
 *
 * @param number - char array that should represent a number
 * if its not a number exit the program with error
 */
void isNumber(const char number[])
{
    int i = 0;

    //Checks for negative number as well.
    if (number[0] == '-')
    {
        i = 1;
    }
    for (; number[i] != 0; i++)
    {
        //if (number[i] > '9' || number[i] < '0'), is digit check for only on char, 0-9.
        if (!isdigit(number[i]))
        {
            fprintf(stderr, ERROR_NOT_NUMBER);
            exit(EXIT_FAILURE);
        }

    }
}
/**
 * Exit with error if the number of argument is insufficient
 * @param argc - number of argument in argument line
 */
void argumentNumbChecker(const int argc)
{
    if(argc < MIN_NUMBER_OF_ARGUMENT)
    {
        fprintf(stderr, ERROR_USAGE);
        exit(EXIT_FAILURE);
    }
}
int main(int argc, char *argv[])
{
    argumentNumbChecker(argc);
    for(int fileNumber = 1; fileNumber < argc-3; fileNumber++)
    {
        int m = 0, s = 0, g = 0;
        int *match, *mismatch, *gap;
        int curr_line = 0;
        int *currNumOfLines = &curr_line;
        match = &m, mismatch = &s, gap = &g;
        isNumber(argv[argc-3]);
        isNumber(argv[argc-2]);
        isNumber(argv[argc-1]);
        // cant be conversion error because isNumber function checks if the arguments is int.
        sscanf(argv[argc-3], "%d", match);
        sscanf(argv[argc-2], "%d", mismatch);
        sscanf(argv[argc-1], "%d", gap);

        // "can assume that number of character in line no more than 100 and the number of line is
        // no more than 100"
        char *array_of_lines[NUMBER_OF_LINES + 1];
        readFile(argv, fileNumber, array_of_lines, currNumOfLines);
        checkValidNumberOfSeq(*currNumOfLines);
        for (int line1 = 0; line1 < *currNumOfLines; line1 += 2)
        {
            int line2 = line1;
            for(; line2 < *currNumOfLines; line2 += 2)
            {
                if (line1 == line2)
                {
                    continue;
                }
                // coping only the sequence name.
                char *seq1 = (char*) calloc (strlen(array_of_lines[line1]), sizeof(char));
                checkAllocation(seq1);
                strcpy(seq1, array_of_lines[line1] + 1);
                char *seq2 = (char*) calloc (strlen(array_of_lines[line2]), sizeof(char));
                checkAllocation(seq2);
                strcpy(seq2, array_of_lines[line2] + 1);
                int score = scoreForAlignmentAlg(array_of_lines[line1 + 1],
                                                 (int) strlen(array_of_lines[line1 + 1]),
                                                 array_of_lines[line2 + 1],
                                                 (int) strlen(array_of_lines[line2 + 1]), m, s, g);
                printf(ALIGNMENT_RESULT_MSG, seq1, seq2, score);
                free(seq1), free (seq2);
                seq1 = NULL, seq2 = NULL;
            }
        }
    }


    return 0;
}