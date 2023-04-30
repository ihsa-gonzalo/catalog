class UserState {
  /*
  Crear una variable privada, 
  en este caso quiero que el usuario por default sea Guest es por eso que no he dejado un string vacío.
  */
  String _username = 'Guest';
  // Definimos un constructor privado.

  UserState._();
  // Crear una instancia privada usando nuestro constructor.

  static UserState _instance = UserState._();
  // Crear una factory (método que genera las instancias)

  factory UserState() => _instance;
//Crear un get para obtener en nombre de usuario.

  String get username => _username;
//Por último crear el método para actualizar el nombre de usuario.

  void onChange(value) {
    _username = value;
  }
}