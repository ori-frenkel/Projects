
/**
 * @file AnalyzeProtein.c
 * @author  Ori Frenkel <ori.frenkel@mail.huji.ac.il>
 * @version 1.0
 * @date 26/10/2018
 *
 * @brief This program is analyzing the structure of proteins
 *
 * @section LICENSE
 * This program is not a free software;
 *
 * @section DESCRIPTION
 * The program analyzing the structure of proteins
 * Input  : PDB files that contains the information about the proteins.
 * Process: calculate the central of gravity, radius of rotation and the maximum distance between
 * atoms
 * Output : All the calculation from above and the number of atoms and the name of the file.
 */
// ------------------------------ includes ------------------------------
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <errno.h>

// -------------------------- const definitions -------------------------
#define MSG_ERROR_OPEN_FILE "Error opening file: %s\n"
#define NUMBER_OF_ARGUMENTS 1 // 1 or more
#define WRONG_NUM_ARGUMENT_EXIT_CODE 1
#define MAX_ATOM_NUMBER 20000
#define ATOM_COORDINATES 3
#define X_INDEX 0
#define Y_INDEX 1
#define Z_INDEX 2
#define ATOM_STARTING_INDEX 0
#define ATOM_LENGTH 6
#define MAX_NUMBER_OF_CHAR_TO_COMPARE 6
#define ERROR_MSG_0_ATOMS "Error - 0 atoms were found in the file %s\n"
#define MSG_USAGE_OF_PROGRAM "Usage: AnalyzeProtein <pdb1> <pdb2> ...\n"
#define MSG_LINE_TOO_SHORT "ATOM line is too short %zu characters\n"
#define LINE_LENGTH strlen(line)
#define FILE_FULL_NAME argv[fileNumber]
#define ERROR_MSG_CONVERSION "Error in coordinate conversion %s!\n"
#define FILE_INFO "PDB file %s, %d atoms were read\nCg = %.3f %.3f %.3f\nRg = %.3f\nDmax = %.3f"
#define FILE_NAME argv[fileNumber]
char const gAtom[6] = "ATOM  "; // legal line should start with ATOM followed by 2 spaces


// ------------------------------ functions -----------------------------
/**
 * This program checks if the number of arguments the program got is correct, if not, print message
 * that explain how to use the program and exit the program with failure code (anything but 0)
 * @param argc - The number of arguments that the program got.
 */
void argumentNumberChecker(int argc)
{
    if(argc < (NUMBER_OF_ARGUMENTS + 1) ) // wrong number of arguments + 1 (The program name)
    {
        fprintf(stdout, MSG_USAGE_OF_PROGRAM);
        exit(WRONG_NUM_ARGUMENT_EXIT_CODE);
    }
}

/**
 *
 * @param atomArray - array that contain each atom and his information (x,y,z)
 * @param numberOfAtoms - number of atom in the file
 * @param cgX - pointer to cgX, this var will contain the center of gravity of X
 * @param cgY - pointer to cgY, this var will contain the center of gravity of Y
 * @param cgZ - pointer to cgY, this var will contain the center of gravity of Y
 */
void centerOfGravity(float atomArray[MAX_ATOM_NUMBER][ATOM_COORDINATES], int numberOfAtoms,
                     float *cgX, float *cgY, float *cgZ)
{
    float sumX = 0;
    float sumY = 0;
    float sumZ = 0;
    for(int i = 0; i < numberOfAtoms; i++)
    {
        sumX += atomArray[i][X_INDEX];
        sumY += atomArray[i][Y_INDEX];
        sumZ += atomArray[i][Z_INDEX];
    }
    *cgX = sumX / numberOfAtoms;
    *cgY = sumY / numberOfAtoms;
    *cgZ = sumZ / numberOfAtoms;

}

/**
 * This function calculate the distance between two points
 * @param x1 - x of point 1
 * @param y1 - y of point 1
 * @param z1 - z of point 1
 * @param x2 - x of point 2
 * @param y2 - y of point 2
 * @param z2 - z of point 2
 * @return - The distance between the two points (point 1 and point 2)
 */
float distanceBetweenTwoPoints (float x1, float y1, float z1, float x2, float y2, float z2)
{
    float xTotalSquareTwo = powf((x1 - x2), 2);
    float yTotalSquareTwo = powf((y1 - y2), 2);
    float zTotalSquareTwo = powf((z1 - z2), 2);
    return sqrtf(xTotalSquareTwo + yTotalSquareTwo + zTotalSquareTwo);
}

/**
 *
 * @param atomArray - array that contain each atom and his information (x,y,z)
 * @param cgX - central of gravity of x
 * @param cgY - central of gravity of y
 * @param cgZ - central of gravity of z
 * @param numberOfAtoms - Number of atom in the file (atoms in the correct format)
 * @return - The radius of rotation
 */
