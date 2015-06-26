{-# LANGUAGE
CPP,
MultiParamTypeClasses,
FunctionalDependencies,
FlexibleInstances
  #-}

{- |
This module supports operations with tuples with up to 16 elements.

Generic accessors and setters aren't included – if you want that, consider
using <http://hackage.haskell.org/package/microlens microlens>, which is a
dependency-free alternative to <http://hackage.haskell.org/package/lens lens>
providing generic lenses for tuples. This package only gives you 'uncons' and
'unsnoc', which can be used to get the 1st and last element respectively.
-}
module Data.Tuple.Generic
(
  cons,
  uncons,
  snoc,
  unsnoc,
)
where

class TupleCons a b x | b -> x, b -> a, a x -> b where

  -- | Prepend a value to a tuple.
  --
  -- >>> cons 0 (1,2,3)
  -- (0,1,2,3)
  cons :: x -> a -> b

  -- | Split off the 1st element of a tuple.
  --
  -- >>> uncons (0,1,2,3)
  -- (0,(1,2,3))
  uncons :: b -> (x, a)

class TupleSnoc a b x | b -> x, b -> a, a x -> b where
  -- | Append a value to a tuple.
  --
  -- >>> snoc (1,2,3) 4
  -- (1,2,3,4)
  snoc :: a -> x -> b

  -- | Split off the last element of a tuple.
  --
  -- >>> unsnoc (1,2,3,4)
  -- ((1,2,3),4)
  unsnoc :: b -> (a, x)

#define X ,

#define CONS(S) instance TupleCons (S) (x, S) x where \
  cons x ~(S) = (x, S); {-# INLINE cons #-};          \
  uncons ~(x, S) = (x, (S)); {-# INLINE uncons #-};

#define SNOC(S) instance TupleSnoc (S) (S, x) x where \
  snoc ~(S) x = (S, x); {-# INLINE snoc #-};          \
  unsnoc ~(S, x) = ((S), x); {-# INLINE unsnoc #-};

CONS(a1 X a2)
SNOC(a1 X a2)
CONS(a1 X a2 X a3)
SNOC(a1 X a2 X a3)
CONS(a1 X a2 X a3 X a4)
SNOC(a1 X a2 X a3 X a4)
CONS(a1 X a2 X a3 X a4 X a5)
SNOC(a1 X a2 X a3 X a4 X a5)
CONS(a1 X a2 X a3 X a4 X a5 X a6)
SNOC(a1 X a2 X a3 X a4 X a5 X a6)
CONS(a1 X a2 X a3 X a4 X a5 X a6 X a7)
SNOC(a1 X a2 X a3 X a4 X a5 X a6 X a7)
CONS(a1 X a2 X a3 X a4 X a5 X a6 X a7 X a8)
SNOC(a1 X a2 X a3 X a4 X a5 X a6 X a7 X a8)
CONS(a1 X a2 X a3 X a4 X a5 X a6 X a7 X a8 X a9)
SNOC(a1 X a2 X a3 X a4 X a5 X a6 X a7 X a8 X a9)
CONS(a1 X a2 X a3 X a4 X a5 X a6 X a7 X a8 X a9 X a10)
SNOC(a1 X a2 X a3 X a4 X a5 X a6 X a7 X a8 X a9 X a10)
CONS(a1 X a2 X a3 X a4 X a5 X a6 X a7 X a8 X a9 X a10 X a11)
SNOC(a1 X a2 X a3 X a4 X a5 X a6 X a7 X a8 X a9 X a10 X a11)
CONS(a1 X a2 X a3 X a4 X a5 X a6 X a7 X a8 X a9 X a10 X a11 X a12)
SNOC(a1 X a2 X a3 X a4 X a5 X a6 X a7 X a8 X a9 X a10 X a11 X a12)
CONS(a1 X a2 X a3 X a4 X a5 X a6 X a7 X a8 X a9 X a10 X a11 X a12 X a13)
SNOC(a1 X a2 X a3 X a4 X a5 X a6 X a7 X a8 X a9 X a10 X a11 X a12 X a13)
CONS(a1 X a2 X a3 X a4 X a5 X a6 X a7 X a8 X a9 X a10 X a11 X a12 X a13 X a14)
SNOC(a1 X a2 X a3 X a4 X a5 X a6 X a7 X a8 X a9 X a10 X a11 X a12 X a13 X a14)
CONS(a1 X a2 X a3 X a4 X a5 X a6 X a7 X a8 X a9 X a10 X a11 X a12 X a13 X a14 X a15)
SNOC(a1 X a2 X a3 X a4 X a5 X a6 X a7 X a8 X a9 X a10 X a11 X a12 X a13 X a14 X a15)
CONS(a1 X a2 X a3 X a4 X a5 X a6 X a7 X a8 X a9 X a10 X a11 X a12 X a13 X a14 X a15 X a16)
SNOC(a1 X a2 X a3 X a4 X a5 X a6 X a7 X a8 X a9 X a10 X a11 X a12 X a13 X a14 X a15 X a16)
