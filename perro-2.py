"""4     Crear un lista en Python denominado “Perro2” que contenga los siguientes valores:

      14,  Fido,  12/12/2012 , Macho, 23546987

Recorrer la lista “Perro” con un bucle y mostrar sus elementos por pantalla , comenzando desde el último hasta el primero."""

perro=[13,  "Puppy",  "13/12/2012" , "Macho", 28957346]

for i in range(len(perro)-1,-1,-1)  :
    print(i,perro[i])

perro2= [14,"Fido","12/12/2012","Macho", 23546987]