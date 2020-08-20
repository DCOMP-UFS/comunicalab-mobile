//Possíveis usuários do sistema
enum Users { technician, student, teacher }

/*
* Esta classe define algumas variáveis que dependem do tipo de usuário logado.
* Futuramente, ela deve ser adaptada ao sistema de login do app.
* */
class User {
  final String _username = 'Java Martins';
  final Users _userType = Users.student;

  String get getUser => _username;

  Users get getUserType => _userType;
}
