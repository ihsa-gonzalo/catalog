//Archivo en el cual se declararán los eventos de patrón BLoC.

/*
Primero es necesario definir los eventos, una de las formas más fáciles es hacerlo con clases.
Vamos a crear una clase abstracta base de la cual van a extender 
el resto de nuestros eventos de usuario.
*/
abstract class UserEvent {}

/*

Luego vamos a definir el evento que se ejecutará al momento de hacer un cambio en el nombre de usuario.
Este va a recibir como parámetro un String.
*/

class OnChangeEvent extends UserEvent {
  final String value;

  OnChangeEvent(this.value);
}

/*

Por último vamos a definir otro evento con el cual obtendremos el nombre de usuario actual, 
esto lo vamos a necesitar para actualizar la data entre pantallas o tomar el valor fuera de una vista.

*/
class GetUsernameEvent extends UserEvent {}