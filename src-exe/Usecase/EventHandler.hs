module Usecase.EventHandler where

import Services.MessageHandler (messageCreateHandler)

import Services.InteractionHandler (interactionHandler)

import Discord (DiscordHandler)

import Discord.Types (
    Event(MessageCreate, InteractionCreate) )

eventHandler :: Event -> DiscordHandler ()
eventHandler event = case event of
    MessageCreate m     -> messageCreateHandler m
    InteractionCreate i -> interactionHandler i
    _ -> return ()


