{-# LANGUAGE DeriveGeneric #-}

-- Module      : Network.AWS.EC2.Internal
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

module Network.AWS.EC2.Internal where

import GHC.Generics
import Network.AWS.Prelude

data Error = Error
    { _errCode    :: Text
    , _errMessage :: Text
    } deriving (Eq, Ord, Show, Generic)

data EC2ServiceError = EC2ServiceError
    { _errErrors    :: [Error]
    , _errRequestID :: Text
    } deriving (Eq, Ord, Show, Generic)

-- <Response>
--     <Errors>
--          <Error>
--            <Code>Error code text</Code>
--            <Message>Error message</Message>
--          </Error>
--     </Errors>
--     <RequestID>request ID</RequestID>
-- </Response>
