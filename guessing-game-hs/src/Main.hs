{-# LANGUAGE ScopedTypeVariables #-}

-- Haskell code seems much more concise, but we lose some of the fine control
module Main where

import Control.Monad (forever) -- this takes care of our loop functionality
import System.Random (getStdRandom, randomR) -- we need this for our random number generator
import System.Exit (exitSuccess) -- break the loop
import Text.Read (readMaybe) -- convert a string to (possibly) an integer
  
main :: IO ()
main = do
  putStrLn "Guess the number!"
  secretNumber :: Int <- getStdRandom . randomR $ (1, 101)
  forever $ do
    putStrLn "Please input your guess."
    guess <- getLine
    putStrLn $ "You guessed: " ++ guess
    case (readMaybe guess) of
      Nothing -> putStrLn "Not a number!"
      Just n -> case (compare n secretNumber) of
        EQ -> do putStrLn "You win!"
                 exitSuccess
        LT -> putStrLn "Too small!"
        GT -> putStrLn "Too big!"