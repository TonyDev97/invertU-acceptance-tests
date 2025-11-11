Feature: Resumen de movimientos
    Como estudiante universitario, quiero ver el balance de mis movimientos financieros 
    (ingresos, gastos), para obtener una visión clara y rápida de mi situación
    financiera.

Scenario Outline: Visualización de últimos movimientos 
    Given el usuario abre la aplicación y se muestra la pantalla "<pantalla_inicio>"
    When el usuario visualiza el bloque "Movimientos" en "<pantalla_inicio>"
    Then el sistema prepara los últimos "<cantidad>" movimientos ordenados por fecha descendente
    And muestra un resumen visible con categoría, monto y fecha

    Examples: Datos de entrada
        | pantalla_inicio | cantidad |
        | Inicio          | 10       |

    Examples: Datos de salida
        | categorias_mostradas | colores_tipo                 | orden             | 
        | Educación, Ingresos  | rojo(gasto), verde(ingreso)  | fecha_descendente |

Scenario Outline: Visualizar el balance completo
    Given el usuario se encuentra en la opción "<pantalla>"
    When el sistema carga la lista de movimientos registrados
    Then se muestran los movimientos con su cuenta de origen, monto, fecha y tipo
    And los montos negativos aparecen en color rojo y los positivos en color verde

    Examples: Datos de entrada
        | pantalla    |
        | Movimientos |

    Examples: Datos de salida
        | elementos_visibles         | colores_aplicados             |
        | cuenta, monto, fecha, tipo | rojo (gasto), verde (ingreso) |

Scenario Outline: Filtrar por tipo de movimiento
    Given el usuario se encuentra en la opción "<pantalla>"
    And tiene una lista de movimientos cargada
    When selecciona el filtro "<tipo>"
    Then el sistema muestra únicamente los movimientos del tipo seleccionado
    And mantiene los colores diferenciados según el tipo de operación

    Examples: Datos de entrada
        | pantalla    | tipo     |
        | Movimientos | Ingresos |
        | Movimientos | Gastos   |

    Examples: Datos de salida
        | color_aplicado | descripcion |
        | verde          | Ingresos    |
        | rojo           | Gastos      |
