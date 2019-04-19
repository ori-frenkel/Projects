############################################################
# File : four_in_a_row.py
# Writer Ori Frenkel , ori.frenkel , 314643164
# EXERCISE : intro2cs ex12 2017-2018
# DESCRIPTION : GUI and the main run
# game is run)
# the standard output (screen) .
############################################################
from tkinter import *
from communicator import Communicator
from game import Game
from ai import AI
import sys

ARGUMENTS_ERROR = "Illegal program arguments."
HUMAN_OR_AI = 1
PORT = 2
IP = 3
NEW_GAME = "New Game"


class GUI:
    ELEMENT_SIZE = 50
    MESSAGE_DISPLAY_TIMEOUT = 250
    GRID_COLOR = "#AAA"
    PLAYER_1_COLOR = "blue"
    PLAYER_2_COLOR = "red"
    RED_WIN_COLOR = "#B22222"
    BLUE_WIN_COLOR = "#008080"
    DEFAULT_COLOR = "white"
    BACKGROUND_COLOR = "green"

    def __init__(self, root, game, human_or_ai, port=None, ip=None):
        """
        Initializes the GUI and connects the communicator.
        :param parent: the tkinter root.
        :param ip: the ip to connect to.
        :param port: the port to connect to.
        :param server: true if the communicator is a server, otherwise false.
        """
        self.game = game
        self.ai = AI()
        self.root = root
        if human_or_ai:
            self.ai_on = False
        else:
            self.ai_on = True
        self.ip = ip
        self.port = port
        self.my_turn = True
        """The top image in the gui"""
        image_path = r"intro2cs.gif"
        photo = PhotoImage(file=image_path)
        label = Label(image=photo)
        label.image = photo  # keep a reference
        label.grid(row=0, column=0, pady=10)

        self.canvas = Canvas(root, width=200, height=50,
                             background=self.BACKGROUND_COLOR,
                             highlightthickness=0, )
        self.canvas.grid(row=2)

        self.current_player_var = StringVar(self.root, value="")
        self.currentPlayerLabel = Label(self.root,
                                        textvariable=self.current_player_var,
                                        anchor=W)
        self.currentPlayerLabel.grid(row=3)
        """when the user click on the canvas do action according to the
         _action_when_canvas_clicked function"""
        self.canvas.bind('<Button-1>', self._action_when_canvas_clicked)
        self.new_game()

        self.__communicator = Communicator(root, port, ip)
        self.__communicator.connect()
        self.__communicator.bind_action_to_message(self.__handle_message)

    def __handle_message(self, text=None):
        """
        Specifies the event handler for the message getting event in the
        communicator. Prints a message when invoked (and invoked by the
        communicator when a message is received). The message will
        automatically disappear after a fixed interval.
        :param text: the text to be printed.
        :return: None.
        """
        """If got a text - column, do that move in the self board, so the
         opponent board and the self board would be synchronized"""
        if text:
            self.game.make_move(int(text[0]))
            """The enemy made his turn, and now self.my_turn should changed to
             true and so on the current_player indicator in the gui"""
            self.my_turn = not self.my_turn
            self.current_player_var.set('Current player: ' + "Your Turn")
        if self.ai_on and self.game.game_over != self.game.YES:
            self.make_ai_move()
        # draw the board again after all the changes has been made
        self.draw()

    def draw(self):
        """Draw all the board with the disks and there's color"""
        """The two for loop runs on all the game.board and create disks
         according to the situation in the board"""
        for c in range(self.game.cols, -1, -1):
            """changes the board direction so the disks would be at the
             bottom and not at the top"""
            self.game.board = self.game.board[::-1]
            for r in range(self.game.rows, -1, -1):
                if r >= self.game.cols:
                    continue

                x0 = c * self.ELEMENT_SIZE
                y0 = r * self.ELEMENT_SIZE
                x1 = (c + 1) * self.ELEMENT_SIZE
                y1 = (r + 1) * self.ELEMENT_SIZE
                """Create each disk according to the game board, if at the
                 location the board is empty, then create disk with the
                  default color - white, else - create the disk red/blue if
                  the board at that location is red/blue """
                if self.game.board[r][c] == self.game.BLUE:
                    fill = self.PLAYER_1_COLOR
                elif self.game.board[r][c] == self.game.RED:
                    fill = self.PLAYER_2_COLOR
                elif self.game.board[r][c] == self.game.RED + self.game.RED:
                    fill = self.RED_WIN_COLOR
                elif self.game.board[r][c] == self.game.BLUE + self.game.BLUE:
                    fill = self.BLUE_WIN_COLOR
                else:
                    fill = self.DEFAULT_COLOR
                self.canvas.create_oval(x0 + 2,
                                        self.canvas.winfo_height() - (y0 + 2),
                                        x1 - 2,
                                        self.canvas.winfo_height() - (y1 - 2),
                                        fill=fill, outline=self.GRID_COLOR)
            self.game.board = self.game.board[::-1]

        if self.game.game_over == self.game.YES:
            """If the game is over, checks who won/lose/draw and print to the
             canvas message that says that"""
            text_width = text_height = self.canvas.winfo_height() / 2
            # giving default win msg
            win_msg = ""
            # checks if there was a draw
            if self.game.get_winner() == self.game.DRAW:
                win_msg = "There Was a :" + "\n" + "Draw"
                """if when the game is over, the gui current var is
                 "your turn" that mean the you lost the game """
            elif self.current_player_var.get() == "Current player: Your Turn":
                win_msg = "You Lost" + "\n" + "The Game"
            elif self.current_player_var.get() ==\
                    "Current player: The Enemy Turn":
                win_msg = "You Won" + "\n" + "The Game"
            self.canvas.create_text(text_height, text_width,
                                    text=win_msg,
                                    font=("Helvetica", 32),
                                    fill="black")

    def draw_grid(self):
        """Draw the grid"""
        x0, x1 = 0, self.canvas.winfo_width()
        for r in range(1, self.game.rows):
            y = r * self.ELEMENT_SIZE
            self.canvas.create_line(x0, y, x1, y, fill=self.GRID_COLOR)

        y0, y1 = 0, self.canvas.winfo_height()
        for c in range(1, self.game.cols + 1):
            x = c * self.ELEMENT_SIZE
            self.canvas.create_line(x, y0, x, y1, fill=self.GRID_COLOR)

    def drop(self, column):
        """Make the move with on the game board with the given column
        and send a message to the opponent about the move that he just made,
        so the opponent gui board would be updated and update the current turn
         in the gui"""
        if self.game.board[0][column] == self.game.EMPTY:
            self.current_player_var.set('Current player: ' + "The Enemy Turn")
            self.__communicator.send_message(str(column))
            return self.game.make_move(column)
        else:
            return

    def new_game(self):
        """Create the new game"""
        self.game = Game()

        self.canvas.delete(ALL)
        self.canvas.config(width=self.ELEMENT_SIZE * self.game.rows,
                           height=self.ELEMENT_SIZE * self.game.cols)
        self.root.update()
        self.draw_grid()
        self.draw()

    def _action_when_canvas_clicked(self, event):
        """This function responsible for the action that happens, when the user
         click the board (the canvas)"""
        # do something only if its my_turn
        if self.my_turn:
            if self.game.game_over:
                # when the game is over, click would do nothing
                return

            c = event.x // self.ELEMENT_SIZE
            """if it the client/server my_turn is true, and the client/server
             clicked on a column then put the disk in that column"""
            if 0 <= c < self.game.rows:
                if not self.ai_on:
                    self.drop(c)
                """After the client/server did his turn, his turn expired and
                 changed to false, because after he did his move, the enemy
                 move has come"""
                self.my_turn = not self.my_turn
                # draw the board after the move has been made
                self.draw()
        return

    def make_ai_move(self):
        """Do the ai move """
        if self.game.game_over == self.game.YES:
            return
        column = self.ai.find_legal_move(self.game,
                                         self.game.make_move)
        self.__communicator.send_message(str(column))
        # update the turn on display (on the GUI)
        self.current_player_var.set('Current player: ' + "The Enemy Turn")
        self.draw()


