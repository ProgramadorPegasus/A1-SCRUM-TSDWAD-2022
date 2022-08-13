Historial2= (23500, 5960, 2300, 10200, 8900)
montoGastadoFrida=0
cantidadGastosAltos=0
for item in Historial2:
    montoGastadoFrida += item
    if item > 5000:
        cantidadGastosAltos +=1

        print(montoGastadoFrida)
        print(cantidadGastosAltos)
