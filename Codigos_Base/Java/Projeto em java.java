1. Classe Cliente.java
public class Cliente {
    private String nome;
    private String email;

    public Cliente(String nome, String email) {
        this.nome = nome;
        this.email = email;
    }

    public String getNome() { return nome; }
    public String getEmail() { return email; }
}



🗃️ 2. Classe ClienteDAO.java (acesso ao banco)
import java.sql.*;

public class ClienteDAO {
    private Connection conn;

    public ClienteDAO() throws SQLException {
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cadastro", "root", "senha");
    }

    public void salvar(Cliente cliente) throws SQLException {
        String sql = "INSERT INTO clientes (nome, email) VALUES (?, ?)";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, cliente.getNome());
        stmt.setString(2, cliente.getEmail());
        stmt.executeUpdate();
    }
}



🖼️ 3. Interface TelaCadastro.java
import javax.swing.*;
import java.awt.event.*;

public class TelaCadastro extends JFrame {
    private JTextField campoNome = new JTextField(20);
    private JTextField campoEmail = new JTextField(20);
    private JButton botaoSalvar = new JButton("Salvar");

    public TelaCadastro() {
        setTitle("Cadastro de Cliente");
        setSize(300, 150);
        setDefaultCloseOperation(EXIT_ON_CLOSE);
        setLayout(new BoxLayout(getContentPane(), BoxLayout.Y_AXIS));

        add(new JLabel("Nome:"));
        add(campoNome);
        add(new JLabel("Email:"));
        add(campoEmail);
        add(botaoSalvar);

        botaoSalvar.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                try {
                    Cliente cliente = new Cliente(campoNome.getText(), campoEmail.getText());
                    ClienteDAO dao = new ClienteDAO();
                    dao.salvar(cliente);
                    JOptionPane.showMessageDialog(null, "Cliente salvo com sucesso!");
                } catch (Exception ex) {
                    JOptionPane.showMessageDialog(null, "Erro: " + ex.getMessage());
                }
            }
        });

        setVisible(true);
    }

    public static void main(String[] args) {
        new TelaCadastro();
    }
}



🛠️ Banco de Dados MySQL
CREATE DATABASE cadastro;
USE cadastro;

CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100)
);



🚀 Como rodar
- Instale o MySQL e crie o banco conforme acima
- Adicione o mysql-connector-java.jar ao classpath
- Compile e execute com javac e java ou use uma IDE como Eclipse ou IntelliJ
