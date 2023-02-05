{-# LANGUAGE OverloadedStrings #-}

module Services.MessageHandler (messageCreateHandler) where

import Lowlevelfuncs.Pure
import Lowlevelfuncs.Output
import Lowlevelfuncs.Input (fromBot)

import Discord (DiscordHandler)

import Discord.Types ( 
    MessageId,
    ChannelId,
    Message(messageContent, messageChannelId, messageId) 
    )

import UnliftIO.Concurrent (threadDelay)

import qualified Data.Text as T

messageCreateHandler :: Message -> DiscordHandler ()
messageCreateHandler m
    | fromBot m = pure ()
    | (isPing . messageContent) m = eyesAndRespond m "Pong!"
    | (isPong . messageContent) m = eyesAndRespond m "Ping!"
    | (isLove . messageContent) m = aubAndRespond m "Something Dumb!"
    | otherwise = pure ()

eyesAndRespond :: Message -> T.Text -> DiscordHandler ()
eyesAndRespond m t = do
    makeEyes (messageChannelId m) (messageId m)
    threadDelay (2 * 10^6)
    writeLine (messageChannelId m) t

aubAndRespond :: Message -> T.Text -> DiscordHandler ()
aubAndRespond m t = do
    makeAub (messageChannelId m) (messageId m)
    threadDelay (2 * 10^6)
    writeLine (messageChannelId m) t

makeEyes :: ChannelId -> MessageId ->  DiscordHandler ()
makeEyes = makeReaction "eyes"

makeAub :: ChannelId -> MessageId ->  DiscordHandler ()
makeAub = makeReaction "eggplant"