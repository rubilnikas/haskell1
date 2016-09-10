module TicTacToe.Tuple.Extensions where

get1:: (a1, a2, a3) -> a1
get1 (a,_,_) = a

get2:: (a1, a2, a3) -> a2
get2 (_,a,_) = a

get3:: (a1, a2, a3) -> a3
get3 (_,_,a) = a