(define (problem p2-lab-perillos)
    (:domain laberint-perillos)

    (:objects
        verd groc lila multicolor - color
        loc-1-2 loc-1-3 loc-2-1 loc-2-2 loc-2-3 loc-2-4 loc-3-2 - ubicacio
        clau1 clau2 clau3 clau4 - clau
        c1222 c1322 c2122 c2221 c2223 c2232 c2324 - passadis
    )

    (:init
        ; Estado inicial de Grimmy
        (grimmy-a loc-2-2)

        ; Conexiones entre salas y pasadizos
        (connecta c1222 loc-1-2 loc-2-2)
        (connecta c1322 loc-1-3 loc-2-2)
        (connecta c2122 loc-2-1 loc-2-2)
        (connecta c2221 loc-2-2 loc-2-1)
        (connecta c2223 loc-2-2 loc-2-3)
        (connecta c2232 loc-2-2 loc-3-2)
        (connecta c2324 loc-2-3 loc-2-4)

        ; Pasadizos peligrosos
        (perillos c2221)
        (perillos c2223)

        ; Pasadizos abiertos (inicialmente todos bloqueados, ninguno abierto)
        ; No se añaden predicados obert aquí porque todos están bloqueados

        ; Ubicaciones llaves
        (clau-a clau1 loc-1-2) ; Llave verde en hab 1-2
        (clau-a clau2 loc-1-3) ; Llave tesoro en hab 1-3
        (clau-a clau3 loc-2-2) ; Llave lila en hab 2-2
        (clau-a clau4 loc-3-2) ; Llave amarilla en hab 3-2

        ; Pasadizos bloqueados
        (bloquejat c1222 lila) ; Candado lila entre 1-2 y 2-2
        (bloquejat c1322 groc) ; Candado amarillo entre 1-3 y 2-2
        (bloquejat c2122 groc) ; Candado amarillo entre 2-1 y 2-2
        (bloquejat c2223 groc) ; Candado amarillo entre 2-2 y 2-3
        (bloquejat c2232 verd) ; Candado verde entre 2-2 y 3-2
        (bloquejat c2324 multicolor) ; Candado tesoro entre 2-3 y 2-4

        ; Colores llaves
        (color-clau clau1 verd) ; Llave verde
        (color-clau clau2 multicolor) ; Llave tesoro
        (color-clau clau3 lila) ; Llave lila
        (color-clau clau4 groc) ; Llave amarilla

        ; Propiedades de las llaves según especificaciones
        (un-us clau1) ; Llave verde tiene 1 uso
        (usos-disponibles clau1) ; Tiene usos disponibles

        (un-us clau2) ; Llave multicolor tiene 1 uso (para el tesoro)
        (usos-disponibles clau2) ; Tiene usos disponibles

        (un-us clau3) ; Llave lila tiene 1 uso
        (usos-disponibles clau3) ; Tiene usos disponibles

        (dos-usos clau4) ; Llave amarilla tiene 2 usos
        (usos-disponibles clau4) ; Tiene usos disponibles

        ; Ubicación tesoro
        (tresor-a loc-2-4) ; Tesoro en hab 2-4
    )

    (:goal
        (and
            (te-tresor) ; Grimmy tiene el tesoro
        )
    )
)