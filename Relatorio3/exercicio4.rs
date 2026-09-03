use std::io;

fn calcular_pontuacao(prova1: f64, prova2: f64, redacao: f64) -> f64 {
    let npt = (prova1 + prova2) / 2.0;
    let pf = (npt * 0.6) + (redacao * 0.4);
    
    if pf >= 60.0 {
        println!("Parabens! Candidato aprovado no processo seletivo.");
    } else {
        println!("Infelizmente o candidato nao atingiu a pontuacao minima de aprovacao.");
    }
    
    pf
}

fn main() {
    let mut ent_p1 = String::new();
    println!("Digite a nota da Prova Teorica 1:");
    io::stdin().read_line(&mut ent_p1).expect("Erro ao ler");
    let prova1: f64 = ent_p1.trim().parse().unwrap_or(0.0);
    
    let mut ent_p2 = String::new();
    println!("Digite a nota da Prova Teorica 2:");
    io::stdin().read_line(&mut ent_p2).expect("Erro ao ler");
    let prova2: f64 = ent_p2.trim().parse().unwrap_or(0.0);
    
    let mut ent_red = String::new();
    println!("Digite a nota da Redacao:");
    io::stdin().read_line(&mut ent_red).expect("Erro ao ler");
    let redacao: f64 = ent_red.trim().parse().unwrap_or(0.0);
    
    let pontuacao_final = calcular_pontuacao(prova1, prova2, redacao);
    println!("Pontuacao Final: {:.2}", pontuacao_final); 
}