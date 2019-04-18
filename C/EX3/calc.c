/**
 * @file calc.c
 * @author  Ori Frenkel <ori.frenkel@mail.huji.ac.il>
 * @version 1.0
 * @date 1/12/2018
 *
 * @brief calculate arithmetic operations using postfix and infix phrase.
 *
 * @section LICENSE
 * This program is not a free software;
 *
 * @section DESCRIPTION
 * The program analyzing the structure of proteins
 * Input  : stdin - infix shape operation to calculate
 * Process: convert the infix to postfix, and calculate the arithmetic operation
 * Output : The infix and postfix strings, and the value of the arithmetic operation.
 */
// ------------------------------ includes ------------------------------
//#include "calc.h"
//#include "stack.c"
#include "stack.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <errno.h>
#include <ctype.h>
#include <stdbool.h>
#include <unistd.h>


// -------------------------- const definitions -------------------------
#define MAX_LINE_CHAR 101
#define TRUE 1
#define FALSE 0
#define DIV_BY_ZERO_MSG "Division by 0!\n"
#define EMPTY_STRING_MSG "Can't evaluate expression"
// MAX number of operator or operand
#define MAX_NUM_OF_OPERATOR_OR_OPERAND 101
#define MAX_LEN_OF_OPERAND 101
// ------------------------------ functions -----------------------------

/**
 *
 * @param str_arr_Q - string
 * @param i - the row number where the operation is located
 * @return - TRUE if it is operation, FALSE otherwise
 */
int checkIfOperatorChar(char str_arr_Q[MAX_NUM_OF_OPERATOR_OR_OPERAND][MAX_LEN_OF_OPERAND], int i)
{
    if (str_arr_Q[i][0] == '+' || str_arr_Q[i][0] == '-' || str_arr_Q[i][0] == '*' ||
        str_arr_Q[i][0] == '/' || str_arr_Q[i][0] == '^')
    {
        return TRUE;
    }
    return FALSE;
}

/**
 * help to precedence_of_operator function.
 * @param op - operations
 * @return - number that represent the precedence of the operation
 */
int valuateOp(char op)
{
    if (op == '^')
    {
        return 3;
    }
    else if (op == '*' || op == '/')
    {
        return 2;
    }
    else
    {
        return 1;
    }
}

/**
 *
 * @param op1 - char that represent operation
 * @param op2 - char that represent operation
 * @return - TRUE if op1 is more precedence operation compare to op2, otherwise FALSE
 */
int precedenceOfOperator(char op1, char op2)
{
    int val_op1 = 0;
    int val_op2 = 0;
    // operators are +, -, *, /, ^
    val_op1 = valuateOp(op1);
    val_op2 = valuateOp(op2);
    if(val_op1 <= val_op2)
    {
        return TRUE;
    }
    return FALSE;

}

void leftParenthesis(Stack *stack, char p[MAX_NUM_OF_OPERATOR_OR_OPERAND][MAX_LEN_OF_OPERAND], int *row)
{
    char top[101];
    peek(stack, top);
    while(!isEmptyStack(stack) && strncmp(top, "(", 1) != 0)
    {
        char poped_value[101];
        pop(stack, poped_value);
        strcpy(p[*row], poped_value);
        (*row)++;
        peek(stack, top);
    }
    // meaning is stopped because there is '(' at the top of stack
    if(!isEmptyStack(stack))
    {
        pop(stack, top);
    }
}

void elseNotEmptyAndTopNotLeftPar(Stack *stack, char top[101],
                                  char str_arr_Q[MAX_NUM_OF_OPERATOR_OR_OPERAND][MAX_LEN_OF_OPERAND]
                                  , int *row, char p[101][MAX_LEN_OF_OPERAND], int i)
{
    while(!isEmptyStack(stack) && strncmp(top, "(", 1) != 0 &&
          precedenceOfOperator(str_arr_Q[i][0], top[0]))
    {
        char poped_value[101];
        pop(stack, poped_value);
        strcpy(p[*row], poped_value);
        (*row)++;
        if(!isEmptyStack(stack))
        {
            peek(stack, top);
        }

    }
    push(stack, str_arr_Q[i]);
}

