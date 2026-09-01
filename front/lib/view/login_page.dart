import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isPasswordObscured = true;
  bool _isLoading = false; // Controla o estado do botão de carregamento

  @override
  void dispose() {
    _loginController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // 2. FUNÇÃO QUE CONECTA A TELA COM A CLASSE USUARIO
  Future<void> _handleLogin() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      try {
        // Simulação de chamada assíncrona ao backend
        await Future.delayed(const Duration(seconds: 2));

        // Dados simulados retornados pela API no formato do seu primeiro código
        final Map<String, dynamic> jsonResponse = {
          'id': 'usr_001',
          'nome': 'João Silva',
          'email': _loginController.text,
          'cargo': 'gerente', // Deve existir dentro do enum 'Cargos'
          'setor': Setor(id: '1', nome: 'TI'), // Instância da classe Setor
        };

        // 3. INSTANCIAÇÃO DA CLASSE USUARIO USANDO O MÉTODO fromJSON
        final Usuario usuarioLogado = Usuario.fromJSON(jsonResponse);

        if (!mounted) return;

        // Feedback visual de sucesso
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Bem-vindo(a), ${usuarioLogado.nome}!'),
            backgroundColor: Colors.green,
          ),
        );

        // 4. NAVEGAÇÃO PARA A PRÓXIMA TELA PASSANDO O USUÁRIO LOGADO
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(usuario: usuarioLogado),
          ),
        );
      } catch (e) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erro ao efetuar login: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      } finally {
        if (mounted) {
          setState(() {
            _isLoading = false;
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Login',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 32),

                // Campo Usuário / E-mail
                TextFormField(
                  controller: _loginController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'E-mail / Usuário',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Por favor, informe o e-mail / usuário';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Campo Senha
                TextFormField(
                  controller: _passwordController,
                  obscureText: _isPasswordObscured,
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordObscured
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordObscured = !_isPasswordObscured;
                        });
                      },
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, digite sua senha';
                    }
                    if (value.length < 5) {
                      return 'A senha deve ter pelo menos 5 caracteres';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),

                // Botão de Login
                ElevatedButton(
                  onPressed: _isLoading ? null : _handleLogin,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: _isLoading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Text('ENTRAR'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// 5. TELA DE EXEMP LO QUE RECEBE O USUÁRIO LOGADO
class HomePage extends StatelessWidget {
  final Usuario usuario;

  const HomePage({super.key, required this.usuario});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Painel - ${usuario.nome}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('ID: ${usuario.id ?? "Não informado"}', style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            Text('Email: ${usuario.email ?? "Não informado"}', style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            Text('Cargo: ${usuario.cargo.name}', style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}

// MOCK TEMPORÁRIO DAS CLASSES PARA RODAR O CÓDIGO (Remova no seu projeto)
enum Cargos { gerente, admin, desenvolvedor }

class Setor {
  final String id;
  final String nome;
  Setor({required this.id, required this.nome});
}

class Usuario {
  String? id;
  String nome;
  String? email;
  Cargos cargo;
  Setor setor;

  Usuario({
    this.id,
    required this.nome,
    this.email,
    required this.cargo,
    required this.setor,
  });

  factory Usuario.fromJSON(Map<String, dynamic> json) {
    return Usuario(
      id: json['id'],
      nome: json['nome'],
      email: json['email'],
      cargo: Cargos.values.byName(json['cargo']),
      setor: json['setor'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['nome'] = nome;
    json['email'] = email;
    json['cargo'] = cargo.name;
    json['setor'] = setor;
    return json;
  }
}