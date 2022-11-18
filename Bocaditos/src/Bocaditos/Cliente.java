package Bocaditos;
import java.util.Scanner;
public class Cliente 
{
   
   private int[] cliId = new int[5];
    private long[] cliDocumento = new long[5];
    private String[] cliNombre = new String[5];
    private String[] cliApellido = new String[5];
    
    

    Scanner Sc = new Scanner(System.in);

    int cantidad;
    int posicion = 1;
    
    public static void main(String[] args) 
    {
        int eleccion;
        Scanner Sc = new Scanner(System.in);
        
        do{
        System.out.println("Bienvenido que desea realizar: \n1.- Ingresar un registro \n2.- Mostrar la tabla \n3.- Actualizar registro \n4.- Eliminar registro");
        eleccion = Sc.nextInt();
        Cliente cliente = new Cliente();
        
        
        if(eleccion == 1)
        {
            cliente.Ingresar();
            
            System.out.println("\nDesea realizar otra acción? \n1 = Si \n2 = No");
            eleccion = Sc.nextInt();
        }
        
        else if(eleccion == 2)
        {
            cliente.Mostrar();
            
            System.out.println("\nDesea realizar otra acción? \n1 = Si \n2 = No");
            eleccion = Sc.nextInt();
        }
        
        else if(eleccion == 3)
        {
            cliente.Actualizar();
            
            System.out.println("\nDesea realizar otra acción? \n1 = Si \n2 = No");
            eleccion = Sc.nextInt();
        }
        else if(eleccion == 4)
        {
            cliente.Eliminar();
            
            System.out.println("\nDesea realizar otra acción? \n1 = Si \n2 = No");
            eleccion = Sc.nextInt();

        }
        else
            {
                System.out.println("El dato ingresado no es valido");
                System.out.println("\nDesea realizar otra acción? \n1 = Si \n2 = No");
            eleccion = Sc.nextInt();
            }
        }while(eleccion == 1);
        
    

    }   
    public void Ingresar()
    {
        System.out.println("Cuantos registros desea ingresar: ");
        cantidad = Sc.nextInt();
        for (int i = 1; i < cantidad+1; i++) 
        {

            cliId[i] = posicion;
            System.out.println("Ingrese el numero de Documento del "+ posicion + " cliente");
            cliDocumento[i] = Sc.nextLong();
            System.out.println("Ingrese el Nombre del "+ posicion + " cliente");
            cliNombre[i] = Sc.next();
            System.out.println("Ingrese el Apellido del "+ posicion + " cliente");
            cliApellido[i] = Sc.next();
            System.out.println("----------------------------------------------------");
            posicion ++;
        }
        System.out.println("El registro se realizo con exito\n");

       /* //Esto es mostrar
        System.out.println("CliId    cliDocumento    cliNombre    cliApellido");
        for (int a = 1; a < cliId.length; a++) 
    {
        System.out.println("----------------------------------------------------");
        System.out.println("  "+cliId[a]+"       "+cliDocumento[a]+"      "+cliNombre[a]+"      "+cliApellido[a]);
    }

     //Esto es actualizar
     int opcion;
            
     System.out.println("\nIngrese el Id del cliente que desea actualizar");
     opcion = Sc.nextInt();
     cliId[opcion] = opcion;
     System.out.println("Ingrese el numero de documento actualizado");
     cliDocumento[opcion] = Sc.nextLong();
     System.out.println("Ingrese el nuevo nombre actualizado");
     cliNombre[opcion] = Sc.next();
     System.out.println("Ingrese el nuevo apellido actualizado");
     cliApellido[opcion] = Sc.next();
     System.out.println("\n--Actualización exitosa--\n");

     System.out.println("CliId    cliDocumento    cliNombre    cliApellido\n----------------------------------------------------");
     System.out.println("  "+cliId[opcion]+"       "+cliDocumento[opcion]+"      "+cliNombre[opcion]+"      "+cliApellido[opcion]);

      //Mostrar otra vez
      System.out.println("CliId    cliDocumento    cliNombre    cliApellido");
      for (int a = 0+1; a < cliId.length; a++) 
  {
      System.out.println("----------------------------------------------------");
      System.out.println("  "+cliId[a]+"       "+cliDocumento[a]+"      "+cliNombre[a]+"      "+cliApellido[a]);
  }

  //Eliminar
  System.out.println("\nIngrese el Id del cliente que desea eliminar");
  opcion = Sc.nextInt();
  cliId[opcion] = 0;
  cliDocumento[opcion] = 0;
  cliNombre[opcion] = null;
  cliApellido[opcion] = null;

  System.out.println("CliId    cliDocumento    cliNombre    cliApellido\n----------------------------------------------------");
  System.out.println("Registro Eliminado");
  System.out.println("  "+cliId[opcion]+"           "+cliDocumento[opcion]+"           "+cliNombre[opcion]+"          "+cliApellido[opcion]);

    
            //Mostrar otra vez
            System.out.println("CliId    cliDocumento    cliNombre    cliApellido");
            for (int a = 1; a < cliId.length; a++) 
        {
            System.out.println("----------------------------------------------------");
            System.out.println("  "+cliId[a]+"           "+cliDocumento[a]+"           "+cliNombre[a]+"          "+cliApellido[a]);
        }*/ 
    }
    public void Mostrar()
    {

        
        System.out.println("CliId    cliDocumento    cliNombre    cliApellido");
        for (int i = 0; i < cliId.length; i++) 
        {
            
            System.out.println("----------------------------------------------------");
            System.out.println("  "+cliId[i]+"       "+cliDocumento[i]+"      "+cliNombre[i]+"      "+cliApellido[i]);
            
        }
    }
    public void Actualizar()
    {
        int opcion;
        Scanner Sc = new Scanner(System.in);

        
        System.out.println("\nIngrese el Id del cliente que desea actualizar");
        opcion = Sc.nextInt();
        cliId[opcion] = opcion;
        System.out.println("Ingrese el numero de documento actualizado");
        cliDocumento[opcion] = Sc.nextInt();
        System.out.println("Ingrese el nuevo nombre actualizado");
        cliNombre[opcion] = Sc.next();
        System.out.println("Ingrese el nuevo apellido actualizado");
        cliApellido[opcion] = Sc.next();
        System.out.println("\n--Actualización exitosa--\n");

        System.out.println("CliId    cliDocumento    cliNombre    cliApellido\n----------------------------------------------------");
        System.out.println("  "+cliId[opcion]+"       "+cliDocumento[opcion]+"      "+cliNombre[opcion]+"      "+cliApellido[opcion]);

    }
    public void Eliminar()
    {
        int opcion;
        Scanner Sc = new Scanner(System.in);

        System.out.println("\nIngrese el Id del cliente que desea eliminar");
        opcion = Sc.nextInt();
        cliId[opcion] = 0;
        cliDocumento[opcion] = 0;
        cliNombre[opcion] = null;
        cliApellido[opcion] = null;

        System.out.println("CliId    cliDocumento    cliNombre    cliApellido\n----------------------------------------------------");
        System.out.println("Registro Eliminado");
        System.out.println("  "+cliId[opcion]+"           "+cliDocumento[opcion]+"           "+cliNombre[opcion]+"          "+cliApellido[opcion]);
    }
}
