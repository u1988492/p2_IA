# Intel·ligència artificial (2024/2025)

# Práctica 2

Este repositorio contiene la implementación de planificadores PDDL para resolver problemas de laberintos, donde Grimmy debe navegar a través de diferentes ubicaciones, recoger llaves, desbloquear pasadizos y obtener un tesoro.

## Estructura del repositorio

- **LAB-SIMPLE**: Contiene el dominio `laberint.pddl` y los problemas `p1-lab.pddl`, `p2-lab.pddl`, y `p3-lab.pddl` que representan laberintos simples.
- **LAB-PERILLOS**: Contiene el dominio `laberint-perillos.pddl` y los problemas `p1-lab-perillos.pddl`, `p2-lab-perillos.pddl`, y `p3-lab-perillos.pddl` que representan laberintos con pasadizos peligrosos y llaves con usos limitados.
- **RESULTATS**: Archivos con los resultados de ejecución de los planificadores.
- **INFORME**: Documento con el análisis detallado de los dominios, problemas, soluciones y heurísticas.

## Descripción de la solución

Se han implementado dos dominios:

### Dominio `laberint`

Representa un laberinto simple donde Grimmy puede moverse entre ubicaciones, recoger llaves, desbloquear pasadizos y obtener el tesoro.

### Dominio `laberint-perillos`

Extiende el dominio simple añadiendo funcionalidades para laberintos más complejos:

- Pasadizos peligrosos que pueden derrumbarse después de usarlos
- Llaves con usos limitados (de un uso, dos usos o usos infinitos)

## Tipos definidos

- **Ubicacio**: Habitaciones en el laberinto
- **Color**: Colores de las llaves y candados
- **Clau**: Llaves para desbloquear pasadizos
- **Passadis**: Conexiones entre habitaciones

## Acciones implementadas

- **Moure**: Permite a Grimmy moverse entre ubicaciones
- **Recollir**: Permite a Grimmy recoger una llave
- **Deixar**: Permite a Grimmy dejar una llave
- **Desbloquejar**: Permite a Grimmy desbloquear un pasadizo

## Resultados y análisis de heurísticas

Se han analizado los resultados de ejecución para los diferentes problemas, comparando:

- Longitud de los planes generados
- Número de estados evaluados
- Nodos expandidos
- Tiempo de planificación
- Valores heurísticos

Los resultados muestran cómo las restricciones adicionales en los laberintos peligrosos afectan a la planificación, generalmente requiriendo planes más largos pero a veces permitiendo una poda más eficiente del espacio de búsqueda.

Se ha realizado un análisis de los heurísticos h^+, h^max y hadd, comparando sus estimaciones con los planes reales generados.

## Autor

Claudia Rebeca Hodoroga (u1988492)
