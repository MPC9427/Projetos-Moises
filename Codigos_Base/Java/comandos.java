1. Olá, Mundo!
public class OlaMundo {
    public static void main(String[] args) {
        System.out.println("Olá, Mundo!");
    }
}



🔢 2. Soma de dois números
import java.util.Scanner;

public class Soma {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Digite o primeiro número: ");
        int a = sc.nextInt();
        System.out.print("Digite o segundo número: ");
        int b = sc.nextInt();
        int soma = a + b;
        System.out.println("Soma: " + soma);
    }
}



🔁 3. Laço for para contar até 5
public class Contador {
    public static void main(String[] args) {
        for (int i = 1; i <= 5; i++) {
            System.out.println("Contando: " + i);
        }
    }
}



🔄 4. Verificar se um número é par ou ímpar
public class ParOuImpar {
    public static void main(String[] args) {
        int numero = 7;
        if (numero % 2 == 0) {
            System.out.println("É par");
        } else {
            System.out.println("É ímpar");
        }
    }
}



📦 5. Classe com atributos e método
public class Pessoa {
    String nome;
    int idade;

    void apresentar() {
        System.out.println("Olá, meu nome é " + nome + " e tenho " + idade + " anos.");
    }

    public static void main(String[] args) {
        Pessoa p = new Pessoa();
        p.nome = "Ana";
        p.idade = 25;
        p.apresentar();
    }
}



Se quiser exemplos mais avançados como uso de listas, arquivos, banco de dados, interfaces gráficas (Swing/JavaFX) ou programação orientada a objetos, posso te mostrar também. Qual tema você quer explorar?



 1. Manipulação de Listas (ArrayList)
import java.util.ArrayList;

public class ListaExemplo {
    public static void main(String[] args) {
        ArrayList<String> nomes = new ArrayList<>();
        nomes.add("Ana");
        nomes.add("Bruno");
        nomes.add("Carlos");

        for (String nome : nomes) {
            System.out.println("Nome: " + nome);
        }
    }
}



📁 2. Leitura de Arquivo Texto
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

public class LeitorArquivo {
    public static void main(String[] args) {
        try (BufferedReader br = new BufferedReader(new FileReader("dados.txt"))) {
            String linha;
            while ((linha = br.readLine()) != null) {
                System.out.println(linha);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}



🧱 3. Herança e Polimorfismo
class Animal {
    void emitirSom() {
        System.out.println("Som genérico");
    }
}

class Cachorro extends Animal {
    void emitirSom() {
        System.out.println("Au au!");
    }
}

public class TestePolimorfismo {
    public static void main(String[] args) {
        Animal a = new Cachorro();
        a.emitirSom(); // Saída: Au au!
    }
}



🖼️ 4. Interface Gráfica com Swing
import javax.swing.*;

public class JanelaSimples {
    public static void main(String[] args) {
        JFrame frame = new JFrame("Minha Janela");
        JLabel label = new JLabel("Olá, Swing!", SwingConstants.CENTER);
        frame.add(label);
        frame.setSize(300, 200);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setVisible(true);
    }
}



🗃️ 5. Conexão com Banco de Dados (JDBC)

import java.sql.*;

public class ConexaoBD {
    public static void main(String[] args) {
        String url = "jdbc:mysql://localhost:3306/meubanco";
        String usuario = "root";
        String senha = "1234";

        try (Connection conn = DriverManager.getConnection(url, usuario, senha)) {
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM clientes");

            while (rs.next()) {
                System.out.println("Nome: " + rs.getString("nome"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}



Se quiser, posso montar um mini projeto completo com interface, banco de dados e lógica de negócio. Ou te mostrar como criar uma API REST com Spring Boot. Qual caminho você prefere seguir agora?
