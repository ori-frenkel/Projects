####################################################
# File : hangman.py
# Writer Ori Frenkel , ori.frenkel , 314643164
# EXERCISE : intro2cs ex4 2017-2018
# DESCRIPTION : A hangman game
# the standard output (screen) .
####################################################
import hangman_helper
CHAR_A = 97


def letter_to_index(letter):
    """Return the index of the given letter in an alphabet list."""
    return ord(letter.lower()) - CHAR_A


def index_to_letter(index):
    """Return the letter corresponding to the given index"""
    return chr(index + CHAR_A)


def update_word_pattern(word, pattern, letter):
    """converting the strings word and letter to a list because string is"""
    """immutable"""
    word = list(word)
    pattern = list(pattern)
    """Checking every index in the word, if a certain index in word is the """
    """same character as in the letter, it will update the pattern"""
    """and the pattern would include the character(letter) in this index"""
    for i in range(len(word)):
        if letter == word[i]:
            pattern[i] = letter
    """at the end converting again the pattern from list to string"""
    return ''.join(pattern)


def gameover(pattern):
    """Checking if the game is over, meaning all the pattern has been """
    """revealed or the pattern is not revealed"""
    if '_' in pattern:
        return True
    else:
        return False


def already_chosen(input_t, chosen_letter_lst):
    """Checking if the letter in the input already been chosen"""
    """transfer it to set and than to list in order to remove duplicate"""
    """letters"""
    chosen_letter_lst = set(chosen_letter_lst)
    chosen_letter_lst = list(chosen_letter_lst)
    for i in range(0, len(chosen_letter_lst)):
        if chosen_letter_lst[i] == input_t:
            return True
    return False


def letter_in_word(input_t, word):
    """Checking if letter is in the word"""
    pattern = list(word)
    for i in range(0, len(word)):
        if pattern[i] == input_t:
            return True
    return False


def is_it_contain(word, wrong_guess_lst):
    """Check if the word contain a Letter from the wrong guess list"""
    for i in range(len(wrong_guess_lst)):
        for j in range(len(word)):
            if wrong_guess_lst[i] == word[j]:
                return True
    return False


def same_letter_same_index(word, pattern):
    """Checking if every revealed letter in the pattern is in the word at"""
    """the same index"""
    """at if a word repeat """
    list_t = []
    for i in range(len(pattern)):
        if pattern[i] != '_' and word[i] == pattern[i]:
            list_t += word[i]
            continue
        elif pattern[i] != '_' and word[i] != pattern[i]:
            return False
    return True


def filter_words_list(words, pattern, wrong_guess_lst):
    """The function get a list of word and return new list of word that"""
    """contain only word with the same length as the pattern"""
    """only words that isn't contain letter from the wrong guess list"""
    """only words that contain same letter at as same index only, from the """
    """letter that been revealed from the pattern"""
    new_words_list = []
    for i in range(0, len(words)):
        if len(words[i]) != len(pattern):
            continue
        if is_it_contain(words[i], wrong_guess_lst):
            continue
        if same_letter_same_index(words[i], pattern):
            new_words_list += words[i]
    return new_words_list


def choose_letter(words, pattern):
    """This function gets a list of word with the same length of the pattern"""
    """and the pattern, and return the word that repeat the most times in """
    """this words"""
    counters = []
    for i in range(26):
        counters.append(0)
    for word in words:
        for i in range(26):
            letter = index_to_letter(i)
            if letter in pattern:
                continue
            counters[i] += word.count(letter)
    """with max function we return the letter that repeat most of the time"""
    return index_to_letter(counters.index(max(counters)))


def run_single_game(words_list):
    global msg
    """get a words list and choose one random word for the game"""
    random_word = hangman_helper.get_random_word(words_list)
    pattern = ''
    """create a pattern that is full hide, meaning the string '_' times as"""
    """the word length"""
    pattern = len(random_word) * '_'
    wrong_guess = 0
    """making it a set as requested no repeats"""
    wrong_guess_lst = []
    """The message that the user gets when he start the game"""
    msg = hangman_helper.DEFAULT_MSG
    """This while loop is till the game is over"""
    chosen_letter_lst = []
    while wrong_guess < hangman_helper.MAX_ERRORS and gameover(pattern):
        hangman_helper.display_state(pattern, wrong_guess, wrong_guess_lst,
                                     msg, ask_play=False)

        status, input_t = hangman_helper.get_input()
        if status == hangman_helper.LETTER:
            """filter_words_list(random_word, pattern, wrong_guess_lst)"""
            """Checking if the input is correct, the input must be"""
            """length 1 only letters and only small letter"""
            if input_t.isupper() is True or len(input_t) != 1 or \
            input_t.isalpha() is False:
                msg = hangman_helper.NON_VALID_MSG
            elif already_chosen(input_t, chosen_letter_lst):
                """The letter already been chosen"""
                msg = hangman_helper.ALREADY_CHOSEN_MSG + input_t
                chosen_letter_lst += str(input_t)
            elif letter_in_word(input_t, random_word):
                """if the letter is in the pattern"""
                pattern = update_word_pattern(random_word, pattern, input_t)
                msg = hangman_helper.DEFAULT_MSG
                chosen_letter_lst += str(input_t)
            else:
                """if the letter is not in the pattern"""
                wrong_guess += 1
                wrong_guess_lst += input_t
                msg = hangman_helper.DEFAULT_MSG
                chosen_letter_lst += str(input_t)
        elif status == hangman_helper.HINT:
            """if you the user want hint"""
            wrong_guess_lst = list(wrong_guess_lst)
            words = filter_words_list(words_list, pattern, wrong_guess_lst)
            letter = choose_letter(words, pattern)
            msg = hangman_helper.HINT_MSG + letter
        else:
            msg = hangman_helper.DEFAULT_MSG

    if gameover(pattern):
        """The function gets the current pattern at the end of that game"""
        """and according to that determine if to display win or lose message"""
        """If the game is over and you lose, display a lose message and"""
        """ask if u want to play again"""
        msg = hangman_helper.LOSS_MSG + random_word
        hangman_helper.display_state(pattern, wrong_guess, wrong_guess_lst,
                                     msg, ask_play=True)
    else:
        """if you win display a win message and ask if you want to play"""
        """again or not"""
        msg = hangman_helper.WIN_MSG
        hangman_helper.display_state(pattern, wrong_guess, wrong_guess_lst,
                                     msg, ask_play=True)


def main():
    words_list = hangman_helper.load_words()
    run_single_game(words_list)
    status, input_t = hangman_helper.get_input()
    while status == hangman_helper.PLAY_AGAIN and input_t:
        run_single_game(words_list)
        status, input_t = hangman_helper.get_input()


if __name__ == "__main__":
    hangman_helper.start_gui_and_call_main(main)
    hangman_helper.close_gui()