module TicTacToe.Move.Resolver where
import TicTacToe.Parser.Json
import Data.Maybe
import Data.Tuple
import TicTacToe.Board
import TicTacToe.Tuple.Extensions

move:: String -> Maybe (Int, Int, Char)
move input = resolveMove (parse input)

resolveMove:: [(Int, Int, Char)] -> Maybe (Int, Int, Char)
resolveMove moves =
                 let
                    (availableMoves) = removeMoves getEmptyBoard moves
                 in
                    case availableMoves of
                     ([])  -> Nothing
                     _  -> Just ( getMyMove availableMoves moves)

getMyMove:: [Int] -> [(Int, Int, Char)] -> (Int, Int, Char)
getMyMove (h:t) moves = (resolveX h, resolveY h, resolveSymbol moves)

resolveX:: Int -> Int
resolveX move = move `div` 10

resolveY:: Int -> Int
resolveY move = move - ((move `div` 10) *10)

resolveSymbol:: [(Int, Int, Char)] -> Char
resolveSymbol moves = if length (filter (isMySymbol 'X') moves) > length (filter (isMySymbol 'O') moves)
                      then 'O'
                      else  if length (filter (isMySymbol 'X') moves) == length (filter (isMySymbol 'O') moves) && length moves > 0
                            then get3 (head moves)
                            else 'X'

isMySymbol:: Char -> (Int, Int, Char) -> Bool
isMySymbol symbol (_, _, char) = symbol == char