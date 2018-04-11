--SUMA
suma :: [Int]->Int
suma l = sumaAcum l 0

sumaAcum :: [Int] -> Int -> Int
sumaAcum [] n = n
sumaAcum (x:xs) n = sumaAcum xs y where y = x+n
--DATO ARBOL
data Tree a = Null | Leaf a |Node (Tree a) a (Tree a) deriving (Show)
--FRONTERA
frontera :: (Eq a) => Tree a -> [a]
frontera Null = []
frontera (Leaf a) = [a]
frontera (Node l a r)= (frontera l) ++ (frontera r)
--MAP
mapTree :: (Num a)=>(a->a)->Tree a-> Tree a
mapTree f Null = Null
mapTree f (Leaf x)= Leaf (f x)
mapTree f (Node l v r)= Node (mapTree f l) (f v) (mapTree f r)
