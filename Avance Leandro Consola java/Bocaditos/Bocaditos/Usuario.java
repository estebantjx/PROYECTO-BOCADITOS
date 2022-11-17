package Bocaditos;
import java.math.BigInteger;
import java.util.Scanner;

import org.xml.sax.SAXException;

import Bocaditos.Roles;
public class Usuario {
    Scanner read = new Scanner(System.in);
    int usuDocumento= 10303040;
    String usuCorreo = "jose@gmail.com", usuContraseña="123", usuApellido="Rodriguez", usuNombre="Jose", usuDireccion="Calle 12";
    long usuTelefono= 319255794;
    String usuEstado = "Activo";
    int usuId = 1;
    int modificar;
    String loginCorreo;
    String loginContraseña;
int seleccion;
int eliminar;

    public void Registrar(){
        System.out.println("Registro:");

            System.out.println("\nIngrese el correo electronico:");
            usuCorreo = read.next();
            System.out.println("\nIngrese la contraseña:");
            usuContraseña = read.next();
                        System.out.println("\nIngrese el nombre:");
            usuNombre = read.next();
            System.out.println("\nIngrese el apellido:");
            usuApellido = read.next();
            System.out.println("\nIngrese el numero de documento:");
            usuDocumento = read.nextInt();
            System.out.println("\nIngrese el numero telefonico:");
            usuTelefono = read.nextLong();  read.nextLine();
            System.out.println("\nIngrese la direccion:");
            usuDireccion = read.nextLine();
            System.out.println("\nRegistrado con exito.");
    }
    public void Mostrar(){
      Roles roles = new Roles();
      System.out.println("\nConsultar usuario: ");
      System.out.println("ID: " + usuId);
      System.out.println("Correo electronico: "+ usuCorreo);
      System.out.println("Nombre y apellido: "+ usuNombre+ " " + usuApellido);
      System.out.println("Documento: " + usuDocumento);
      System.out.println("Telefono: " + usuTelefono);
      System.out.println("Direccion: " + usuDireccion);
      System.out.println("Estado: " + usuEstado);
      System.out.println("Rol ID: " + roles.rolId[0]);
    }
        public void Modificar(){
        System.out.println("\nModificar:\nSeleccione la opcion que desea modificar:\n1.- Correo electronico\n2.- Contraseña\n3.- Nombre\n4.- Apellido\n5.- Documento\n6.- Numero telefonico\n7.- Direccion\n8.- Estado");
        modificar = read.nextInt();
        do{
switch (modificar) {
  case 1:
  System.out.println("Correo electronico actual: " + usuCorreo);
    System.out.println("\nModificar el correo electronico:");
            usuCorreo = read.next();
            System.out.println("\nModificación exitosa:");
    break;
    case 2: 
    System.out.println("Contraseña actual: " + usuContraseña);
            System.out.println("\nModificar la contraseña:");
            usuContraseña = read.next();
            System.out.println("\nModificación exitosa:");
            break;
            case 3: 
            System.out.println("Nombre actual: " + usuNombre);
            System.out.println("\nModificar el nombre:");
            usuNombre = read.next();
            System.out.println("\nModificación exitosa:");
            break;
            case 4:
            System.out.println("Apellido actual: " + usuApellido);
            System.out.println("\nModificar el apellido:");
            usuApellido = read.next();
             System.out.println("\nModificación exitosa:");
            break;
            case 5:
            System.out.println("Documento actual: " + usuDocumento);
            System.out.println("\nModificar el numero de documento:");
            usuDocumento = read.nextInt();
            System.out.println("\nModificación exitosa:");
            break;
            case 6:
             System.out.println("Numero telefonico actual: " + usuTelefono);
            System.out.println("\nModificar el numero telefonico:");
            usuTelefono = read.nextLong();  read.nextLine();
            System.out.println("\nModificación exitosa:");
            break;
            case 7:
             System.out.println("Documento actual: " + usuDocumento);
            System.out.println("\nModificar el documento:");
            usuDocumento= read.nextInt();
            System.out.println("\nModificación exitosa:");
            break;
            case 8:
            System.out.println("Estado actual: "+ usuEstado);
             System.out.println("\nModificar el estado:");
             usuEstado= read.next();
             System.out.println("\nModificación exitosa:");
             break;
  default:
  System.out.println("No ingreso un dato valido.");
    break;
}
System.out.println("¿Desea modificar algo mas?\n1.- Si\n2.- No");
seleccion = read.nextInt();
}while (seleccion ==1 ) ;

}
public void Eliminar(){
System.out.println("\nIngrese el ID del usuario que desea eliminar: ");
eliminar = read.nextInt();
if(usuId == 1){
 usuDocumento= 0;
  usuCorreo = null; usuContraseña= null; usuApellido= null; usuNombre= null; usuDireccion= null;
    usuTelefono= 0;
    usuEstado = null;
    usuId = 0;
    System.out.println("Usuario eliminado satisfactoriamente.");
}
else{
  System.out.println("ID Incorrecto");
}

}
   public void Login(){
  System.out.println("\nLogin:\nIngrese su correo electronico: ");
loginCorreo = read.next(); read.nextLine();
System.out.println("Ingrese su contraseña: ");
loginContraseña = read.nextLine();

}

}        






    

