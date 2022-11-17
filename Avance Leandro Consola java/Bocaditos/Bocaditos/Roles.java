package Bocaditos;
import java.util.*;
public class Roles {
 int[] rolId = {1,2,3,4};
    String[] rolDescripcion = {"Administrador","Cliente","Repostero","Domiciliario"};
    int cantidad, eliminar, rolEliminar, seleccion;
    Scanner read = new Scanner(System.in);
    
    public static void main(String[] args) {
      
        Roles roles = new Roles();
        
        roles.Ingresar();
        roles.Mostrar();
        roles.Eliminar();
        roles.Mostrar();

    }
    public  void Ingresar(){

        System.out.println("¿Cuantos roles desea ingresar?");
        cantidad = read.nextInt();
        if(cantidad <= rolId.length)
        {
            for(int i=0; i<cantidad; i++){
                System.out.println("Ingrese la descripción del rol " + (i+1));
                rolDescripcion[i] = read.next();
                rolId[i] = (i+1);
            }
        }
        else{
            System.out.println("Cantidad de roles a ingresar invalida");
        }

    }
    public void Mostrar(){
        System.out.println("\nLos roles actuales son:");
        for(int i=0; i < rolId.length; i++)
        System.out.println("ID: " + rolId[i] + " - Descripción: " + rolDescripcion[i]);
    }
    public void Eliminar(){
        System.out.println("\n¿Desea eliminar algun rol?\n1.-Si\n2.-No");
        eliminar = read.nextInt();
        
        switch(eliminar){
            case 1:
            do{
            System.out.println("\nEscriba el ID del rol a eliminar: ");
            rolEliminar = read.nextInt();
            int ID = (rolEliminar - 1);
            rolId[ID] = 0;
            rolDescripcion[ID] = null;  
            System.out.println("\nEl rol " + rolEliminar + " Ha sido borrado de manera exitosa");
        

        System.out.println("\n¿Desea eliminar otro rol?\n1.-Si\n2.-No");
        eliminar = read.nextInt();
        }while(eliminar == 1);
            case 2:
            {
                System.out.println("\nNo se eliminará ningun rol.");
            }
    }

        

    }

}
