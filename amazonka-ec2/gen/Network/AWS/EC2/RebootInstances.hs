{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE OverloadedStrings  #-}
{-# LANGUAGE RecordWildCards    #-}
{-# LANGUAGE TypeFamilies       #-}

{-# OPTIONS_GHC -fno-warn-unused-binds   #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.EC2.RebootInstances
-- Copyright   : (c) 2013-2015 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)
--
-- Requests a reboot of one or more instances. This operation is
-- asynchronous; it only queues a request to reboot the specified
-- instances. The operation succeeds if the instances are valid and belong
-- to you. Requests to reboot terminated instances are ignored.
--
-- If a Linux\/Unix instance does not cleanly shut down within four
-- minutes, Amazon EC2 performs a hard reboot.
--
-- For more information about troubleshooting, see
-- <http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-console.html Getting Console Output and Rebooting Instances>
-- in the /Amazon Elastic Compute Cloud User Guide/.
--
-- <http://docs.aws.amazon.com/AWSEC2/latest/APIReference/ApiReference-query-RebootInstances.html>
module Network.AWS.EC2.RebootInstances
    (
    -- * Request
      RebootInstances
    -- ** Request constructor
    , rebootInstances
    -- ** Request lenses
    , rebrqDryRun
    , rebrqInstanceIds

    -- * Response
    , RebootInstancesResponse
    -- ** Response constructor
    , rebootInstancesResponse
    ) where

import           Network.AWS.EC2.Types
import           Network.AWS.Prelude
import           Network.AWS.Request
import           Network.AWS.Response

-- | /See:/ 'rebootInstances' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'rebrqDryRun'
--
-- * 'rebrqInstanceIds'
data RebootInstances = RebootInstances'
    { _rebrqDryRun      :: !(Maybe Bool)
    , _rebrqInstanceIds :: ![Text]
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'RebootInstances' smart constructor.
rebootInstances :: RebootInstances
rebootInstances =
    RebootInstances'
    { _rebrqDryRun = Nothing
    , _rebrqInstanceIds = mempty
    }

-- | Checks whether you have the required permissions for the action, without
-- actually making the request, and provides an error response. If you have
-- the required permissions, the error response is @DryRunOperation@.
-- Otherwise, it is @UnauthorizedOperation@.
rebrqDryRun :: Lens' RebootInstances (Maybe Bool)
rebrqDryRun = lens _rebrqDryRun (\ s a -> s{_rebrqDryRun = a});

-- | One or more instance IDs.
rebrqInstanceIds :: Lens' RebootInstances [Text]
rebrqInstanceIds = lens _rebrqInstanceIds (\ s a -> s{_rebrqInstanceIds = a});

instance AWSRequest RebootInstances where
        type Sv RebootInstances = EC2
        type Rs RebootInstances = RebootInstancesResponse
        request = post
        response = receiveNull RebootInstancesResponse'

instance ToHeaders RebootInstances where
        toHeaders = const mempty

instance ToPath RebootInstances where
        toPath = const "/"

instance ToQuery RebootInstances where
        toQuery RebootInstances'{..}
          = mconcat
              ["Action" =: ("RebootInstances" :: ByteString),
               "Version" =: ("2015-04-15" :: ByteString),
               "DryRun" =: _rebrqDryRun,
               toQueryList "InstanceId" _rebrqInstanceIds]

-- | /See:/ 'rebootInstancesResponse' smart constructor.
data RebootInstancesResponse =
    RebootInstancesResponse'
    deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'RebootInstancesResponse' smart constructor.
rebootInstancesResponse :: RebootInstancesResponse
rebootInstancesResponse = RebootInstancesResponse'
