{-# LANGUAGE OverloadedStrings #-} 

import qualified Data.Text as T 
import qualified Data.Text.IO as TIO

import Discord
    ( runDiscord,
      def,
      RunDiscordOpts(discordOnLog, discordToken, discordOnEvent, discordOnStart) )

import           System.Environment (getEnv)

import           Usecase.EventHandler (eventHandler)
import           Services.CommandCreator (commandCreator)

main :: IO ()
main = do
    tok <- getEnv "BOT_TOKEN"
    userFacingError <- runDiscord $ def
             { discordToken = T.pack tok
             , discordOnStart = commandCreator
             , discordOnEvent = eventHandler
             , discordOnLog = \s -> TIO.putStrLn s >> TIO.putStrLn ""
             } -- if you see OnLog error, post in the discord / open an issue

    TIO.putStrLn userFacingError
    -- userFacingError is an unrecoverable error
    -- put normal 'cleanup' code in discordOnEnd (see examples)


