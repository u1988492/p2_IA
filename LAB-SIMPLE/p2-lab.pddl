(define (problem p2-lab)
  (:domain laberint)

  ; Convencio de nomenclatura:
  ; - loc-{i}-{j} fa referencia a la ubicacio a la fila i i columna j (comencant des de la cantonada superior esquerra 
  ;   (que seria loc-1-1 si hi fos))
  ; - c{i}{j}{h}{k} fa referencia al passadis que connecta loc-{i}-{j} i loc-{h}-{k}

  (:objects
    verd groc lila multicolor - color
    loc-1-2 loc-1-3 loc-2-2 loc-2-3 loc-2-4 loc-3-2 - ubicacio
    clau1 clau2 clau3 clau4 - clau
    c1222 c1322 c2221 c2223 c2232 c2324 - passadis
  )

  (:init
    ; Estado inicial de Grimmy
    (grimmy-a loc-2-2)

    ; Conexiones entre salas y pasadizos
    (connecta c1222 loc-1-2 loc-2-2)
    (connecta c1322 loc-1-3 loc-2-2)
    (connecta c2221 loc-2-2 loc-2-1)
    (connecta c2223 loc-2-2 loc-2-3)
    (connecta c2232 loc-2-2 loc-3-2)
    (connecta c2324 loc-2-3 loc-2-4)

    ; Ubicaciones llaves
    (clau-a clau1 loc-1-2) ; Llave verde en hab 1-2
    (clau-a clau2 loc-1-3) ; Llave tesoro en hab 1-3
    (clau-a clau3 loc-2-2) ; Llave lila en hab 2-2
    (clau-a clau4 loc-3-2) ; Llave amarilla en hab 3-2

    ; Pasadizos bloqueados
    (bloquejat c1222 lila) ; Candado lila entre 1-2 y 2-2
    (bloquejat c1322 groc) ; Candado amarillo entre 1-3 y 2-2
    (bloquejat c2221 groc) ; Candado amarillo entre 2-2 y 2-1
    (bloquejat c2223 groc) ; Candado amarillo entre 2-2 y 2-3
    (bloquejat c2232 verd) ; Candado verde entre 2-2 y 3-2
    (bloquejat c2324 multicolor) ; Candado tesoro entre 2-3 y 2-4

    ; Colores llaves
    (color-clau clau1 verd) ; Llave verde
    (color-clau clau2 multicolor) ; Llave tesoro
    (color-clau clau3 lila) ; Llave lila
    (color-clau clau4 groc) ; Llave amarilla

    ; Ubicación tesoro
    (tresor-a loc-2-4) ; Tesoro en hab 2-4
  )

  (:goal
    (and
      (te-tresor) ; Grimmy tiene el tesoro
    )
  )
)