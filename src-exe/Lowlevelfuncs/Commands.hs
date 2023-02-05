{-# LANGUAGE OverloadedStrings #-}

module Lowlevelfuncs.Commands (requestCommand) where

import qualified Discord.Requests as R
import qualified Discord.Interactions as I

requestCommand :: R.ApplicationCommandRequest I.ApplicationCommand
requestCommand = R.CreateGlobalApplicationCommand 1065324414327062599 createBaseCommand 

createBaseCommand :: I.CreateApplicationCommand
createBaseCommand = I.CreateApplicationCommandChatInput "testcommand" Nothing "test" Nothing Nothing Nothing Nothing