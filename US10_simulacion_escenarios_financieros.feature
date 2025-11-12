Feature: Simulación de escenarios financieros

  Como estudiante
  quiero simular escenarios financieros con ingresos o gastos imprevistos
  para saber el impacto en mi presupuesto mensual

Scenario Outline: Registrar un gasto imprevisto en la simulación
  Given que el <usuario> quiere prever cómo afectará un <gasto inesperado> e ingresa a la opción “Simulaciones”
  When ingresa el <monto del gasto no planificado>
  Then la app recalcula el presupuesto del mes actual mostrando el nuevo <saldo disponible> mediante una gráfica

Examples: Datos de entrada
  | usuario                | gasto inesperado | monto del gasto no planificado |
  | nombre: <María Torres> | <Reparación PC>  | <S/450>                        |

Examples: Datos de salida
  | saldo disponible | gráfica de presupuesto actualizado                   |
  | <S/850>          | "Gráfica de barras mostrando la reducción del saldo" |

Scenario Outline: Probar con un ingreso adicional
  Given que el <usuario> proyecta un <ingreso extra> e ingresa a la opción “Simulaciones”
  When el usuario agrega el <monto> y selecciona un <periodo determinado>
  Then la app ajusta automáticamente el presupuesto del mes actual y actualiza las <metas de ahorro>

Examples: Datos de entrada
  | usuario                | ingreso extra     | monto   | periodo determinado |
  | nombre: <María Torres> | <Apoyo familiar>  | <S/300> | <1 mes>             |

Examples: Datos de salida
  | nuevo presupuesto | metas de ahorro actualizadas                          |
  | <S/1,150>         | "Meta de laptop aumentada en 10% del monto disponible"|

Scenario Outline: Comparar escenarios simulados
  Given que el <usuario> registró distintos <ingresos y gastos> en la simulación
  When selecciona la opción “Comparar escenarios”
  Then la app muestra <gráficos comparativos> (escenario base vs. simulaciones) para visualizar el impacto en su presupuesto

Examples: Datos de entrada
  | usuario                | ingresos y gastos registrados |
  | nombre: <María Torres> | <Simulación 1, Simulación 2>  |

Examples: Datos de salida
  | gráficos comparativos                 | interpretación del resultado                        |
  | "Gráfica de líneas base vs. simuladas"| "La simulación 2 mantiene mayor estabilidad mensual" |
