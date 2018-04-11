--DIFERENCIA
diferencia :: (Eq a)=>[a]->[a]->[a]
diferencia [] ys = []
diferencia (x:xs) ys = if notElem x ys then [x] ++ diferencia xs ys else diferencia xs ys
--SUSTITUIR
sustituir :: (Eq a)=> a -> a -> [a]->[a]
sustituir e1 e2 [] = []
sustituir e1 e2 (x:xs) | e1==x =(e2:l) |otherwise = [x] ++ sustituir e1 e2 xs where l = sustituir e1 e2 xs 
--Num brandeth
--a
isBrandreth :: Int -> Bool
isBrandreth n | ((div (n^2) 100)+(mod (n^2) 100))==n = True | otherwise = False
--b
numBrandreth :: [(Int,Int)]
numBrandreth = [(e,e*e)|e<-[32..99], isBrandreth e]
