Feature: Calendario de Pagos Interactivo
    Como estudiante
    quiero recordar pagos e ingresos a través de un calendario interactivo
    para no olvidar fechas importantes y evitar recargos.

Scenario Outline: Ingresar fechas de pago y recordatorios manualmente
Given que el <usuario> necesita organizar sus pagos
And que el usuario ingresa a la vista <Calendario>
When selecciona la opción "Añadir fecha de pago" e ingresa el <Concepto>, <Monto> y <Fecha de vencimiento>
And selecciona programar el <Tipo de recordatorio>
Then el pago se registra en el día correspondiente del calendario con el <Icono de pago>
And el sistema confirma el <Registro exitoso> y muestra el detalle en la leyenda de iconos

Examples: Datos de registro
  | usuario                | Concepto                 | Monto   | Fecha de vencimiento | Tipo de recordatorio | Icono de pago            | Registro exitoso                               |
  | nombre: <María Torres> | Cuota de tesis           | S/350   | 10/12/2025           | Notificación push    | Lupa (icono de pagos)    | Pago "Cuota de tesis" registrado para el 10/12 |
  | nombre: <Carlos Pérez> | Arriendo de habitación   | S/600   | 01/12/2025           | Correo electrónico   | Lupa (icono de pagos)    | Pago "Arriendo" registrado, recordatorio activo  |

Scenario Outline: Programar fechas de pago con importación automática (Escaneo)
Given que el <usuario> tiene sus pagos registrados en una <Aplicación externa>
And que se encuentra en la vista <Calendario>
When el usuario selecciona el botón "Escanear calendarios externos"
And autoriza la conexión y la importación de <Número de pagos>
Then el programa pasa las fechas de la <Aplicación externa> a la aplicación de "InvertU"
And el calendario se actualiza automáticamente mostrando los <Pagos importados> con el icono de pago

Examples: Resultados de la importación
  | usuario                | Aplicación externa | Número de pagos | Pagos importados                              |
  | nombre: <María Torres> | Google Calendar    | 4               | 4 pagos importados correctamente              |
  | nombre: <Carlos Pérez> | Outlook Calendar   | 2               | 2 pagos marcados como "Pendiente de revisión" |


Scenario Outline: Notificaciones 4 días antes de la fecha de vencimiento
Given que el <usuario> registró un pago con <Concepto de pago> que aparece en el calendario
And la fecha de pago es el <Fecha de vencimiento>
When el sistema reconoce que la fecha actual es 4 días antes de la <Fecha de vencimiento>
Then el programa manda recordatorios al usuario mediante <Canal de notificación>
And el usuario recibe el <Mensaje de recordatorio>

Examples: Pruebas de alerta
  | usuario                | Concepto de pago      | Fecha de vencimiento | Canal de notificación | Mensaje de recordatorio                                           |
  | nombre: <María Torres> | Pago de servicio      | 28/11/2025           | Notificación push     | "¡Aviso! Tu pago de servicio (S/80) vence en 4 días."              |
  | nombre: <Carlos Pérez> | Crédito educativo     | 05/12/2025           | Correo electrónico    | "Recordatorio: El crédito educativo de S/400 vence pronto (4 días)." |