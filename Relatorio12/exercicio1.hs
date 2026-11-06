data Cafe = Cafe String Double Int

descrever :: Cafe -> String
descrever (Cafe nome preco _) = nome ++ " - " ++ show preco

forca :: Cafe -> String
forca (Cafe _ _ intensidade)
    | intensidade >= 8 = "Forte"
    | intensidade >= 5 = "Equilibrado"
    | otherwise = "Suave"

precoDoPedido :: Bool -> Cafe -> Double
precoDoPedido pediuLeite (Cafe _ preco _) = if pediuLeite then preco + 2.0 else preco

main :: IO ()
main = do
    let c1 = Cafe "Mocha" 12.0 4
    let c2 = Cafe "Expresso" 8.0 6
    let c3 = Cafe "Ristretto" 10.0 9
    
    putStrLn (descrever c1 ++ " (" ++ forca c1 ++ ")")
    putStrLn (descrever c2 ++ " (" ++ forca c2 ++ ")")
    putStrLn (descrever c3 ++ " (" ++ forca c3 ++ ")")
    
    print (precoDoPedido True c2)
    print (precoDoPedido False c2)