module TicTacToe.Board where
import TicTacToe.Move.Move

getEmptyBoard:: [Move]
getEmptyBoard = [Move 0 0 N, Move 0 1 N, Move 0 2 N, Move 1 0 N, Move 1 1 N, Move 1 2 N, Move 2 0 N, Move 2 1 N, Move 2 2 N]