/**
 * Convert infix to postfix
 * @param str_arr_Q - string that represent the postfix shape
 * @param number_of_lines - number of lines(rows) in the postfix string array (str_arr_Q)
 * @param row_out_side - pointer to int outside the function.
 * @param p - array to put in the postfix string array.
 */
void infixToPostfix(char str_arr_Q[MAX_NUM_OF_OPERATOR_OR_OPERAND][MAX_LEN_OF_OPERAND],
                    int number_of_lines, int *row_out_side,
                    char p[MAX_NUM_OF_OPERATOR_OR_OPERAND][MAX_LEN_OF_OPERAND])
{
    Stack *stack = stackAlloc(101);
    int row = 0;
    for(int i = 0; i < number_of_lines; i++)
    {
        if(isdigit(str_arr_Q[i][0]))
        {
            strcpy(p[row], &str_arr_Q[i][0]);
            row++;
        }
        else if (str_arr_Q[i][0] == '(')
        {
            push(stack, "(");
        }
        else if(str_arr_Q[i][0] == ')')
        {
            leftParenthesis(stack, p, &row);
        }
        else if (checkIfOperatorChar(str_arr_Q, i))
        {
            char top[101];
            if(!isEmptyStack(stack))
            {
                peek(stack, top);
            }
            if(isEmptyStack(stack))
            {
                push(stack, &str_arr_Q[i][0]);
            }
            else if(strncmp(top, "(", 1) == 0)
            {
                push(stack, &str_arr_Q[i][0]);
            }
            else
            {
                elseNotEmptyAndTopNotLeftPar(stack, top, str_arr_Q, &row, p, i);
            }

        }

    }
    while(!isEmptyStack(stack))
    {
        char head_st[101];
        pop(stack, &head_st);
        strcpy(p[row], head_st);
        row++;
    }
    *row_out_side = row;
}

/**
 * check for division by 0
 * @param B - number that we divide by
 */
void divisionBy0(int B)
{
    if (B == 0)
    {
        fprintf(stderr, DIV_BY_ZERO_MSG);
        exit(EXIT_FAILURE);
    }
}

/**
 * get operation and 2 operand, and apply the operation on the operands.
 * @param op - char that representing an operation
 * @param A - operand (number to do on it the operation)
 * @param B - operand
 * @return - The result of applying the operation on A and B
 */
long evaluate(char op, const long A, const long B)
{
    // operators are +, -, *, /, ^
    if(op == '+')
    {
        return (A + B);
    }
    else if (op == '-')
    {
        return (A - B);
    }
    else if (op == '*')
    {
        return (A * B);
    }
    else if (op == '/')
    {
        divisionBy0((int)B);
        return (A / B);
    }
    else if (op == '^')
    {
        return (A ^ B);
    }
    else
    {
        fprintf(stderr, "problem here"); // shouldn't be get here.
    }

    return 0;

}

/**
 * get a postfix shape string, and return the computation of the string.
 * @param p - postfix string
 * @param row - number of rows in the postfix string array
 * @return - the value of the arithmetic operation
 */
