package Bocaditos;

import java.util.*;

public class Repostero {
  int cantidad;
  Scanner read = new Scanner(System.in);
  int[] repId = { 1, 2 };
  String[] repNombre = { "Luis", "Maria" };
  String[] repApellido = { "Perez", "Fernandez" };
  Usuario usuario = new Usuario();
  int seleccion;
  int id;
  int modificar;

  public void Registrar() {
    System.out.println("¿cuantos reposteros desea registrar?");
    cantidad = read.nextInt();
    if (cantidad <= 2 && cantidad > 0)
      for (int i = 0; i < cantidad; i++) {
        System.out.println("Ingrese el nombre del repostero " + (i + 1));
        repNombre[i] = read.next();
        System.out.println("Ingrese el apellido del repostero " + (i + 1));
        repApellido[i] = read.next();
      }
    else {
      System.out.println("Cantidad no permitida");
    }
  }

  public void Mostrar() {
    System.out.println("Reposteros: ");
    for (int i = 0; i < repNombre.length; i++) {
      System.out.println(("ID: " + repId[i]) + " | Nombre: " + repNombre[i] + " | Apellido: " + repApellido[i]
          + " | ID Usuario: " + (repId[i] + 1));
    }

  }

  public void Modificar() {
    System.out.println("Ingrese el ID del usuario que desea modificar: ");
    seleccion = read.nextInt();
    id = (seleccion - 1);
    System.out.println("\nModificar:\nSeleccione la opcion que desea modificar:\n1.- Nombre\n2.- Apellido");
    modificar = read.nextInt();
    do {
      switch (modificar) {
        case 1:
          System.out.println("Nombre actual: " + repNombre[id]);
          System.out.println("\nModificar el nombre:");
          repNombre[id] = read.next();
          break;
        case 2:
          System.out.println("Apellido actual: " + repApellido[id]);
          System.out.println("\nModificar el Apellido:");
          repApellido[id] = read.next();
          break;
        default:
          System.out.println("ID No valido.");
          break;
      }
      System.out.println("¿Quieres modificar algo mas?\n1.- Si\n2.- No");
      seleccion = read.nextInt();
    } while (seleccion == 1);
  }

  public void Eliminar() {
    System.out.println("\nIngrese el ID del usuario que desea eliminar: ");
    seleccion = read.nextInt();
    id = (seleccion - 1);
    repApellido[id] = null;
    repNombre[id] = null;
    repId[id] = 0;
    System.out.println("Se ha eliminado correctamente el repostero.");
  }
}
