module EvalIdentity where

import Control.Monad

data Exp = Lit Double
         | Add Exp Exp
         | Mul Exp Exp
  deriving(Eq, Ord, Read, Show)

newtype Id a = Id { unId :: a }

instance Monad Id where
    return x = Id x
    m >>= f  = f (unId m)

instance Functor Id where
    fmap = liftM

instance Applicative Id where
    pure  = return
    (<*>) = ap

runId :: Id a -> a
runId = unId

eval :: Monad m => Exp -> m Double
eval (Lit n)      = return n
eval (Add e1 e2)  = do { x <- eval e1
                       ; y <- eval e2
                       ; return (x + y)
                       }
eval (Mul e1 e2)  = do { x <- eval e1
                       ; y <- eval e2
                       ; return (x * y)
                       }
