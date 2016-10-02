module TicTacToe.Move.Move where
import Data.Maybe

data Player = X | O | N
  deriving Show

data Move = Move{
    x :: Int
    ,y :: Int
    ,player :: Player
} deriving Show

instance Eq Move where
    (Move x1 y1 _) == (Move x2 y2 _) = x1 == x2 && y1 == y2

inverse:: Player -> Player
inverse X = O
inverse O = X
inverse N = N

toTuple:: Move -> (Int, Int, Char)
toTuple (Move x y p) = (x,y, toChar p)

toTupleMaybe :: Maybe Move -> Maybe (Int, Int, Char)
toTupleMaybe Nothing = Nothing
toTupleMaybe (Just t) = Just (toTuple t)

toChar :: Player -> Char
toChar X = 'X'
toChar O = 'O'
toChar N = 'N'