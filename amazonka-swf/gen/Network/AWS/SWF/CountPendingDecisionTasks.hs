{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE OverloadedStrings  #-}
{-# LANGUAGE RecordWildCards    #-}
{-# LANGUAGE TypeFamilies       #-}

{-# OPTIONS_GHC -fno-warn-unused-binds   #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.SWF.CountPendingDecisionTasks
-- Copyright   : (c) 2013-2015 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)
--
-- Returns the estimated number of decision tasks in the specified task
-- list. The count returned is an approximation and is not guaranteed to be
-- exact. If you specify a task list that no decision task was ever
-- scheduled in then 0 will be returned.
--
-- __Access Control__
--
-- You can use IAM policies to control this action\'s access to Amazon SWF
-- resources as follows:
--
-- -   Use a @Resource@ element with the domain name to limit the action to
--     only specified domains.
-- -   Use an @Action@ element to allow or deny permission to call this
--     action.
-- -   Constrain the @taskList.name@ parameter by using a __Condition__
--     element with the @swf:taskList.name@ key to allow the action to
--     access only certain task lists.
--
-- If the caller does not have sufficient permissions to invoke the action,
-- or the parameter values fall outside the specified constraints, the
-- action fails. The associated event attribute\'s __cause__ parameter will
-- be set to OPERATION_NOT_PERMITTED. For details and example IAM policies,
-- see
-- <http://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html Using IAM to Manage Access to Amazon SWF Workflows>.
--
-- <http://docs.aws.amazon.com/amazonswf/latest/apireference/API_CountPendingDecisionTasks.html>
module Network.AWS.SWF.CountPendingDecisionTasks
    (
    -- * Request
      CountPendingDecisionTasks
    -- ** Request constructor
    , countPendingDecisionTasks
    -- ** Request lenses
    , cpdtrqDomain
    , cpdtrqTaskList

    -- * Response
    , PendingTaskCount
    -- ** Response constructor
    , pendingTaskCount
    -- ** Response lenses
    , ptcTruncated
    , ptcCount
    ) where

import           Network.AWS.Prelude
import           Network.AWS.Request
import           Network.AWS.Response
import           Network.AWS.SWF.Types

-- | /See:/ 'countPendingDecisionTasks' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'cpdtrqDomain'
--
-- * 'cpdtrqTaskList'
data CountPendingDecisionTasks = CountPendingDecisionTasks'
    { _cpdtrqDomain   :: !Text
    , _cpdtrqTaskList :: !TaskList
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'CountPendingDecisionTasks' smart constructor.
countPendingDecisionTasks :: Text -> TaskList -> CountPendingDecisionTasks
countPendingDecisionTasks pDomain_ pTaskList_ =
    CountPendingDecisionTasks'
    { _cpdtrqDomain = pDomain_
    , _cpdtrqTaskList = pTaskList_
    }

-- | The name of the domain that contains the task list.
cpdtrqDomain :: Lens' CountPendingDecisionTasks Text
cpdtrqDomain = lens _cpdtrqDomain (\ s a -> s{_cpdtrqDomain = a});

-- | The name of the task list.
cpdtrqTaskList :: Lens' CountPendingDecisionTasks TaskList
cpdtrqTaskList = lens _cpdtrqTaskList (\ s a -> s{_cpdtrqTaskList = a});

instance AWSRequest CountPendingDecisionTasks where
        type Sv CountPendingDecisionTasks = SWF
        type Rs CountPendingDecisionTasks = PendingTaskCount
        request = postJSON
        response = receiveJSON (\ s h x -> eitherParseJSON x)

instance ToHeaders CountPendingDecisionTasks where
        toHeaders
          = const
              (mconcat
                 ["X-Amz-Target" =#
                    ("SimpleWorkflowService.CountPendingDecisionTasks" ::
                       ByteString),
                  "Content-Type" =#
                    ("application/x-amz-json-1.0" :: ByteString)])

instance ToJSON CountPendingDecisionTasks where
        toJSON CountPendingDecisionTasks'{..}
          = object
              ["domain" .= _cpdtrqDomain,
               "taskList" .= _cpdtrqTaskList]

instance ToPath CountPendingDecisionTasks where
        toPath = const "/"

instance ToQuery CountPendingDecisionTasks where
        toQuery = const mempty
