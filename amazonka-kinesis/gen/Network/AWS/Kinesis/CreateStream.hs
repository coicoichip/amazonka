{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE OverloadedStrings  #-}
{-# LANGUAGE RecordWildCards    #-}
{-# LANGUAGE TypeFamilies       #-}

{-# OPTIONS_GHC -fno-warn-unused-binds   #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.Kinesis.CreateStream
-- Copyright   : (c) 2013-2015 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)
--
-- Creates a Amazon Kinesis stream. A stream captures and transports data
-- records that are continuously emitted from different data sources or
-- /producers/. Scale-out within an Amazon Kinesis stream is explicitly
-- supported by means of shards, which are uniquely identified groups of
-- data records in an Amazon Kinesis stream.
--
-- You specify and control the number of shards that a stream is composed
-- of. Each open shard can support up to 5 read transactions per second, up
-- to a maximum total of 2 MB of data read per second. Each shard can
-- support up to 1000 records written per second, up to a maximum total of
-- 1 MB data written per second. You can add shards to a stream if the
-- amount of data input increases and you can remove shards if the amount
-- of data input decreases.
--
-- The stream name identifies the stream. The name is scoped to the AWS
-- account used by the application. It is also scoped by region. That is,
-- two streams in two different accounts can have the same name, and two
-- streams in the same account, but in two different regions, can have the
-- same name.
--
-- @CreateStream@ is an asynchronous operation. Upon receiving a
-- @CreateStream@ request, Amazon Kinesis immediately returns and sets the
-- stream status to @CREATING@. After the stream is created, Amazon Kinesis
-- sets the stream status to @ACTIVE@. You should perform read and write
-- operations only on an @ACTIVE@ stream.
--
-- You receive a @LimitExceededException@ when making a @CreateStream@
-- request if you try to do one of the following:
--
-- -   Have more than five streams in the @CREATING@ state at any point in
--     time.
-- -   Create more shards than are authorized for your account.
--
-- For the default shard limit for an AWS account, see
-- <http://docs.aws.amazon.com/kinesis/latest/dev/service-sizes-and-limits.html Amazon Kinesis Limits>.
-- If you need to increase this limit,
-- <http://docs.aws.amazon.com/general/latest/gr/aws_service_limits.html contact AWS Support>
--
-- You can use @DescribeStream@ to check the stream status, which is
-- returned in @StreamStatus@.
--
-- CreateStream has a limit of 5 transactions per second per account.
--
-- <http://docs.aws.amazon.com/kinesis/latest/APIReference/API_CreateStream.html>
module Network.AWS.Kinesis.CreateStream
    (
    -- * Request
      CreateStream
    -- ** Request constructor
    , createStream
    -- ** Request lenses
    , csrqStreamName
    , csrqShardCount

    -- * Response
    , CreateStreamResponse
    -- ** Response constructor
    , createStreamResponse
    ) where

import           Network.AWS.Kinesis.Types
import           Network.AWS.Prelude
import           Network.AWS.Request
import           Network.AWS.Response

-- | Represents the input for @CreateStream@.
--
-- /See:/ 'createStream' smart constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'csrqStreamName'
--
-- * 'csrqShardCount'
data CreateStream = CreateStream'
    { _csrqStreamName :: !Text
    , _csrqShardCount :: !Nat
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'CreateStream' smart constructor.
createStream :: Text -> Natural -> CreateStream
createStream pStreamName_ pShardCount_ =
    CreateStream'
    { _csrqStreamName = pStreamName_
    , _csrqShardCount = _Nat # pShardCount_
    }

-- | A name to identify the stream. The stream name is scoped to the AWS
-- account used by the application that creates the stream. It is also
-- scoped by region. That is, two streams in two different AWS accounts can
-- have the same name, and two streams in the same AWS account, but in two
-- different regions, can have the same name.
csrqStreamName :: Lens' CreateStream Text
csrqStreamName = lens _csrqStreamName (\ s a -> s{_csrqStreamName = a});

-- | The number of shards that the stream will use. The throughput of the
-- stream is a function of the number of shards; more shards are required
-- for greater provisioned throughput.
--
-- DefaultShardLimit;
csrqShardCount :: Lens' CreateStream Natural
csrqShardCount = lens _csrqShardCount (\ s a -> s{_csrqShardCount = a}) . _Nat;

instance AWSRequest CreateStream where
        type Sv CreateStream = Kinesis
        type Rs CreateStream = CreateStreamResponse
        request = postJSON
        response = receiveNull CreateStreamResponse'

instance ToHeaders CreateStream where
        toHeaders
          = const
              (mconcat
                 ["X-Amz-Target" =#
                    ("Kinesis_20131202.CreateStream" :: ByteString),
                  "Content-Type" =#
                    ("application/x-amz-json-1.1" :: ByteString)])

instance ToJSON CreateStream where
        toJSON CreateStream'{..}
          = object
              ["StreamName" .= _csrqStreamName,
               "ShardCount" .= _csrqShardCount]

instance ToPath CreateStream where
        toPath = const "/"

instance ToQuery CreateStream where
        toQuery = const mempty

-- | /See:/ 'createStreamResponse' smart constructor.
data CreateStreamResponse =
    CreateStreamResponse'
    deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | 'CreateStreamResponse' smart constructor.
createStreamResponse :: CreateStreamResponse
createStreamResponse = CreateStreamResponse'
