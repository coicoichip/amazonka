{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE OverloadedStrings  #-}
{-# LANGUAGE RecordWildCards    #-}
{-# LANGUAGE TypeFamilies       #-}

{-# OPTIONS_GHC -fno-warn-unused-binds   #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.DirectConnect.DeleteConnection
-- Copyright   : (c) 2013-2015 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)
--
-- Deletes the connection.
--
-- Deleting a connection only stops the AWS Direct Connect port hour and
-- data transfer charges. You need to cancel separately with the providers
-- any services or charges for cross-connects or network circuits that
-- connect you to the AWS Direct Connect location.
--
-- <http://docs.aws.amazon.com/directconnect/latest/APIReference/API_DeleteConnection.html>
module Network.AWS.DirectConnect.DeleteConnection
    (
    -- * Request
      DeleteConnection
    -- ** Request constructor
    , deleteConnection
    -- ** Request lenses
    , dcrqConnectionId

    -- * Response
    , Connection
    -- ** Response constructor
    , connection
    -- ** Response lenses
    , cVlan
    , cLocation
    , cConnectionId
    , cConnectionName
    , cPartnerName
    , cBandwidth
    , cRegion
    , cOwnerAccount
    , cConnectionState
    ) where

import           Network.AWS.DirectConnect.Types
import           Network.AWS.Prelude
import           Network.AWS.Request
import           Network.AWS.Response

-- | Container for the parameters to the DeleteConnection operation.
--
-- /See:/ 'deleteConnection' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'dcrqConnectionId'
newtype DeleteConnection = DeleteConnection'
    { _dcrqConnectionId :: Text
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'DeleteConnection' smart constructor.
deleteConnection :: Text -> DeleteConnection
deleteConnection pConnectionId_ =
    DeleteConnection'
    { _dcrqConnectionId = pConnectionId_
    }

-- | FIXME: Undocumented member.
dcrqConnectionId :: Lens' DeleteConnection Text
dcrqConnectionId = lens _dcrqConnectionId (\ s a -> s{_dcrqConnectionId = a});

instance AWSRequest DeleteConnection where
        type Sv DeleteConnection = DirectConnect
        type Rs DeleteConnection = Connection
        request = postJSON
        response = receiveJSON (\ s h x -> eitherParseJSON x)

instance ToHeaders DeleteConnection where
        toHeaders
          = const
              (mconcat
                 ["X-Amz-Target" =#
                    ("OvertureService.DeleteConnection" :: ByteString),
                  "Content-Type" =#
                    ("application/x-amz-json-1.1" :: ByteString)])

instance ToJSON DeleteConnection where
        toJSON DeleteConnection'{..}
          = object ["connectionId" .= _dcrqConnectionId]

instance ToPath DeleteConnection where
        toPath = const "/"

instance ToQuery DeleteConnection where
        toQuery = const mempty
