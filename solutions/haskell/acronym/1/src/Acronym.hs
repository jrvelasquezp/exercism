module Acronym (abbreviate) where
import Data.List
import Data.Char

abbreviate :: String -> String
abbreviate xs = intercalate "" (map (\w -> if all isUpper w then take 1 w; else [ c | c <- w, c `elem` ['A'..'Z']]) (map (\w -> toUpper (head w) : tail w) (words (map (\c -> if c=='\'' then 's'; else c) (map (\c -> if c=='-' || c=='_' || c==',' then ' '; else c) xs)))))