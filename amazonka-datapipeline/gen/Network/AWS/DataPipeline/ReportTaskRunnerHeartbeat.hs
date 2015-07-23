{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE OverloadedStrings  #-}
{-# LANGUAGE RecordWildCards    #-}
{-# LANGUAGE TypeFamilies       #-}

{-# OPTIONS_GHC -fno-warn-unused-binds   #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.DataPipeline.ReportTaskRunnerHeartbeat
-- Copyright   : (c) 2013-2015 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)
--
-- Task runners call @ReportTaskRunnerHeartbeat@ every 15 minutes to
-- indicate that they are operational. If the AWS Data Pipeline Task Runner
-- is launched on a resource managed by AWS Data Pipeline, the web service
-- can use this call to detect when the task runner application has failed
-- and restart a new instance.
--
-- <http://docs.aws.amazon.com/datapipeline/latest/APIReference/API_ReportTaskRunnerHeartbeat.html>
module Network.AWS.DataPipeline.ReportTaskRunnerHeartbeat
    (
    -- * Request
      ReportTaskRunnerHeartbeat
    -- ** Request constructor
    , reportTaskRunnerHeartbeat
    -- ** Request lenses
    , rtrhrqHostname
    , rtrhrqWorkerGroup
    , rtrhrqTaskrunnerId

    -- * Response
    , ReportTaskRunnerHeartbeatResponse
    -- ** Response constructor
    , reportTaskRunnerHeartbeatResponse
    -- ** Response lenses
    , rtrhrsStatus
    , rtrhrsTerminate
    ) where

import           Network.AWS.DataPipeline.Types
import           Network.AWS.Prelude
import           Network.AWS.Request
import           Network.AWS.Response

-- | Contains the parameters for ReportTaskRunnerHeartbeat.
--
-- /See:/ 'reportTaskRunnerHeartbeat' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'rtrhrqHostname'
--
-- * 'rtrhrqWorkerGroup'
--
-- * 'rtrhrqTaskrunnerId'
data ReportTaskRunnerHeartbeat = ReportTaskRunnerHeartbeat'
    { _rtrhrqHostname     :: !(Maybe Text)
    , _rtrhrqWorkerGroup  :: !(Maybe Text)
    , _rtrhrqTaskrunnerId :: !Text
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'ReportTaskRunnerHeartbeat' smart constructor.
reportTaskRunnerHeartbeat :: Text -> ReportTaskRunnerHeartbeat
reportTaskRunnerHeartbeat pTaskrunnerId_ =
    ReportTaskRunnerHeartbeat'
    { _rtrhrqHostname = Nothing
    , _rtrhrqWorkerGroup = Nothing
    , _rtrhrqTaskrunnerId = pTaskrunnerId_
    }

-- | The public DNS name of the task runner.
rtrhrqHostname :: Lens' ReportTaskRunnerHeartbeat (Maybe Text)
rtrhrqHostname = lens _rtrhrqHostname (\ s a -> s{_rtrhrqHostname = a});

-- | The type of task the task runner is configured to accept and process.
-- The worker group is set as a field on objects in the pipeline when they
-- are created. You can only specify a single value for @workerGroup@.
-- There are no wildcard values permitted in @workerGroup@; the string must
-- be an exact, case-sensitive, match.
rtrhrqWorkerGroup :: Lens' ReportTaskRunnerHeartbeat (Maybe Text)
rtrhrqWorkerGroup = lens _rtrhrqWorkerGroup (\ s a -> s{_rtrhrqWorkerGroup = a});

-- | The ID of the task runner. This value should be unique across your AWS
-- account. In the case of AWS Data Pipeline Task Runner launched on a
-- resource managed by AWS Data Pipeline, the web service provides a unique
-- identifier when it launches the application. If you have written a
-- custom task runner, you should assign a unique identifier for the task
-- runner.
rtrhrqTaskrunnerId :: Lens' ReportTaskRunnerHeartbeat Text
rtrhrqTaskrunnerId = lens _rtrhrqTaskrunnerId (\ s a -> s{_rtrhrqTaskrunnerId = a});

instance AWSRequest ReportTaskRunnerHeartbeat where
        type Sv ReportTaskRunnerHeartbeat = DataPipeline
        type Rs ReportTaskRunnerHeartbeat =
             ReportTaskRunnerHeartbeatResponse
        request = postJSON
        response
          = receiveJSON
              (\ s h x ->
                 ReportTaskRunnerHeartbeatResponse' <$>
                   (pure (fromEnum s)) <*> (x .:> "terminate"))

instance ToHeaders ReportTaskRunnerHeartbeat where
        toHeaders
          = const
              (mconcat
                 ["X-Amz-Target" =#
                    ("DataPipeline.ReportTaskRunnerHeartbeat" ::
                       ByteString),
                  "Content-Type" =#
                    ("application/x-amz-json-1.1" :: ByteString)])

instance ToJSON ReportTaskRunnerHeartbeat where
        toJSON ReportTaskRunnerHeartbeat'{..}
          = object
              ["hostname" .= _rtrhrqHostname,
               "workerGroup" .= _rtrhrqWorkerGroup,
               "taskrunnerId" .= _rtrhrqTaskrunnerId]

instance ToPath ReportTaskRunnerHeartbeat where
        toPath = const "/"

instance ToQuery ReportTaskRunnerHeartbeat where
        toQuery = const mempty

-- | Contains the output of ReportTaskRunnerHeartbeat.
--
-- /See:/ 'reportTaskRunnerHeartbeatResponse' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'rtrhrsStatus'
--
-- * 'rtrhrsTerminate'
data ReportTaskRunnerHeartbeatResponse = ReportTaskRunnerHeartbeatResponse'
    { _rtrhrsStatus    :: !Int
    , _rtrhrsTerminate :: !Bool
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'ReportTaskRunnerHeartbeatResponse' smart constructor.
reportTaskRunnerHeartbeatResponse :: Int -> Bool -> ReportTaskRunnerHeartbeatResponse
reportTaskRunnerHeartbeatResponse pStatus_ pTerminate_ =
    ReportTaskRunnerHeartbeatResponse'
    { _rtrhrsStatus = pStatus_
    , _rtrhrsTerminate = pTerminate_
    }

-- | FIXME: Undocumented member.
rtrhrsStatus :: Lens' ReportTaskRunnerHeartbeatResponse Int
rtrhrsStatus = lens _rtrhrsStatus (\ s a -> s{_rtrhrsStatus = a});

-- | Indicates whether the calling task runner should terminate.
rtrhrsTerminate :: Lens' ReportTaskRunnerHeartbeatResponse Bool
rtrhrsTerminate = lens _rtrhrsTerminate (\ s a -> s{_rtrhrsTerminate = a});
