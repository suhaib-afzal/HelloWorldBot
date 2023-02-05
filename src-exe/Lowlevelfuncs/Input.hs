{-# LANGUAGE OverloadedStrings #-}

module Lowlevelfuncs.Input where

import Discord.Types ( 
    Message(messageAuthor), 
    User(userIsBot, userName),
    GuildMember(memberUser) )

--import 

import qualified Discord.Interactions as I
import qualified Data.Text as T

fromBot :: Message -> Bool
fromBot = userIsBot . messageAuthor

readMemberUserName :: I.MemberOrUser -> T.Text
readMemberUserName (I.MemberOrUser e) = either (maybe "nothinn" userName . memberUser) userName e