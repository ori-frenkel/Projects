package filesprocessing;
import filesprocessing.exceptions.*;
import filesprocessing.filters.Filter;
import java.io.IOException;
import java.io.File;
import java.util.ArrayList;
import java.util.Collections;

/**
 * This is the main class which include the main method.
 * This class gets the args (location of the commandFile and the Source dir) and return the files names
 * according to the command files.
 */
public class DirectoryProcessor {
	private final static int EXPECTED_NUMBER_OF_ARGS = 2;
	/* The source dir index in the args array */
	private final static int SOURCE_DIR = 0;
	/* The command file dir index in the args array */
	private final static int COMMAND_FILE = 1;

	public static void main(String[] args) {
		try{
			// checks that the number of arg is correct
			if (args.length != EXPECTED_NUMBER_OF_ARGS){
				throw new WrongNumberOfArgsMyException();
			}
			// String that represent the path of the source dir
			String sourceDirPath = args[SOURCE_DIR];
			// The given directory
			File file = new File(sourceDirPath);
			// Array of all the files that in the given directory
			File[] arrOfAllFiles = file.listFiles();
			// String that represent the path of the command file
			String commandFilePath = args[COMMAND_FILE];
			// Convert the command file to section array list.
			ScanAndSection scanAndSectionObject = new ScanAndSection(commandFilePath);
			ArrayList<Section> sections = scanAndSectionObject.ConvertToSections();
			// if the array is empty, there is nothing to do, so exit
			if(arrOfAllFiles == null){
				return;
			}
			// run on each section and print error from type 1, and than the right files.
			for (Section currentSection : sections){
				// print warring ( the lines that type 1 been occurred)
				printErrorTypeOne(currentSection);
				// print the right file according to the command file.
				printTheRightFiles(currentSection,arrOfAllFiles);

			}
		}
		// if there is a type 2 error, print the right msg and exist.
		catch (WrongNumberOfArgsMyException| OrderSubSectionException | FilterSubSectionException |
				MissingFilterUnderFilterException error){
			System.err.println(error.GET_ERROR_MSG());
		}
		catch (IOException error){
			System.err.println("ERROR: IO Exception been occurred");
		}
		// when the command file is empty, exist without print or give any error
		catch (EmptyCommandFileException error){
			// do nothing, just exit the program
		}
	}

	/*
	This function get section and print the lines that type 1 error been occurred
	 */
	private static void printErrorTypeOne(Section section){
		// if type 1 error occurred under 'FILTER' print the line that happened
		if(section.getFilterTypeOneError() != Section.None){
			System.err.println("Warning in line " + section.getFilterTypeOneError());
		}
		// if type 1 error occurred under 'ORDER' print the line that happened
		if(section.getOrderTypeOneError() != Section.None){
			System.err.println("Warning in line " + section.getOrderTypeOneError());
		}

	}

	/*
	This function gets the section and array of all the files and print the right files (according to the
	order and filer)
	 */
	private static void printTheRightFiles(Section section, File[] files){
		// Array list of all the files that passed the filter
		ArrayList<File> filteredFiles = section.getFilter().handleFilter(files);

		// Sort the files using the order found in the section.
		Collections.sort(filteredFiles, section.getOrder());
		// Print the wanted files according to the given section.
		for (File file : filteredFiles){
			System.out.println(file.getName());
		}
	}

}
