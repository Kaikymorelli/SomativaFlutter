// Importa o pacote do Flutter
import 'package:flutter/material.dart';

// Função principal que é executada quando o aplicativo é iniciado
void main() {
  // Executa o aplicativo, passando uma instância de MyApp
  runApp(const MyApp());
}

// Classe MyApp que representa o aplicativo como um todo
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Retorna um Scaffold, que é uma estrutura básica de página com barra de título e corpo
    return Scaffold(
      appBar: AppBar(
        // Configura a barra de título
        title: const Text('Tela imc'), // Define o título da barra de título
        centerTitle: true, // Centraliza o título
        backgroundColor: Colors.amber, // Define a cor de fundo da barra de título
      ),
      // Corpo da página
      body: Center(
        child: ElevatedButton(
          child: const Text('Leva pra tela de cadastro dos usuarios'), // Define o texto do botão
          onPressed: () {
            // Define a ação quando o botão é pressionado
            Navigator.pushNamed(
              context,
              '/CadastroUser', // Navega para a rota '/CadastroUser'
            );
          },
        ),
      ),
    );
  }
}

// Classe CadastroUser que representa a tela de cadastro de usuário
class CadastroUser extends StatefulWidget {
  const CadastroUser({super.key});

  @override
  State<CadastroUser> createState() => _CadastroUserState();
}

// Estado da tela de cadastro de usuário
class _CadastroUserState extends State<CadastroUser> {
  TextEditingController usuarioController = TextEditingController(); // Controlador para o campo de usuário
  TextEditingController senhaController = TextEditingController(); // Controlador para o campo de senha
  String _textInfo = "Informe seus dados"; // Variável para armazenar informações de texto

  // Método para realizar o cadastro de usuário
  void _cadastro() {
    setState(() {
      String user = usuarioController.text; // Obtém o valor do campo de usuário
      String senha = senhaController.text; // Obtém o valor do campo de senha
      if (user.isEmpty || senha.isEmpty) {
        _textInfo = "Os campos estão vazios"; // Define uma mensagem de erro se os campos estiverem vazios
      } else {
        _textInfo = "Usuário foi cadastrado com sucesso"; // Define uma mensagem de sucesso se o cadastro for realizado com sucesso
      }
    });
  }

  // Método para limpar os campos e a mensagem de texto
  void _limpar_tela() {
    usuarioController.text = ""; // Limpa o campo de usuário
    senhaController.text = ""; // Limpa o campo de senha
    setState(() {
      _textInfo = "Informe seus dados"; // Define a mensagem de texto para informar dados
    });
  }

  @override
  Widget build(BuildContext context) {
    // Retorna um Scaffold, que é uma estrutura básica de página com barra de título e corpo
    return Scaffold(
      appBar: AppBar(
        // Configura a barra de título
        title: Text("Cadastro de usuário"), // Define o título da barra de título
        centerTitle: true, // Centraliza o título
        backgroundColor: Colors.amber, // Define a cor de fundo da barra de título
        actions: <Widget>[
          // Adiciona um botão na barra de título para limpar os campos
          IconButton(
            onPressed: _limpar_tela, // Define a ação quando o botão é pressionado
            icon: Icon(Icons.refresh), // Define o ícone do botão como um ícone de atualização
          )
        ],
      ),
      // Corpo da página
      body: SingleChildScrollView(
        // Permite rolar o conteúdo da página
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 10), // Define o preenchimento interno
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Ícone representando uma pessoa
            const Icon(
              Icons.person,
              size: 120.0,
              color: Colors.amberAccent,
            ),
            // Campo de entrada para o nome de usuário
            TextField(
              keyboardType: TextInputType.text, // Define o tipo de entrada do teclado
              decoration: InputDecoration(
                labelText: "Usuário", // Define o rótulo do campo de entrada
                labelStyle: TextStyle(color: Colors.amberAccent), // Define o estilo do rótulo
              ),
              textAlign: TextAlign.center, // Centraliza o texto no campo de entrada
              style: TextStyle(fontSize: 25.0), // Define o tamanho do texto
              controller: usuarioController, // Define o controlador do campo de entrada
            ),
            // Campo de entrada para a senha
            TextField(
              keyboardType: TextInputType.text, // Define o tipo de entrada do teclado
              decoration: InputDecoration(
                labelText: "Senha", // Define o rótulo do campo de entrada
                labelStyle: TextStyle(color: Colors.amberAccent), // Define o estilo do rótulo
              ),
              textAlign: TextAlign.center, // Centraliza o texto no campo de entrada
              style: TextStyle(fontSize: 25.0), // Define o tamanho do texto
              obscureText: true, // Oculta o texto digitado
              controller: senhaController, // Define o controlador do campo de entrada
            ),
            // Botão para realizar o cadastro
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: SizedBox(
                height: 50.0,
                child: ElevatedButton(
                  onPressed: _cadastro, // Define a ação quando o botão é pressionado
                  child: const Text("Cadastre-se"), // Define o texto do botão
                ),
              ),
            ),
            // Exibe a mensagem informativa
            Text(
              _textInfo, // Exibe a mensagem informativa
              textAlign: TextAlign.center, // Centraliza o texto
              style: TextStyle(color: Colors.blue, fontSize: 25.0), // Define o estilo do texto
            )
          ],
        ),
      ),
    );
  }
}