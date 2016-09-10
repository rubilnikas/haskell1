module TicTacToe.Board where
import TicTacToe.Tuple.Extensions

getEmptyBoard:: [Int]
getEmptyBoard = [00, 01, 02, 10, 11, 12, 20, 21, 22]

removeMoves:: [Int] -> [(Int, Int, Char)] -> [Int]
removeMoves board moves = if length moves == 0
                          then board
                          else removeMoves (removeMove board (head moves)) (tail moves)

removeMove:: [Int] -> (Int, Int, Char) -> [Int]
removeMove board tuple = filter (isNotMovePlace tuple) board

isNotMovePlace:: (Int, Int, Char) -> Int -> Bool
isNotMovePlace tuple place = ((get1 tuple) * 10 + (get2 tuple)) /= place


