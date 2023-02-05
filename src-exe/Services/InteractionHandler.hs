module Services.InteractionHandler (interactionHandler) where

import Discord (DiscordHandler)

import Lowlevelfuncs.Output (makeRequest)
import Lowlevelfuncs.Input (readMemberUserName)

import qualified Discord.Interactions as I

import qualified Discord.Requests as R

import qualified Data.Text as T

interactionHandler :: I.Interaction -> DiscordHandler ()
interactionHandler i = makeRequest . interactionResponse $ i


interactionResponse :: I.Interaction -> R.InteractionResponseRequest ()
interactionResponse i = R.CreateInteractionResponse iid iTok . I.interactionResponseBasic $ name `T.append` T.pack " says hiiiii"
  where 
  appName = I.applicationCommandDataName  . I.applicationCommandData $ i
  iid     = I.interactionId i
  iTok    = I.interactionToken i
  name    = readMemberUserName . I.interactionUser $ i