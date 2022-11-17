package Bocaditos;
import java.util.*;
import Bocaditos.Usuario;
public class Main {
  public static void main(String[] args) {
      int decision1;
      int decision2;
      Scanner read = new Scanner(System.in);

Usuario usuario = new Usuario();
Roles roles = new Roles();

System.out.println("¡BIENVENID@ A LA REPOSTERÍA BOCADITOS!\n| 1.- Login | 2.- Registrarse |");
decision1 = read.nextInt();
switch (decision1) {
  case 1:
    usuario.Login();
    if(usuario.loginCorreo.equals(usuario.usuCorreo) && usuario.loginContraseña.equals(usuario.usuContraseña)){
  System.out.println("\nBienvenid@ a la repostería Bocaditos.");
  System.out.println("\n¿Donde quiere acceder?");
  System.out.println("\n1.- Roles\n2.- Usuario");
  decision2= read.nextInt();
  switch (decision2) {
    case 1:
      System.out.println("\n1.- Ingresar Rol\n2.- Consultar Roles\n3- Eliminar rol");
      decision2= read.nextInt();
      if(decision2 ==1){
        roles.Ingresar();
      }
      else if(decision2 == 2){
        roles.Mostrar();
      }
      else if(decision2==3)
      {
        roles.Eliminar();
      }
      break;
  case 2:
  System.out.println("\n1.- Consultar Usuario\n2.- Modificar Usuario\n3.- Eliminar Usuario");
  decision2= read.nextInt();
  if (decision2 == 1)
  {
    usuario.Mostrar();
  }
  else if(decision2 == 2){
    usuario.Modificar();
  }
  else if(decision2 == 3){
    usuario.Eliminar();
  }
  break;
    default:
      break;
  }
  }
  else{
    System.out.println("Datos incorrectos.");
  }
    break;
case 2: 
usuario.Registrar();
break;
  default:
    break;
}

}
}