int valueFinderPostfixShape(char p[MAX_NUM_OF_OPERATOR_OR_OPERAND][MAX_LEN_OF_OPERAND], int row)
{
    Stack *stack = stackAlloc(sizeof(char[MAX_LINE_CHAR]));
    for(int i = 0; i < row; i++)
    {
        if(isdigit(p[i][0]))
        {
            push(stack, p[i]);
        }
        else if (checkIfOperatorChar(p, i))
        {
            char A_string[MAX_LINE_CHAR], B_string[MAX_LINE_CHAR];
            char *endPtrA;
            char *endPtrB;
            long A, B;
            pop(stack, &B_string);
            pop(stack, &A_string);
            A = strtol(A_string, &endPtrA, 10);
            B = strtol(B_string, &endPtrB, 10);
            long C = evaluate(p[i][0],  A, B);
            char C_in_string[100];
            sprintf(C_in_string, "%ld", C);
            push(stack, C_in_string);
        }
        else
            // shouldn't get here
        {
            fprintf(stderr, "ERROR 1");
        }
    }
    char final_result_in_str[MAX_LINE_CHAR];
    pop(stack, &final_result_in_str);
    char *end_ptr_final_result;
    long final_result;
    final_result = strtol(final_result_in_str, &end_ptr_final_result, 10);
    return (int)final_result;
}

/**
 * get string and remove all the spaces
 * @param source - string
 */
void removeSpaces(char* source)
{
    char* i = source;
    char* j = source;
    while(*j != 0)
    {
        *i = *j++;
        if(*i != ' ')
        {
            i++;
        }

    }
    // adding \0 at the end.
    *i = 0;
}
/**
 * print array of string in postfix or infix
 * @param final_str - string to print
 * @param number_of_lines - number of rows in string array
 * @param postfix - if to print is postfix (TRUE/FALSE) (1/0)
 */
void printWithSpaces(char final_str[MAX_NUM_OF_OPERATOR_OR_OPERAND][MAX_LEN_OF_OPERAND],
                     int number_of_lines, int postfix)
{
    if(postfix)
    {
        printf("Postfix: ");
    }
    else
    {
        printf("Infix: ");
    }
    for(int i = 0; i < number_of_lines; i++)
    {
        if(isdigit(final_str[i][0]))
        {
            printf(" %s ", final_str[i]);
        }
        else
        {
            printf("%c", final_str[i][0]);
        }
    }
    printf("\n");
}

/**
 * Checks if string is only with spaces
 * @param s - string
 * @return - 0 is empty (only white space) 1 otherwise
 */
int isEmpty(const char *s)
{
    while (*s != '\0')
    {
        if (!isspace((unsigned char)*s))
        {
            return 0;
        }

        s++;
    }
    return 1;
}

int main()
{
    char  line[MAX_LINE_CHAR];
    // operators are +, -, *, /, ^
    while(fgets(line, MAX_LINE_CHAR, stdin))
    {
        if(isEmpty(line))
        {
            fprintf(stderr, EMPTY_STRING_MSG);
            exit(EXIT_FAILURE);
        }
        removeSpaces(line);
        char final_str[MAX_NUM_OF_OPERATOR_OR_OPERAND][MAX_LEN_OF_OPERAND];
        int str_num = 0;
        int num_len = 0;
        int line_counter = 0;
        for(int i = 0; i < (int)strlen(line); i++)
        {
            if(line[i] == ' ')
            {
                continue;
            }

            if(isdigit(line[i]))
            {
                num_len++;
            }
            else
            {
                if(isdigit(line[i - 1]))
                {
                    strncpy(final_str[str_num], &line[i-num_len], (size_t) num_len);
                    strcat(final_str[str_num], "\0");
                    str_num++;
                    num_len = 0;
                    line_counter++;
                }
                line_counter++;
                strncpy(final_str[str_num], &line[i], 1);
                str_num++;
            }
        }
        line_counter--;
        // print infix shape
        printWithSpaces(final_str, line_counter, FALSE);
        int row_out_side = 0;
        char p[MAX_NUM_OF_OPERATOR_OR_OPERAND][MAX_LEN_OF_OPERAND];
        infixToPostfix(final_str, line_counter, &row_out_side, p);
        // print postfix shape
        printWithSpaces(p, row_out_side, TRUE);
        printf("The value is %d\n", valueFinderPostfixShape(p, row_out_side));
        fflush(stdout);
    }
    return 0;
}
