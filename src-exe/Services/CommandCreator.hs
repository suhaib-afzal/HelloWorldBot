module Services.CommandCreator (commandCreator) where

import Lowlevelfuncs.Output

import Lowlevelfuncs.Commands

import Discord (DiscordHandler)

commandCreator :: DiscordHandler ()
commandCreator = makeRequest requestCommand