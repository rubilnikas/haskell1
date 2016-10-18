module TicTacToe.Parser.Json where
import Data.Char
import Data.List.Split
import Data.List
import Data.Maybe
import TicTacToe.Move.Move

removeCharFromString :: String -> Char -> String
removeCharFromString input char = filter (isNotSameChar char) input

isNotSameChar :: Char -> Char -> Bool
isNotSameChar ch1 ch2 =
    if ch1 == ch2
    then False
    else True

parse :: String -> [Move]
parse input =
    let
        (withoutspaces) = removeCharFromString input ' '
        (cleaned) = removeCharFromString withoutspaces '\"'
        (upperCased) = map toUpper cleaned
    in
        case upperCased of
            ('{':rest) -> parseMoves rest []
            _          -> error "{ expected"

parseMoves :: String -> [Move] -> [Move]
parseMoves (_:':':'{':'X':':':x:',':'Y':':':y:',':'V':':':p:'}':rest) result = parseMoves rest ((Move (getInt x) (getInt y) (getPlayer p)) : result)
parseMoves (',':rest) result = parseMoves rest result
parseMoves ('}':_) result = result
parseMoves a _ = error ("Something unexpected in json: " ++ a)

getInt :: Char -> Int
getInt a = read (a:[])::Int

getPlayer :: Char -> Player
getPlayer 'X' = X
getPlayer 'O' = O