module TicTacToe.Messages.Json
where

{-
message to react to
board:
+-+-+-+
|O|X|X|
+-+-+-+
| | |X|
+-+-+-+
|O| | |
+-+-+-+
-}
message :: String
message = "{\"0\":   {\"x\":  0, \"y\":   2, \"v\": \"x\"},  \"1\":   {\"x\":   0,  \"y\":   0, \"v\":   \"o\"}, \"2\": {\"x\": 1,   \"y\":  2, \"v\":  \"x\"},   \"3\":  {\"x\":   2,  \"y\": 0, \"v\":  \"o\"},  \"4\":   {\"x\":   0,  \"y\": 1,  \"v\":  \"x\"}}"