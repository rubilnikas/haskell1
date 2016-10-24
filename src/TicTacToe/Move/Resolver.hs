module TicTacToe.Move.Resolver where
import TicTacToe.Parser.Json
import Data.Maybe
import Data.List
import TicTacToe.Board
import TicTacToe.Move.Move

move:: String -> Maybe (Int, Int, Char)
move input = toTupleMaybe (resolveMove (parse input))

resolveMove:: [Move] -> Maybe Move
resolveMove moves =
                 let
                    (availableMoves) = getEmptyBoard \\ moves
                 in
                    case availableMoves of
                     []  -> Nothing
                     _  -> Just (getMyMove availableMoves moves)

getMyMove:: [Move] -> [Move] -> Move
getMyMove (h:t) [] = Move (x h) (y h) X
getMyMove (h:t) moves =
                 let
                     (last) = length moves - 1
                     (p) =  inverse (player (moves !! last))
                 in Move (x h) (y h) p
