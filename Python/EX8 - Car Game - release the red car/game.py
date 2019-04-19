####################################################
# File : game.py
# Writer Ori Frenkel , ori.frenkel , 314643164
# EXERCISE : intro2cs ex8 2017-2018
# DESCRIPTION : implement Game class and the main of the game(from here the
# game is run)
# the standard output (screen) .
############################################################
# Imports
############################################################
import game_helper as gh
from car import Car, Direction
from board import Board
from os import system
from random import randint

############################################################
# Class definition
############################################################
ERROR_MSG_NO_COLOR_ON_BOARD = "There is no car with such color on the board"
STARTING_MSG = "Welcome to rush Hour game"


class Game:
    """
    A class representing a rush hour game.
    A game is composed of cars that are located on a square board and a user
    which tries to move them in a way that will allow the red car to get out
    through the exit
    """

    def __init__(self, board):
        """
        Initialize a new Game object.
        :param board: An object of type board
        """
        # implement your code here (and then delete the next line - 'pass')
        self.board = board

    def __single_turn(self):
        """
        Note - this function is here to guide you and it is *not mandatory*
        to implement it. The logic defined by this function must be implemented
        but if you wish to do so in another function (or some other functions)
        it is ok.

        The function runs one round of the game :
            1. Print board to the screen
            2. Get user's input of: what color car to move, and what direction to
                move it.
            2.a. Check the the input is valid. If not, print an error message and
                return to step 2.
            2. Move car according to user's input. If movement failed (trying
                to move out of board etc.), return to step 2.
            3. Report to the user the result of current round ()
        """
        # implement your code here
        print(self.board)
        color_legal = False
        """keep runing the turn until the user put a valid color, and then 
        move the car to the desired location, if succeed to move the car return 
        true, else return false"""
        while not color_legal:
            print("what color is the car that you want to move?")
            car_color_want_to_move = input()
            for car in self.board.cars:
                if car.color == car_color_want_to_move:
                    the_car_we_want_to_move = car
                    color_legal = True

            if color_legal is False:
                print(ERROR_MSG_NO_COLOR_ON_BOARD)

        directionn = gh.get_direction()
        if board.move(the_car_we_want_to_move, directionn):
            return True
        else:
            #  print("There was a problem")
            return False

    def play(self):
        """
        The main driver of the Game. Manages the game until completion.
        :return: None
        """
        # implement your code here (and then delete the next line - 'pass')

        system('cls')
        print(STARTING_MSG)
        x, y = self.board.exit_board
        # put the red car randomly according to the exit location
        if x == (board.size - 1):
            orientation_red = 0
            # length is the length of the red car + 1
            length = 3
            location_r = (randint(0, board.size - length), y)
            red_car = Car('R', length-1, location_r, orientation_red)
            self.board.add_car(red_car)
        elif y == (self.board.size - 1):
            orientation_red = 1
            # length is the length of the red car + 1
            length = 3
            location_r = (x, randint(0, board.size - length))
            red_car = Car('R', length-1, location_r, orientation_red)
            self.board.add_car(red_car)
        # print the board with the red car on it
        print(self.board)
        """asking the user for the number of car that he wants to add to the 
        board"""
        num_of_cars_to_put_on_board = gh.get_num_cars()
        #  than add the the cars to the board according to the user input
        for i in range(0, num_of_cars_to_put_on_board):
            color, len_of_car, location_on_board, orientation = \
                gh.get_car_input(self.board.size)
            new_car = Car(color, len_of_car, location_on_board, orientation)
            board.add_car(new_car)
        red_car_exit = True
        # keep running the game until the red car exit the board
        while red_car_exit is True:
            self.__single_turn()
            x_r, y_r = red_car.get_location()
            x_e, y_e = self.board.exit_board
            """according the the red car orientation and length check if the
            red car succeed to exit the board - got to the exit coordination"""
            if red_car.orientation == 0:
                for i in range(0, red_car.length):
                    if x_r+i == x_e and y_r == y_e:
                        red_car_exit = False
            if red_car.orientation == 1:
                for j in range(0, red_car.length):
                    if x_r == x_e and y_r+j == y_e:
                        red_car_exit = False
        # print a message the the red car got out of the board
        gh.report_game_over()

############################################################
# An example usage of the game
############################################################
if __name__ == "__main__":
    board = Board([], [5,3])  # if using a dictionry of cars. use '[]' if
    # using a list
    game = Game(board)
    game.play()
