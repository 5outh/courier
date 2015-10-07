{-# LANGUAGE DataKinds          #-}
{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE KindSignatures     #-}
{-# LANGUAGE PolyKinds          #-}
{-# LANGUAGE TypeOperators      #-}
module Lib
    ( someFunc
    ) where

import           Data.Text
import           Data.Typeable (Typeable)

data Proxy a = Proxy

data a :| b = a :| b deriving Typeable
infixr 9 :|

data (a :: k) := b deriving Typeable
infixr 9 :=

data Column (a :: k) typ deriving Typeable

type SomeTable = "hello" := Column "hello" Text :| Column "world" Int

someTable :: Proxy SomeTable
someTable = Proxy

-- We need some function that actually handles the "stuff" here (a la `serve`)
-- Some ideas: migrate, store, get
-- How is auto-incrementing done? Migrations totally separate from data types in other frameworks etc

someFunc :: IO ()
someFunc = putStrLn "someFunc"
