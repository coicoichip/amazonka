{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE OverloadedStrings  #-}
{-# LANGUAGE RecordWildCards    #-}
{-# LANGUAGE TypeFamilies       #-}

{-# OPTIONS_GHC -fno-warn-unused-binds   #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.AutoScaling.DeleteNotificationConfiguration
-- Copyright   : (c) 2013-2015 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)
--
-- Deletes the specified notification.
--
-- <http://docs.aws.amazon.com/AutoScaling/latest/APIReference/API_DeleteNotificationConfiguration.html>
module Network.AWS.AutoScaling.DeleteNotificationConfiguration
    (
    -- * Request
      DeleteNotificationConfiguration
    -- ** Request constructor
    , deleteNotificationConfiguration
    -- ** Request lenses
    , dncrqAutoScalingGroupName
    , dncrqTopicARN

    -- * Response
    , DeleteNotificationConfigurationResponse
    -- ** Response constructor
    , deleteNotificationConfigurationResponse
    ) where

import           Network.AWS.AutoScaling.Types
import           Network.AWS.Prelude
import           Network.AWS.Request
import           Network.AWS.Response

-- | /See:/ 'deleteNotificationConfiguration' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'dncrqAutoScalingGroupName'
--
-- * 'dncrqTopicARN'
data DeleteNotificationConfiguration = DeleteNotificationConfiguration'
    { _dncrqAutoScalingGroupName :: !Text
    , _dncrqTopicARN             :: !Text
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'DeleteNotificationConfiguration' smart constructor.
deleteNotificationConfiguration :: Text -> Text -> DeleteNotificationConfiguration
deleteNotificationConfiguration pAutoScalingGroupName_ pTopicARN_ =
    DeleteNotificationConfiguration'
    { _dncrqAutoScalingGroupName = pAutoScalingGroupName_
    , _dncrqTopicARN = pTopicARN_
    }

-- | The name of the Auto Scaling group.
dncrqAutoScalingGroupName :: Lens' DeleteNotificationConfiguration Text
dncrqAutoScalingGroupName = lens _dncrqAutoScalingGroupName (\ s a -> s{_dncrqAutoScalingGroupName = a});

-- | The Amazon Resource Name (ARN) of the Amazon Simple Notification Service
-- (SNS) topic.
dncrqTopicARN :: Lens' DeleteNotificationConfiguration Text
dncrqTopicARN = lens _dncrqTopicARN (\ s a -> s{_dncrqTopicARN = a});

instance AWSRequest DeleteNotificationConfiguration
         where
        type Sv DeleteNotificationConfiguration = AutoScaling
        type Rs DeleteNotificationConfiguration =
             DeleteNotificationConfigurationResponse
        request = post
        response
          = receiveNull
              DeleteNotificationConfigurationResponse'

instance ToHeaders DeleteNotificationConfiguration
         where
        toHeaders = const mempty

instance ToPath DeleteNotificationConfiguration where
        toPath = const "/"

instance ToQuery DeleteNotificationConfiguration
         where
        toQuery DeleteNotificationConfiguration'{..}
          = mconcat
              ["Action" =:
                 ("DeleteNotificationConfiguration" :: ByteString),
               "Version" =: ("2011-01-01" :: ByteString),
               "AutoScalingGroupName" =: _dncrqAutoScalingGroupName,
               "TopicARN" =: _dncrqTopicARN]

-- | /See:/ 'deleteNotificationConfigurationResponse' smart constructor.
data DeleteNotificationConfigurationResponse =
    DeleteNotificationConfigurationResponse'
    deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'DeleteNotificationConfigurationResponse' smart constructor.
deleteNotificationConfigurationResponse :: DeleteNotificationConfigurationResponse
deleteNotificationConfigurationResponse =
    DeleteNotificationConfigurationResponse'
