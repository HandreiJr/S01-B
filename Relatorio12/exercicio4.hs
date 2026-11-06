data Etapa = NaFila | NoBanho | Concluido deriving (Show, Eq)

data Atendimento = Atendimento { cliente :: String, servico :: String, valor :: Double, etapa :: Etapa }

descrever :: Atendimento -> String
descrever a = cliente a ++ " - " ++ servico a ++ " (" ++ show (etapa a) ++ ")"

concluir :: Atendimento -> Atendimento
concluir a = a { etapa = Concluido }

arrecadado :: [Atendimento] -> Double
arrecadado xs = sum (map valor (filter (\a -> etapa a == Concluido) xs))

main :: IO ()
main = do
    let listaOriginal = [
            Atendimento "Deus do Rio" "Banho Herbal" 500.0 NaFila,
            Atendimento "Sem-Rosto" "Limpeza Energetica" 150.0 NoBanho,
            Atendimento "Aogaeru" "Banho Simples" 80.0 NaFila
            ]
    
    let listaAtualizada = [concluir (listaOriginal !! 0), listaOriginal !! 1, concluir (listaOriginal !! 2)]
    
    putStrLn "--- Lista Original ---"
    mapM_ (putStrLn . descrever) listaOriginal
    putStrLn ("Arrecadado original: " ++ show (arrecadado listaOriginal))
    
    putStrLn "--- Lista Atualizada ---"
    mapM_ (putStrLn . descrever) listaAtualizada
    putStrLn ("Arrecadado atualizado: " ++ show (arrecadado listaAtualizada))