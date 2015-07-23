{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE OverloadedStrings  #-}
{-# LANGUAGE RecordWildCards    #-}
{-# LANGUAGE TypeFamilies       #-}

{-# OPTIONS_GHC -fno-warn-unused-binds   #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.RDS.ResetDBParameterGroup
-- Copyright   : (c) 2013-2015 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)
--
-- Modifies the parameters of a DB parameter group to the engine\/system
-- default value. To reset specific parameters submit a list of the
-- following: @ParameterName@ and @ApplyMethod@. To reset the entire DB
-- parameter group, specify the @DBParameterGroup@ name and
-- @ResetAllParameters@ parameters. When resetting the entire group,
-- dynamic parameters are updated immediately and static parameters are set
-- to @pending-reboot@ to take effect on the next DB instance restart or
-- @RebootDBInstance@ request.
--
-- <http://docs.aws.amazon.com/AmazonRDS/latest/APIReference/API_ResetDBParameterGroup.html>
module Network.AWS.RDS.ResetDBParameterGroup
    (
    -- * Request
      ResetDBParameterGroup
    -- ** Request constructor
    , resetDBParameterGroup
    -- ** Request lenses
    , rdpgrqResetAllParameters
    , rdpgrqParameters
    , rdpgrqDBParameterGroupName

    -- * Response
    , DBParameterGroupNameMessage
    -- ** Response constructor
    , dbParameterGroupNameMessage
    -- ** Response lenses
    , dpgnmDBParameterGroupName
    ) where

import           Network.AWS.Prelude
import           Network.AWS.RDS.Types
import           Network.AWS.Request
import           Network.AWS.Response

-- |
--
-- /See:/ 'resetDBParameterGroup' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'rdpgrqResetAllParameters'
--
-- * 'rdpgrqParameters'
--
-- * 'rdpgrqDBParameterGroupName'
data ResetDBParameterGroup = ResetDBParameterGroup'
    { _rdpgrqResetAllParameters   :: !(Maybe Bool)
    , _rdpgrqParameters           :: !(Maybe [Parameter])
    , _rdpgrqDBParameterGroupName :: !Text
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'ResetDBParameterGroup' smart constructor.
resetDBParameterGroup :: Text -> ResetDBParameterGroup
resetDBParameterGroup pDBParameterGroupName_ =
    ResetDBParameterGroup'
    { _rdpgrqResetAllParameters = Nothing
    , _rdpgrqParameters = Nothing
    , _rdpgrqDBParameterGroupName = pDBParameterGroupName_
    }

-- | Specifies whether (@true@) or not (@false@) to reset all parameters in
-- the DB parameter group to default values.
--
-- Default: @true@
rdpgrqResetAllParameters :: Lens' ResetDBParameterGroup (Maybe Bool)
rdpgrqResetAllParameters = lens _rdpgrqResetAllParameters (\ s a -> s{_rdpgrqResetAllParameters = a});

-- | An array of parameter names, values, and the apply method for the
-- parameter update. At least one parameter name, value, and apply method
-- must be supplied; subsequent arguments are optional. A maximum of 20
-- parameters may be modified in a single request.
--
-- __MySQL__
--
-- Valid Values (for Apply method): @immediate@ | @pending-reboot@
--
-- You can use the immediate value with dynamic parameters only. You can
-- use the @pending-reboot@ value for both dynamic and static parameters,
-- and changes are applied when DB instance reboots.
--
-- __Oracle__
--
-- Valid Values (for Apply method): @pending-reboot@
rdpgrqParameters :: Lens' ResetDBParameterGroup [Parameter]
rdpgrqParameters = lens _rdpgrqParameters (\ s a -> s{_rdpgrqParameters = a}) . _Default;

-- | The name of the DB parameter group.
--
-- Constraints:
--
-- -   Must be 1 to 255 alphanumeric characters
-- -   First character must be a letter
-- -   Cannot end with a hyphen or contain two consecutive hyphens
rdpgrqDBParameterGroupName :: Lens' ResetDBParameterGroup Text
rdpgrqDBParameterGroupName = lens _rdpgrqDBParameterGroupName (\ s a -> s{_rdpgrqDBParameterGroupName = a});

instance AWSRequest ResetDBParameterGroup where
        type Sv ResetDBParameterGroup = RDS
        type Rs ResetDBParameterGroup =
             DBParameterGroupNameMessage
        request = post
        response
          = receiveXMLWrapper "ResetDBParameterGroupResult"
              (\ s h x -> parseXML x)

instance ToHeaders ResetDBParameterGroup where
        toHeaders = const mempty

instance ToPath ResetDBParameterGroup where
        toPath = const "/"

instance ToQuery ResetDBParameterGroup where
        toQuery ResetDBParameterGroup'{..}
          = mconcat
              ["Action" =: ("ResetDBParameterGroup" :: ByteString),
               "Version" =: ("2014-10-31" :: ByteString),
               "ResetAllParameters" =: _rdpgrqResetAllParameters,
               "Parameters" =:
                 toQuery
                   (toQueryList "Parameter" <$> _rdpgrqParameters),
               "DBParameterGroupName" =:
                 _rdpgrqDBParameterGroupName]
