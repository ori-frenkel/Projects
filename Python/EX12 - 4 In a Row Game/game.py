############################################################
# File : game.py
# Writer Ori Frenkel , ori.frenkel , 314643164
# EXERCISE : intro2cs ex12 2017-2018
# DESCRIPTION : the game logic and the game itself
# game is run)
# the standard output (screen) .
############################################################
from tkinter import *
from tkinter import font
from ai import AI

ESSENTIAL_TO_WIN = 4
EMPTY = "_"
ILLEGAL_MOVE = "Illegal move."
PLAYER_ONE = 0  # Blue Color
PLAYER_TWO = 1  # Red color
DRAW = 2
BLUE = "B"
RED = "R"
COLS = 6
ROWS = 7
NO = 0
YES = 1


def color_to_player_converter(color):
    """get a color and return the player whom it belongs"""
    if color == BLUE:
        return Game.PLAYER_ONE
    else:
        return Game.PLAYER_TWO


class Game:
    PLAYER_ONE = 0
    PLAYER_TWO = 1
    DRAW = 2
    COLS = 6
    ROWS = 7
    BLUE = "B"
    RED = "R"
    YES = 1
    EMPTY = "_"

    def __init__(self):
        # constructor
        self.cols = COLS
        self.rows = ROWS
        self.win = ESSENTIAL_TO_WIN
        self.board = self.board_creator()
        self.current_player = PLAYER_ONE
        self.game_over = NO

    def board_creator(self):
        """Create a board of 7 rows and 6 columns"""
        board = [[EMPTY] * self.rows for _ in range(self.cols)]
        return board

    def make_move(self, column):
        """Make a move in the game, meaning put the color of the car in the
        column that been asked for"""
        current_player_is = self.get_current_player()
        if current_player_is == Game.PLAYER_ONE:
            color = BLUE
        else:
            color = RED
        new_disk_pos = self.board
        """if the game is over or the column is full on the coulmn is out of
         board, raise Exception of Illegal move"""
        if column > COLS or new_disk_pos[0][column] != EMPTY or self.game_over \
                == YES:
            raise Exception(ILLEGAL_MOVE)
        indx = -1
        while new_disk_pos[indx][column] != EMPTY:
            indx -= 1
        new_disk_pos[indx][column] = color
        # After one player made a move, move the turn to the other player
        if self.current_player == Game.PLAYER_ONE:
            self.current_player = Game.PLAYER_TWO
        else:
            self.current_player = Game.PLAYER_ONE
        if self.get_winner() is not None:
            self.game_over = YES

    def get_winner_helper(self, player):
        if player == Game.PLAYER_ONE:
            color = BLUE
        else:
            color = RED
        # check horizontal spaces
        for y in range(self.rows):
            for x in range(self.cols - 3):
                if self.board[x][y] == color and self.board[x + 1][
                    y] == color and \
                                self.board[x + 2][y] == color and \
                                self.board[x + 3][y] == color:
                    print("hello")
                    self.game_over = YES
                    # do the 'color+color' to mark the winning sequences
                    self.board[x][y] = color + color
                    self.board[x + 1][y] = color + color
                    self.board[x + 2][y] = color + color
                    self.board[x + 3][y] = color + color
                    return color_to_player_converter(color)

        # check vertical spaces
        for x in range(self.cols):
            for y in range(self.rows - 3):
                if self.board[x][y] == color and self.board[x][
                            y + 1] == color \
                        and self.board[x][y + 2] == color and \
                                self.board[x][y + 3] == color:
                    self.game_over = YES
                    # do the 'color+color' to mark the winning sequences
                    self.board[x][y] = color + color
                    self.board[x][y + 1] = color + color
                    self.board[x][y + 2] = color + color
                    self.board[x][y + 3] = color + color
                    return color_to_player_converter(color)

        # check / diagonal spaces
        for x in range(self.cols - 3):
            for y in range(3, self.rows):
                if self.board[x][y] == color and self.board[x + 1][
                            y - 1] == color and \
                                self.board[x + 2][y - 2] == color and \
                                self.board[x + 3][
                                            y - 3] == color:
                    self.game_over = YES
                    # do the 'color+color' to mark the winning sequences
                    self.board[x][y] = color + color
                    self.board[x + 1][y - 1] = color + color
                    self.board[x + 2][y - 2] = color + color
                    self.board[x + 3][y - 3] = color + color
                    return color_to_player_converter(color)

        # check \ diagonal spaces
        for x in range(self.cols - 3):
            for y in range(self.rows - 3):
                if self.board[x][y] == color and self.board[x + 1][
                            y + 1] == color and \
                                self.board[x + 2][y + 2] == color and \
                                self.board[x + 3][
                                            y + 3] == color:
                    self.game_over = YES
                    # do the 'color+color' to mark the winning sequences
                    self.board[x][y] = color + color
                    self.board[x + 1][y + 1] = color + color
                    self.board[x + 2][y + 2] = color + color
                    self.board[x + 3][y + 3] = color + color
                    return color_to_player_converter(color)

        for x in range(self.cols):
            # Checking if the board is full, if not, then return None
            for y in range(self.rows):
                if self.board[x][y] == EMPTY:
                    return None

        """if there is no 4 sequence and there is no empty slot, then the game
         is over with draw"""
        self.game_over = YES
        return Game.DRAW

    def get_winner(self):
        """if player one didn't won or had a draw, then return if player two
         won, if not, return what happen (draw or the board isn't full)"""
        player_one_status = self.get_winner_helper(Game.PLAYER_ONE)
        if player_one_status is None:
            return self.get_winner_helper(Game.PLAYER_TWO)
        else:
            """if player one won or had a draw with player two, then return
             player one if he won the game, or draw if there was a draw"""
            return player_one_status

    def get_player_at(self, row, col):
        """return the the player in a certain row and col, if empty, return
        None"""
        if self.board[row][col] == BLUE:
            return Game.PLAYER_ONE
        if self.board[row][col] == RED:
            return Game.PLAYER_TWO
        else:
            return None

    def get_current_player(self):
        if self.current_player == PLAYER_ONE:
            return Game.PLAYER_ONE
        else:
            return Game.PLAYER_TWO

    def print_lst(self):
        """This function the list as matrix/ board"""
        for i in range(0, len(self.board)):
            print(self.board[i])
        return ''


def print_lst(final_lst):
    """This function the list as matrix/ board"""
    for i in range(0, len(final_lst)):
        print(final_lst[i])
    return ''


if __name__ == "__main__":
    root = Tk()
    root.resizable(width=FALSE, height=FALSE)
    root.geometry("728x624")
    root.configure(bg="white")
    root.title("Connect Four | Logan Wu")
    columns = []
    george = Game()
    ai = AI()
    ai.find_legal_move(george, george.make_move)
    george.make_move(1)
    george.make_move(2)
    george.make_move(0)
    george.make_move(1)
    print(george.get_winner())
    print(print_lst(george.board))
    # print(george.board[5][1])
    """print(george.board[row][column]) board[עמודה][שורה]"""
