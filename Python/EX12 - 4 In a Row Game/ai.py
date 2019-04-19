############################################################
# File : ai.py
# Writer Ori Frenkel , ori.frenkel , 314643164
# EXERCISE : intro2cs ex12 2017-2018
# DESCRIPTION : ai
# game is run)
# the standard output (screen) .
############################################################

NO_POSSIBLE_MOVES_AI = "No possible AI moves"
EMPTY = "_"


class AI:

    def find_legal_move(self, g, func, timeout=None):
        final_col = EMPTY
        """Checking if there is a column that have an empty slot, if so,execute
         the func, which cause to the ai put his circle on that column"""
        for column in range(0, g.rows):
            if g.board[0][column] == EMPTY:
                final_col = column
                func(final_col)
                break
        """if the final_col is still on the default value (after checking all
         the row) that mean that there is no empty column and there for raise
          an exception (that says no possible AI moves)"""
        if final_col == EMPTY:
            raise Exception(NO_POSSIBLE_MOVES_AI)
        return final_col