def check_args(argv):
    """Checks if the number or arguments is correct and that the port number
     is correct as well"""
    if len(argv) < 3 or len(argv) > 4:
        print(ARGUMENTS_ERROR)
        return False
    if int(argv[PORT]) > 65535:
        print(ARGUMENTS_ERROR)
        return False
    if argv[HUMAN_OR_AI] == "is_human" or argv[HUMAN_OR_AI] == "ai":
        """Checks if the first arguments is human or ai, if so return True"""
        return True
    print(ARGUMENTS_ERROR)
    return False


def main(argv):
    """Call a function that checks if the arguments are ok, if there is a
     problem with the arguments return nothing, meaning the program won't run
     and would print an error message according to the check_args function"""
    if not check_args(argv):
        return
    # create new game object
    new_game = Game()
    root = Tk()
    server = False
    if len(sys.argv) == 3:
        """Checks if got 2 arguments+1 or 3 arguments+1 (3 or 4) if got 3 - 
        Meaning got no ip, so it's the server, if got not 3 which equals to 4
         (because I have checked in the arguments check function for wrong
          number ot arguments) so 4 meaning got ip - then it the client """
        server = True
    human = False
    if argv[HUMAN_OR_AI] == "is_human":
        # if you are human or ai
        human = True
    if server:
        # create gui object according to the arguments, is server with no ip
        gui_server = GUI(root, new_game, human, int(sys.argv[PORT]))
        root.title("Server")
        gui_server.current_player_var.set('Current player: ' + "Your Turn")
        if not human:
            # if the server is ai, make the first move as ai
            gui_server.make_ai_move()
    else:
        """if got ip, create GUI object with that ip - so whould be able to
         connect to the server"""
        gui_client = GUI(root, new_game, human, int(sys.argv[PORT]),
                         sys.argv[IP])
        """change the my_turn to false in order to make the server be the
         first to start the game (the first turn belongs to the server)"""
        gui_client.my_turn = False
        """current_player_var so in the gui of the client at the start of the
         game would be write that the current turn is of the enemy, because
          the server start"""
        gui_client.current_player_var.set('Current player: ' + "Enemy Turn")
        root.title("Client")
    root.mainloop()


if __name__ == '__main__':
    main(sys.argv)
