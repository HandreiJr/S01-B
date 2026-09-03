use std::io;

fn imprimir_terminados_em(digito: i32, limite_inferior: i32, limite_superior: i32) {
    println!("-- numeros no intervalo terminados em {} --", digito);
    for i in limite_inferior..=limite_superior {
        if i % 10 == digito {
            println!("{}", i);
        }
    }
}

fn main() {
    let mut ent_digito = String::new();
    println!("digite o digito final desejado (0 a 9):");
    io::stdin().read_line(&mut ent_digito).expect("Erro ao ler");
    let digito: i32 = ent_digito.trim().parse().unwrap_or(0);
    
    let mut ent_inf = String::new();
    println!("digite o limite inferior:");
    io::stdin().read_line(&mut ent_inf).expect("Erro ao ler");
    let inferior: i32 = ent_inf.trim().parse().unwrap_or(0);
    
    let mut ent_sup = String::new();
    println!("digite o limite superior:");
    io::stdin().read_line(&mut ent_sup).expect("Erro ao ler");
    let superior: i32 = ent_sup.trim().parse().unwrap_or(0);
    
    imprimir_terminados_em(digito, inferior, superior);
}