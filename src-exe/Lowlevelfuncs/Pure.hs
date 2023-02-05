{-# LANGUAGE OverloadedStrings #-} 

module Lowlevelfuncs.Pure where

import qualified Data.Text as T

isPing :: T.Text -> Bool
isPing = containLowerWord "ping"

isPong :: T.Text -> Bool
isPong = containLowerWord "pong"

isLove :: T.Text -> Bool
isLove m = isILY m || isILoveYou m

isILY :: T.Text -> Bool
isILY = containLowerWord "ily" 

isILoveYou :: T.Text -> Bool
isILoveYou =  containThreeWord ("i", "love", "you")

containLowerWord :: T.Text -> T.Text -> Bool
containLowerWord t = elem t . T.words . T.toLower

containThreeWord :: (T.Text, T.Text, T.Text) -> T.Text -> Bool
containThreeWord ts m = ts `elem` threeWord
    where 
    threeWord = zip3 ms (tail ms) ((tail . tail) ms)
    ms = T.words . T.toLower $ m