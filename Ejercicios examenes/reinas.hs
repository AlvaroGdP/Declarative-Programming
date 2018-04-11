import Data.List

reinas1 :: Int -> [[Int]] 

reinas1 n = [rs | rs <- permutations [1..n], segura rs] 

 

-- (segura rs)  se verifica si rs es una lista de m números  

-- [n_1,...,n_m] tal que las reinas colocadas en las posiciones (x, 

-- n_1), ..., (x + m, n_m) no se atacan entre sí. 

segura [] = True 

segura (r:rs) = noAtaca r rs 1 && segura rs   

                 

-- (noAtaca r rs d) se verifica si la reina r no ataca a niguna de las 

-- de la lista rs donde la primera de la lista está a una distancia 

-- horizontal d.  

noAtaca :: Int -> [Int] -> Int -> Bool 

noAtaca _ [] _ = True 

noAtaca r (a:rs) distH = abs(r-a) /= distH && 

                         noAtaca r rs (distH+1) 