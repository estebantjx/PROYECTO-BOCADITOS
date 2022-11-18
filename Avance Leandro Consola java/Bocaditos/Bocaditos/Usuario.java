package Bocaditos;

import java.math.BigInteger;
import java.util.Scanner;

import org.xml.sax.SAXException;

import Bocaditos.Roles;

public class Usuario {
  Scanner read = new Scanner(System.in);
  int[] usuDocumento = { 10303040, 10203030, 12393993, };
  String[] usuCorreo = { "jose@gmail.com", "luis@gmail.com", "maria@gmail.com", "" },
      usuContraseña = { "123", "123123", "123", "" }, usuApellido = { "Rodriguez", "Perez", "Fernandez", "" },
      usuNombre = { "Jose", "Luis", "Maria", "" }, usuDireccion = { "Calle 12", "Calle 43", "Calle 33", "" };
  long[] usuTelefono = { 319255794, 31839292, 32020383 };
  String[] usuEstado = { "Activo", "Activo", "Activo", "Activo" };
  int[] usuId = { 1, 2, 3, 4 };
  int modificar;
  String loginCorreo;
  String loginContraseña;
  int seleccion;
  int eliminar;
  boolean login = false;

  public void Registrar() {
    System.out.println("Registro:");

    System.out.println("\nIngrese el correo electronico:");
    usuCorreo[3] = read.next();
    System.out.println("\nIngrese la contraseña:");
    usuContraseña[3] = read.next();
    System.out.println("\nIngrese el nombre:");
    usuNombre[3] = read.next();
    System.out.println("\nIngrese el apellido:");
    usuApellido[3] = read.next();
    System.out.println("\nIngrese el numero de documento:");
    usuDocumento[3] = read.nextInt();
    System.out.println("\nIngrese el numero telefonico:");
    usuTelefono[3] = read.nextLong();
    read.nextLine();
    System.out.println("\nIngrese la direccion:");
    usuDireccion[3] = read.nextLine();
    System.out.println("\nRegistrado con exito.");
  }

  public void Mostrar() {
    Roles roles = new Roles();
    System.out.println("\nConsultar usuario: ");
    System.out.println("Ingrese el ID del usuario que desea consultar: ");
    seleccion = read.nextInt();
    System.out.println("ID: " + usuId[(seleccion - 1)]);
    System.out.println("Correo electronico: " + usuCorreo[(seleccion - 1)]);
    System.out.println("Nombre y apellido: " + usuNombre[(seleccion - 1)] + " " + usuApellido[(seleccion - 1)]);
    System.out.println("Documento: " + usuDocumento[(seleccion - 1)]);
    System.out.println("Telefono: " + usuTelefono[(seleccion - 1)]);
    System.out.println("Direccion: " + usuDireccion[(seleccion - 1)]);
    System.out.println("Estado: " + usuEstado[(seleccion - 1)]);
    if (usuId[seleccion] == 1) {
      System.out.println("Rol ID: " + roles.rolId[0]);
    } else if (usuId[seleccion] == 2 || usuId[seleccion] == 3) {
      System.out.println("Rol ID: " + roles.rolId[2]);
    }
  }

  public void Modificar() {
    System.out.println("Ingrese el ID del usuario que desea modificar: ");
    seleccion = read.nextInt();
    System.out.println(
        "\nModificar:\nSeleccione la opcion que desea modificar:\n1.- Correo electronico\n2.- Contraseña\n3.- Nombre\n4.- Apellido\n5.- Documento\n6.- Numero telefonico\n7.- Direccion\n8.- Estado");
    modificar = read.nextInt();
    do {
      switch (modificar) {
        case 1:
          System.out.println("Correo electronico actual: " + usuCorreo[(seleccion - 1)]);
          System.out.println("\nModificar el correo electronico:");
          usuCorreo[(seleccion - 1)] = read.next();
          System.out.println("\nModificación exitosa:");
          break;
        case 2:
          System.out.println("Contraseña actual: " + usuContraseña[(seleccion - 1)]);
          System.out.println("\nModificar la contraseña:");
          usuContraseña[(seleccion - 1)] = read.next();
          System.out.println("\nModificación exitosa:");
          break;
        case 3:
          System.out.println("Nombre actual: " + usuNombre[(seleccion - 1)]);
          System.out.println("\nModificar el nombre:");
          usuNombre[(seleccion - 1)] = read.next();
          System.out.println("\nModificación exitosa:");
          break;
        case 4:
          System.out.println("Apellido actual: " + usuApellido[(seleccion - 1)]);
          System.out.println("\nModificar el apellido:");
          usuApellido[(seleccion - 1)] = read.next();
          System.out.println("\nModificación exitosa:");
          break;
        case 5:
          System.out.println("Documento actual: " + usuDocumento[(seleccion - 1)]);
          System.out.println("\nModificar el numero de documento:");
          usuDocumento[(seleccion - 1)] = read.nextInt();
          System.out.println("\nModificación exitosa:");
          break;
        case 6:
          System.out.println("Numero telefonico actual: " + usuTelefono[(seleccion - 1)]);
          System.out.println("\nModificar el numero telefonico:");
          usuTelefono[(seleccion - 1)] = read.nextLong();
          read.nextLine();
          System.out.println("\nModificación exitosa:");
          break;
        case 7:
          System.out.println("Documento actual: " + usuDocumento[(seleccion - 1)]);
          System.out.println("\nModificar el documento:");
          usuDocumento[(seleccion - 1)] = read.nextInt();
          System.out.println("\nModificación exitosa:");
          break;
        case 8:
          System.out.println("Estado actual: " + usuEstado[(seleccion - 1)]);
          System.out.println("\nModificar el estado:");
          usuEstado[(seleccion - 1)] = read.next();
          System.out.println("\nModificación exitosa:");
          break;
        default:
          System.out.println("No ingreso un dato valido.");
          break;
      }
      System.out.println("¿Desea modificar algo mas?\n1.- Si\n2.- No");
      seleccion = read.nextInt();
    } while (seleccion == 1);

  }

  public void Eliminar() {
    System.out.println("\nIngrese el ID del usuario que desea eliminar: ");
    eliminar = read.nextInt();
    int id = (eliminar - 1);
    usuDocumento[id] = 0;
    usuCorreo[id] = null;
    usuContraseña[id] = null;
    usuApellido[id] = null;
    usuNombre[id] = null;
    usuDireccion[id] = null;
    usuTelefono[id] = 0;
    usuEstado[id] = null;
    usuId[id] = 0;
    System.out.println("Usuario eliminado satisfactoriamente.");

  }

  public void Login() {
    System.out.println("\nLogin:\nIngrese su correo electronico: ");
    loginCorreo = read.next();
    read.nextLine();
    System.out.println("Ingrese su contraseña: ");
    loginContraseña = read.nextLine();
    for (int i = 0; i < usuNombre.length; i++) {
      if (loginCorreo.equals(usuCorreo[i])
          && loginContraseña.equals(usuContraseña[i])) {
        login = true;
      }
    }

  }

}
