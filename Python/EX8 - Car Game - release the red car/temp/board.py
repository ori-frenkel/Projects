############################################################
# Imports
############################################################
import game_helper as gh
from car import Car, Direction
import math
############################################################
# Constants
############################################################

# place your constants here
ERROR_MSG_CAR_NOT_ADDED = "The car wasn't added to the board"
ERROR_MSG_LOCATION_IS_OUT_OF_BOUNDS = "The car location is out of the board"
ERROR_MSG_LOCATION_TAKEN = "The location is already been taken"
ERROR_MSG_ONLY_ONE_SQUARE = "you only can move one square at the time"
CAR_ADDED = "A car was added successfully!"
WRONG_DIRECTION = "unavail direction"
OUT_BOUNDS_MSG = "Can't move the car - out of bounds " \
                 "(can't move the car outside the table game)"
############################################################
# Class definition
############################################################



class Board():
    """
    A class representing a rush hour board.
    """

    def __init__(self, cars, exit_board, size=6):
        """
        Initialize a new Board object.
        :param cars: A list (@or dictionary) of cars. @can be empty
        :param size: Size of board (Default size is 6). 
        """
        # implement your code here (and then delete the next line - 'pass')
        self.cars = cars
        self.exit_board = exit_board
        self.size = size
        self.height = size
        self.width = size

    def get_cars(self):
        return self.cars

    def add_car(self, car):
        """
        Add a single car to the board.
        :param car: A car object
        :return: True if a car was succesfuly added, or False otherwise.
        """
        """checking if the coordination is empty, is so, add the car to the 
        board and return True, else return False"""
        if self.is_empty(car.get_location()):
            self.cars.append(car)
            print(CAR_ADDED)
            return True
        print(ERROR_MSG_CAR_NOT_ADDED)
        return False

    def is_empty(self, location):
        """
        Check if a given location on the board is free.
        :param location: x and y coordinations of location to be check
        :return: True if location is free, False otherwise
        """
        """checking if the location is empty or not, it the location empty 
        return True else return False"""
        if not 0 <= location[0] < self.size or not 0 <= location[1] < self.size:
            # out of bound
            print(OUT_BOUNDS_MSG)
            return False
        for car in self.cars:
            if car.orientation == 0:
                    x, y = location
                    x1, y1 = car.get_location()
                    if x == x1 and y == y1:
                        # location is already been taken by other car
                        return False
            elif car.orientation == 1:
                for i in range(0, car.length):
                    x, y = location
                    x1, y1 = car.get_location()
                    if x == x1 and y == y1+i:
                        # location is already been taken by other car
                        return False
        return True

    def move(self, car, direction):
        """
        Move a car in the given direction.
        :param car: A Car object to be moved.
        :param direction: A Direction object representing desired direction
            to move car.
        :return: True if movement was possible and car was moved, False otherwise.
        """
        # implement your code here (and then delete the next line - 'pass')
        new_location = car.get_location()[:]
        new_location1 = car.get_location()[:]
        new_location = list(new_location)
        lenn = car.length
        if car.orientation == 0:
            if direction == 8:
                new_location[0] -= 1
            elif direction == 2:
                new_location[0] += lenn
            else:
                print(WRONG_DIRECTION)
                return False
        elif car.orientation == 1:
            if direction == 6:
                new_location[1] += lenn
            elif direction == 4:
                new_location[1] -= 1
            else:
                print(WRONG_DIRECTION)
                return False
        if self.is_empty(new_location):
            if direction == 2:
                new_location[0] = new_location[0] - lenn + 1
            elif direction == 6:
                new_location[1] = new_location[1] - lenn + 1
            car.set_location(new_location)
            return True
        else:
            print(ERROR_MSG_LOCATION_TAKEN)
            return False

    def __repr__(self):
        """
        :return: Return a string representation of the board.
        """
        final_lst = []
        for i in range(0, self.size):
            temp_listt = []
            for i in range(0, self.size):
                temp_listt.append('_')
            final_lst.append(temp_listt)

        for car in self.cars:
            car_color = car.color
            car_location = car.get_location()
            if car.orientation == 0:
                for k in range(0, car.length):
                    x, y = car_location
                    final_lst[x+k][y] = car_color
            elif car.orientation == 1:
                for j in range(0, car.length):
                    x, y = car_location
                    final_lst[x][y+j] = car_color
        car_exit_location = self.exit_board
        x, y = car_exit_location
        final_lst[x][y] += 'E'
        return str(print_lst(final_lst))


def print_lst(final_lst):
    for i in range(0, len(final_lst)):
        print(final_lst[i])
    return ''
