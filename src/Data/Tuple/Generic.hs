{-# LANGUAGE
MultiParamTypeClasses,
FunctionalDependencies,
FlexibleInstances
  #-}

module Data.Tuple.Generic
(
  cons,
  snoc,
)
where

class TupleCons a b x | a b -> x, a x -> b, b x -> a where
  cons :: x -> a -> b

instance TupleCons (a, b) (x, a, b) x where
  cons x ~(a, b) = (x, a, b)
  {-# INLINE cons #-}

instance TupleCons (a, b, c) (x, a, b, c) x where
  cons x ~(a, b, c) = (x, a, b, c)
  {-# INLINE cons #-}

instance TupleCons (a, b, c, d) (x, a, b, c, d) x where
  cons x ~(a, b, c, d) = (x, a, b, c, d)
  {-# INLINE cons #-}

instance TupleCons (a, b, c, d, e) (x, a, b, c, d, e) x where
  cons x ~(a, b, c, d, e) = (x, a, b, c, d, e)
  {-# INLINE cons #-}

class TupleSnoc a b x | a b -> x, a x -> b, b x -> a where
  snoc :: a -> x -> b

instance TupleSnoc (a, b) (a, b, x) x where
  snoc ~(a, b) x = (a, b, x)
  {-# INLINE snoc #-}

instance TupleSnoc (a, b, c) (a, b, c, x) x where
  snoc ~(a, b, c) x = (a, b, c, x)
  {-# INLINE snoc #-}

instance TupleSnoc (a, b, c, d) (a, b, c, d, x) x where
  snoc ~(a, b, c, d) x = (a, b, c, d, x)
  {-# INLINE snoc #-}

instance TupleSnoc (a, b, c, d, e) (a, b, c, d, e, x) x where
  snoc ~(a, b, c, d, e) x = (a, b, c, d, e, x)
  {-# INLINE snoc #-}
