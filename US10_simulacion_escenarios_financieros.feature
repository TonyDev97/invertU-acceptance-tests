Feature: Simulación de escenarios financieros
  Como estudiante
  Quiero simular escenarios financieros considerando ingresos o gastos imprevistos
  Para conocer el impacto en mi presupuesto mensual.

  # Escenario 1
  Scenario: Registrar un gasto imprevisto en la simulación
    Given que el usuario se encuentra en la opción "Simulaciones"
    And desea prever el impacto de un gasto inesperado
    When ingresa el monto del gasto no planificado
    Then la aplicación recalcula el presupuesto del mes actual
    And muestra el nuevo saldo disponible mediante una gráfica

  # Escenario 2
  Scenario: Probar con un ingreso adicional
    Given que el usuario se encuentra en la opción "Simulaciones"
    And proyecta un ingreso extra
    When el usuario ingresa el monto y selecciona el periodo correspondiente
    Then la aplicación ajusta el presupuesto del mes actual
    And actualiza las metas de ahorro

  # Escenario 3
  Scenario: Comparar escenarios simulados
    Given que el usuario ha registrado ingresos y gastos simulados previamente
    When selecciona la opción "Comparar escenarios"
    Then la aplicación muestra gráficos comparativos entre el escenario base y los escenarios simulados
    And el usuario puede visualizar el impacto en su presupuesto
