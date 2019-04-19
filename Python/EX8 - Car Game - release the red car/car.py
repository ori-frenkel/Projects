####################################################
# File : car.py
# Writer Ori Frenkel , ori.frenkel , 314643164
# EXERCISE : intro2cs ex8 2017-2018
# DESCRIPTION : implement Direction and Car class
# the standard output (screen) .
############################################################
# Helper class
############################################################


class Direction:
    """
    Class representing a direction in 2D world.
    You may not change the name of any of the constants (UP, DOWN, LEFT, RIGHT,
     NOT_MOVING, VERTICAL, HORIZONTAL, ALL_DIRECTIONS), but all other
     implementations are for you to carry out.
    """
    UP = 8  # Choose your own value
    DOWN = 2  # Choose your own value
    LEFT = 4  # Choose your own value
    RIGHT = 6  # Choose your own value

    NOT_MOVING = 5  # Choose your own value

    VERTICAL = (UP, DOWN)
    HORIZONTAL = (LEFT, RIGHT)

    ALL_DIRECTIONS = (UP, DOWN, LEFT, RIGHT)

############################################################
# Class definition
############################################################


class Car:
    VERTICAL = 0
    HORIZONTAL = 1
    """
    A class representing a car in rush hour game.
    A car is 1-dimensional object that could be laid in either horizontal or
    vertical alignment. A car drives on its vertical\horizontal axis back and
    forth until reaching the board's boarders. A car can only drive to an empty
    slot (it can't override another car).
    """

    def __init__(self, color, length, location, orientation):
        """
        A constructor for a Car object
        :param color: A string representing the car's color
        :param length: An int in the range of (2,4) representing the car's length.
        :param location: A list representing the car's head (x, y) location
        :param orientation: An int representing the car's orientation
        """
        # implement your code here (and then delete the next line - 'pass')
        self.color = color
        self.length = length
        self.__location = location
        self.orientation = orientation

    def get_location(self):
        """
        location getter
        """
        return self.__location

    def set_location(self, location):
        """
        location setter
        """
        self.__location = location


