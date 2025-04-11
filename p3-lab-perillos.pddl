(define (problem p3-lab-perillos)
    (:domain laberint-perillos)

    (:objects
        vermell verd lila multicolor - color
        loc-1-2 loc-2-1 loc-2-2 loc-2-3 loc-3-1 loc-3-2 loc-3-3 loc-3-4 loc-4-1 loc-4-2 loc-4-3 loc-4-4 loc-5-2 loc-5-3 loc-5-4 - ubicacio
        clau1 clau2 clau3 clau4 clau5 clau6 - clau
        c1222 c2122 c2123 c2221 c2223 c2321 c2333 c3132 c3231 c3232 c3233 c3241 c3242 c3243 c3334 c3444 c4142 c4231 c4243 c4244 c4254 c4342 c4443 c5253 c5354 c5444 - passadis
    )

    (:init
        ; Estado inicial de Grimmy
        (grimmy-a loc-1-2)

        ; Conexiones entre salas y pasadizos
        (connecta c1222 loc-1-2 loc-2-2)
        (connecta c2122 loc-2-1 loc-2-2)
        (connecta c2123 loc-2-1 loc-2-3)
        (connecta c2221 loc-2-2 loc-2-1)
        (connecta c2223 loc-2-2 loc-2-3)
        (connecta c2321 loc-2-3 loc-2-1)
        (connecta c2333 loc-2-3 loc-3-3)
        (connecta c3132 loc-3-1 loc-3-2)
        (connecta c3231 loc-3-2 loc-3-1)
        (connecta c3232 loc-3-2 loc-3-2)
        (connecta c3233 loc-3-2 loc-3-3)
        (connecta c3241 loc-3-2 loc-4-1)
        (connecta c3242 loc-3-2 loc-4-2)
        (connecta c3243 loc-3-2 loc-4-3)
        (connecta c3334 loc-3-3 loc-3-4)
        (connecta c3444 loc-3-4 loc-4-4)
        (connecta c4142 loc-4-1 loc-4-2)
        (connecta c4231 loc-4-2 loc-3-1)
        (connecta c4243 loc-4-2 loc-4-3)
        (connecta c4254 loc-4-2 loc-5-2)
        (connecta c4342 loc-4-3 loc-4-2)
        (connecta c4443 loc-4-4 loc-4-3)
        (connecta c5253 loc-5-2 loc-5-3)
        (connecta c5354 loc-5-3 loc-5-4)
        (connecta c5444 loc-5-4 loc-4-4)

        ; Pasadizos peligrosos
        (perillos c3132)
        (perillos c3231)
        (perillos c3232)
        (perillos c3233)
        (perillos c3241)
        (perillos c3242)
        (perillos c3243)

        ; Pasadizos abiertos 
        (obert c1222)
        (obert c2122)
        (obert c2123)
        (obert c2221)
        (obert c2223)
        (obert c2321)
        (obert c2333)
        (obert c4142)
        (obert c4231)
        (obert c4243)
        (obert c4342)
        (obert c4443)

        ; Ubicaciones llaves
        (clau-a clau1 loc-1-2) ; Llave roja en hab 1-2
        (clau-a clau2 loc-3-2) ; Llave verde en hab 3-2
        (clau-a clau3 loc-3-2) ; Llave verde en hab 3-2
        (clau-a clau4 loc-3-2) ; Llave lila en hab 3-2
        (clau-a clau5 loc-3-2) ; Llave lila en hab 3-2
        (clau-a clau6 loc-4-4) ; Llave tesoro en hab 4-4

        ; Pasillos bloqueados, todas las conexiones a 3-2 tienen candado rojo
        (bloquejat c3132 vermell)
        (bloquejat c3231 vermell)
        (bloquejat c3232 vermell)
        (bloquejat c3233 vermell)
        (bloquejat c3241 vermell)
        (bloquejat c3242 vermell)
        (bloquejat c3243 vermell)
        ; Otros
        (bloquejat c3444 multicolor) ; Candado tesoro entre 3-4 y 4-4
        (bloquejat c4254 lila) ; Candado lila entre 4-2 y 5-2
        (bloquejat c5253 verd) ; Candado verde entre 5-2 y 5-3
        (bloquejat c5354 lila) ; Candado lila entre 5-3 y 5-4
        (bloquejat c5444 verd) ; Candado verde entre 5-4 y 4-4

        ; Colores llaves
        (color-clau clau1 vermell) ; Llave roja
        (color-clau clau2 verd) ; Llave verde
        (color-clau clau3 verd) ; Llave verde
        (color-clau clau4 lila) ; Llave lila
        (color-clau clau5 lila) ; Llave lila
        (color-clau clau6 multicolor) ; Llave tesoro

        ; Propiedades de las llaves
        (us-infinit clau1) ; Llave roja es de usos infinitos
        (usos-disponibles clau1)

        (un-us clau2) ; Llave verde tiene 1 uso
        (usos-disponibles clau2)

        (un-us clau3) ; Llave verde tiene 1 uso
        (usos-disponibles clau3)

        (un-us clau4) ; Llave lila tiene 1 uso
        (usos-disponibles clau4)

        (un-us clau5) ; Llave lila tiene 1 uso
        (usos-disponibles clau5)

        (un-us clau6) ; Llave tesoro tiene 1 uso 
        (usos-disponibles clau6)

        ; Ubicación tesoro
        (tresor-a loc-3-4) ; Tesoro está en hab 3-4
    )

    (:goal
        (and
            (te-tresor) ; Grimmy tiene el tesoro
        )
    )
)