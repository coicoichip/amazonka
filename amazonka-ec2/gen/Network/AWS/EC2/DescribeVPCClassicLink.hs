{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE OverloadedStrings  #-}
{-# LANGUAGE RecordWildCards    #-}
{-# LANGUAGE TypeFamilies       #-}

{-# OPTIONS_GHC -fno-warn-unused-binds   #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.EC2.DescribeVPCClassicLink
-- Copyright   : (c) 2013-2015 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)
--
-- Describes the ClassicLink status of one or more VPCs.
--
-- <http://docs.aws.amazon.com/AWSEC2/latest/APIReference/ApiReference-query-DescribeVPCClassicLink.html>
module Network.AWS.EC2.DescribeVPCClassicLink
    (
    -- * Request
      DescribeVPCClassicLink
    -- ** Request constructor
    , describeVPCClassicLink
    -- ** Request lenses
    , dvclrqFilters
    , dvclrqVPCIds
    , dvclrqDryRun

    -- * Response
    , DescribeVPCClassicLinkResponse
    -- ** Response constructor
    , describeVPCClassicLinkResponse
    -- ** Response lenses
    , dvclrsVPCs
    , dvclrsStatus
    ) where

import           Network.AWS.EC2.Types
import           Network.AWS.Prelude
import           Network.AWS.Request
import           Network.AWS.Response

-- | /See:/ 'describeVPCClassicLink' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'dvclrqFilters'
--
-- * 'dvclrqVPCIds'
--
-- * 'dvclrqDryRun'
data DescribeVPCClassicLink = DescribeVPCClassicLink'
    { _dvclrqFilters :: !(Maybe [Filter])
    , _dvclrqVPCIds  :: !(Maybe [Text])
    , _dvclrqDryRun  :: !(Maybe Bool)
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'DescribeVPCClassicLink' smart constructor.
describeVPCClassicLink :: DescribeVPCClassicLink
describeVPCClassicLink =
    DescribeVPCClassicLink'
    { _dvclrqFilters = Nothing
    , _dvclrqVPCIds = Nothing
    , _dvclrqDryRun = Nothing
    }

-- | One or more filters.
--
-- -   @is-classic-link-enabled@ - Whether the VPC is enabled for
--     ClassicLink (@true@ | @false@).
--
-- -   @tag@:/key/=/value/ - The key\/value combination of a tag assigned
--     to the resource.
--
-- -   @tag-key@ - The key of a tag assigned to the resource. This filter
--     is independent of the @tag-value@ filter. For example, if you use
--     both the filter \"tag-key=Purpose\" and the filter \"tag-value=X\",
--     you get any resources assigned both the tag key Purpose (regardless
--     of what the tag\'s value is), and the tag value X (regardless of
--     what the tag\'s key is). If you want to list only resources where
--     Purpose is X, see the @tag@:/key/=/value/ filter.
--
-- -   @tag-value@ - The value of a tag assigned to the resource. This
--     filter is independent of the @tag-key@ filter.
--
dvclrqFilters :: Lens' DescribeVPCClassicLink [Filter]
dvclrqFilters = lens _dvclrqFilters (\ s a -> s{_dvclrqFilters = a}) . _Default;

-- | One or more VPCs for which you want to describe the ClassicLink status.
dvclrqVPCIds :: Lens' DescribeVPCClassicLink [Text]
dvclrqVPCIds = lens _dvclrqVPCIds (\ s a -> s{_dvclrqVPCIds = a}) . _Default;

-- | Checks whether you have the required permissions for the action, without
-- actually making the request, and provides an error response. If you have
-- the required permissions, the error response is @DryRunOperation@.
-- Otherwise, it is @UnauthorizedOperation@.
dvclrqDryRun :: Lens' DescribeVPCClassicLink (Maybe Bool)
dvclrqDryRun = lens _dvclrqDryRun (\ s a -> s{_dvclrqDryRun = a});

instance AWSRequest DescribeVPCClassicLink where
        type Sv DescribeVPCClassicLink = EC2
        type Rs DescribeVPCClassicLink =
             DescribeVPCClassicLinkResponse
        request = post
        response
          = receiveXML
              (\ s h x ->
                 DescribeVPCClassicLinkResponse' <$>
                   (x .@? "vpcSet" .!@ mempty >>=
                      may (parseXMLList "item"))
                     <*> (pure (fromEnum s)))

instance ToHeaders DescribeVPCClassicLink where
        toHeaders = const mempty

instance ToPath DescribeVPCClassicLink where
        toPath = const "/"

instance ToQuery DescribeVPCClassicLink where
        toQuery DescribeVPCClassicLink'{..}
          = mconcat
              ["Action" =:
                 ("DescribeVPCClassicLink" :: ByteString),
               "Version" =: ("2015-04-15" :: ByteString),
               toQuery (toQueryList "Filter" <$> _dvclrqFilters),
               toQuery (toQueryList "VpcId" <$> _dvclrqVPCIds),
               "DryRun" =: _dvclrqDryRun]

-- | /See:/ 'describeVPCClassicLinkResponse' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'dvclrsVPCs'
--
-- * 'dvclrsStatus'
data DescribeVPCClassicLinkResponse = DescribeVPCClassicLinkResponse'
    { _dvclrsVPCs   :: !(Maybe [VPCClassicLink])
    , _dvclrsStatus :: !Int
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'DescribeVPCClassicLinkResponse' smart constructor.
describeVPCClassicLinkResponse :: Int -> DescribeVPCClassicLinkResponse
describeVPCClassicLinkResponse pStatus_ =
    DescribeVPCClassicLinkResponse'
    { _dvclrsVPCs = Nothing
    , _dvclrsStatus = pStatus_
    }

-- | The ClassicLink status of one or more VPCs.
dvclrsVPCs :: Lens' DescribeVPCClassicLinkResponse [VPCClassicLink]
dvclrsVPCs = lens _dvclrsVPCs (\ s a -> s{_dvclrsVPCs = a}) . _Default;

-- | FIXME: Undocumented member.
dvclrsStatus :: Lens' DescribeVPCClassicLinkResponse Int
dvclrsStatus = lens _dvclrsStatus (\ s a -> s{_dvclrsStatus = a});
