(define (problem p1-lab)
  (:domain laberint)

    ; Convencio de nomenclatura:
    ; - loc-{i}-{j} fa referencia a la ubicacio a la fila i i columna j (comencant des de la cantonada superior esquerra 
    ;   (que seria loc-1-1 si hi fos))
    ; - c{i}{j}{h}{k} fa referencia al passadis que connecta loc-{i}-{j} i loc-{h}-{k}

  (:objects
    vermell groc lila multicolor - color
    loc-1-3 loc-2-1 loc-2-2 loc-2-3 loc-2-4 loc-3-2 loc-3-3 loc-4-2 loc-4-3 loc-4-4 - ubicacio
    clau1 clau2 clau3 clau4 - clau
    c1323 c2122 c2223 c2324 c2232 c2333 c3233 c3242 c3343 c4243 c4344 - passadis
  )

  (:init
    ; Estado inicial de Grimmy
    (grimmy-a loc-2-1)
    
    ; Conexiones entre ubicaciones y pasadizos
    (connecta c1323 loc-1-3 loc-2-3)
    (connecta c2122 loc-2-1 loc-2-2)
    (connecta c2223 loc-2-2 loc-2-3)
    (connecta c2324 loc-2-3 loc-2-4)
    (connecta c2232 loc-2-2 loc-3-2)
    (connecta c2333 loc-2-3 loc-3-3)
    (connecta c3233 loc-3-2 loc-3-3)
    (connecta c3242 loc-3-2 loc-4-2)
    (connecta c3343 loc-3-3 loc-4-3)
    (connecta c4243 loc-4-2 loc-4-3)
    (connecta c4344 loc-4-3 loc-4-4)
    
    ; Ubicaciones de las llaves
    (clau-a clau1 loc-2-2) ; Llave roja en hab 2-2
    (clau-a clau2 loc-4-2) ; Llave amarilla en hab 4-2
    (clau-a clau3 loc-2-4) ; Llave tesoro en hab 2-4
    (clau-a clau4 loc-4-4) ; Llave lila en hab 4-4
    
    ; Pasadizos bloqueados
    (bloquejat c1323 multicolor) ; Candado tesoro entre 1-3 y 2-3
    (bloquejat c2324 lila) ; Candado lila entre 2-3 y 2-4
    (bloquejat c3242 vermell) ; Candado rojo entre 3-2 y 4-2
    (bloquejat c4243 vermell) ; Candado rojo entre 4-2 y 4-3
    (bloquejat c4344 groc) ; Candado amarillo entre 4-3 y 4-4
    
    ; Colores de las llaves
    (color-clau clau1 vermell) 
    (color-clau clau2 groc)
    (color-clau clau3 multicolor)
    (color-clau clau4 lila)
    
    ; Ubicación tesoro
    (tresor-a loc-1-3) ; Tesoro en hab 1-3
  )

  (:goal
    (and
      (te-tresor) ; Grimmy tiene el tesoro
    )
  )
)