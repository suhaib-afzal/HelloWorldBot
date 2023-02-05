module Lowlevelfuncs.Output where

import Control.Monad ( void )

import Discord (
    restCall,
    Request,
    DiscordHandler,
    FromJSON)

import Discord.Types (
    ChannelId,
    MessageId )

import qualified Discord.Requests as R
import qualified Data.Text as T

writeLine :: ChannelId -> T.Text -> DiscordHandler ()
writeLine cID t = makeRequest (R.CreateMessage cID t)

makeReaction :: T.Text -> ChannelId -> MessageId ->  DiscordHandler ()
makeReaction emote cId mId = makeRequest (R.CreateReaction (cId, mId) emote)

makeRequest :: (Request (r a), FromJSON a) => (r a) -> DiscordHandler ()
makeRequest req = void $ restCall req