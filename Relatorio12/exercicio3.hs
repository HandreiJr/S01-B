data Esboco = Esboco { titulo :: String, tecnica :: String, horas :: Int }

esbocoMaisRecente :: [Esboco] -> String
esbocoMaisRecente [] = "Caderno vazio"
esbocoMaisRecente (e:_) = titulo e ++ " (" ++ tecnica e ++ ")"

contarEsbocos :: [Esboco] -> Int
contarEsbocos [] = 0
contarEsbocos (_:xs) = 1 + contarEsbocos xs

horasDesenhando :: [Esboco] -> Int
horasDesenhando [] = 0
horasDesenhando (e:xs) = horas e + horasDesenhando xs

main :: IO ()
main = do
    let caderno1 = [
            Esboco "Dragao" "Nanquin" 4,
            Esboco "Ruina" "Grafite" 2,
            Esboco "Floresta" "Carvao" 3
            ]
    
    putStrLn ("Mais recente: " ++ esbocoMaisRecente caderno1)
    putStrLn ("Total de esbocos: " ++ show (contarEsbocos caderno1))
    putStrLn ("Total de horas: " ++ show (horasDesenhando caderno1))
    
    putStrLn ("Caderno vazio: " ++ esbocoMaisRecente [])
    
    let caderno2 = Esboco "Castelo" "Nanquin" 5 : caderno1
    putStrLn ("Novo caderno mais recente: " ++ esbocoMaisRecente caderno2)
    putStrLn ("Novo caderno total de esbocos: " ++ show (contarEsbocos caderno2))
    putStrLn ("Caderno anterior continua com: " ++ show (contarEsbocos caderno1))