float radiusOfRotation(float atomArray[MAX_ATOM_NUMBER][ATOM_COORDINATES], float cgX, float cgY,
                       float cgZ, int numberOfAtoms)
{
    float sumOfDistanceBetweenCgToPoints = 0;
    for(int i = 0; i < numberOfAtoms; i++)
    {
        float pX = atomArray[i][X_INDEX];
        float pY = atomArray[i][Y_INDEX];
        float pZ = atomArray[i][Z_INDEX];
        float distance = distanceBetweenTwoPoints(pX, pY, pZ, cgX, cgY, cgZ);
        sumOfDistanceBetweenCgToPoints += powf(distance, 2);
    }
    return sqrtf(sumOfDistanceBetweenCgToPoints / numberOfAtoms);
}

/**
 *
 * @param atomArray - atoms array that contains all the atoms and their information (x,y,z)
 * @param numberOfAtoms - Number of atom in the file (atoms in the correct format)
 * @return - The maximum distance between the atoms
 */
float dMax(float atomArray[MAX_ATOM_NUMBER][ATOM_COORDINATES], int numberOfAtoms)
{
    float maxDistance = 0;
    for(int i = 0; i < numberOfAtoms; i++)
    {
        float pX1 = atomArray[i][X_INDEX];
        float pY1 = atomArray[i][Y_INDEX];
        float pZ1 = atomArray[i][Z_INDEX];
        for(int j = 0; j < numberOfAtoms; j++)
        {
            float pX2 = atomArray[j][X_INDEX];
            float pY2 = atomArray[j][Y_INDEX];
            float pZ2 = atomArray[j][Z_INDEX];
            float currDistanceBetweenPoints = distanceBetweenTwoPoints(pX1, pY1, pZ1, pX2, pY2,
                                                                       pZ2);
            if (currDistanceBetweenPoints > maxDistance)
            {
                maxDistance = currDistanceBetweenPoints;
            }
        }
    }
    return maxDistance;
}
/**
 * This function exit the program if there was a conversion error
 * @param xOrYorZ - The char that we want to convert to float
 * @param endPtr - Reference to an already allocated object of type char*,
 * whose value is set by the function to the next character in str after the numerical value.
 * This parameter can also be a null pointer, in which case it is not used.
 */
void checkForConversionError(char xOrYorZ[256], char *endPtr)
{
    double result = 0;
    errno = 0;
    result = strtof (xOrYorZ, &endPtr);
    if(result == 0 && (errno != 0 || endPtr == xOrYorZ))
    {
        fprintf(stderr, ERROR_MSG_CONVERSION, xOrYorZ);
        exit(EXIT_FAILURE);
    }
}

int main(int argc, char *argv[])
{
    float atomArray[MAX_ATOM_NUMBER][ATOM_COORDINATES];
    int numberOfAtoms = 0;
    float cgX = 0;
    float cgY = 0;
    float cgZ = 0;
    argumentNumberChecker(argc);
    for(int fileNumber = 1; fileNumber < argc; fileNumber++)
    {
        FILE* fp;
        //char * line = NULL;
        char line[256];
        fp = fopen(argv[fileNumber], "r");
        if (fp == NULL)
        {
            fprintf(stderr, MSG_ERROR_OPEN_FILE, argv[fileNumber]);
            exit(EXIT_FAILURE);
        }
        while (fgets(line, sizeof(line), fp))
        {
            // number of atoms should not exceeding 20000
            if(numberOfAtoms >= MAX_ATOM_NUMBER)
            {
                break;
            }
            char x[256];
            char y[256];
            char z[256];
            char atomIndex[256];
            strncpy(atomIndex, (line + ATOM_STARTING_INDEX), ATOM_LENGTH);
            // add the atom coordinate, only if start with 'ATOM'
            if(strncmp(atomIndex, gAtom, MAX_NUMBER_OF_CHAR_TO_COMPARE) == 0)
            {
                if(LINE_LENGTH <= 60)
                {
                    fprintf(stderr, MSG_LINE_TOO_SHORT, LINE_LENGTH);
                    exit(EXIT_FAILURE);
                }
                char *endPtrX;
                char *endPtrY;
                char *endPtrZ;
                strncpy( x, (line + 30), 8);
                strncpy( y, (line + 38), 8);
                strncpy( z, (line + 46), 8);
                atomArray[numberOfAtoms][X_INDEX] = strtof (x, &endPtrX);
                atomArray[numberOfAtoms][Y_INDEX] = strtof (y, &endPtrY);
                atomArray[numberOfAtoms][Z_INDEX] = strtof (z, &endPtrZ);
                // Check for conversion error
                checkForConversionError(x, endPtrX);
                checkForConversionError(y, endPtrY);
                checkForConversionError(z, endPtrZ);

                numberOfAtoms++;

            }
        }
        // if number of atoms is 0, print error message,and exit.
        if (numberOfAtoms == 0)
        {
            fprintf(stderr, ERROR_MSG_0_ATOMS, FILE_FULL_NAME);
            exit(EXIT_FAILURE);
        }
        centerOfGravity(atomArray, numberOfAtoms, &cgX, &cgY, &cgZ);
        float radiusRotation = radiusOfRotation(atomArray, cgX, cgY, cgZ, numberOfAtoms);
        printf(FILE_INFO, FILE_NAME, numberOfAtoms, cgX, cgY, cgZ, radiusRotation,
               dMax(atomArray, numberOfAtoms));

        fclose(fp);
    }

}


