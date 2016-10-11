module TicTacToe.Board where
import TicTacToe.Move.Move

getEmptyBoard:: [Move]
getEmptyBoard = [Move x y N | x <- [0 .. 2], y <- [0 .. 2]]

