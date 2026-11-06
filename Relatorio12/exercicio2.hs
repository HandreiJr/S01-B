pesoMaximo :: Double
pesoMaximo = 15.0

data Encomenda = Encomenda { destinatario :: String, peso :: Double, frete :: Double }

descrever :: Encomenda -> String
descrever e = destinatario e ++ " - " ++ show (peso e) ++ "kg - R$ " ++ show (frete e)

cabemNaVassoura :: [Encomenda] -> [Encomenda]
cabemNaVassoura = filter (\e -> peso e <= pesoMaximo)

totalDeFretes :: [Encomenda] -> Double
totalDeFretes xs = sum (map frete xs)

main :: IO ()
main = do
    let encomendas = [
            Encomenda "Tombo" 5.0 20.0,
            Encomenda "Ursula" 18.0 50.0,
            Encomenda "Madame" 10.0 35.0,
            Encomenda "Ozen" 22.0 70.0
            ]
    
    putStrLn "--- Todas as Encomendas ---"
    mapM_ (putStrLn . descrever) encomendas
    
    let validas = cabemNaVassoura encomendas
    putStrLn "--- Cabem na Vassoura ---"
    mapM_ (putStrLn . descrever) validas
    
    putStrLn "--- Total de Fretes ---"
    print (totalDeFretes validas)