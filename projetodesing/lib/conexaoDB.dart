import 'package:postgres/postgres.dart';

Future<void> main() async {
  // Configurar a conexão com o banco de dados
  final connection = PostgreSQLConnection(
    'localhost', // Host do banco de dados
    5432, // Porta do banco de dados
    'LinguiLearn', // Nome do banco de dados
    username: 'root', // Usuário do banco de dados
    password: 'root', // Senha do banco de dados
  );

  try {
    // Tentar abrir a conexão
    await connection.open();
    print('Conectado ao banco de dados com sucesso.');

    // Executar uma consulta
    List<List<dynamic>> results =
        await connection.query('SELECT * FROM UserLinguilearn');
    print('Consulta executada com sucesso.');
    for (final row in results) {
      print('Linha: $row');
    }

    // Fechar a conexão
    await connection.close();
    print('Conexão fechada com sucesso.');
  } catch (e) {
    // Capturar e exibir erros
    print('Falha na conexão com o banco de dados: $e');
  }
}
