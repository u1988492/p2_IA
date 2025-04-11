(define (domain laberint)

    (:requirements :typing :negative-preconditions :conditional-effects
    )

    (:types
        ubicacio color clau passadis - object
    )

    (:predicates
        ; Predicado por defecto
        (grimmy-a ?loc - ubicacio)

        ; Conexiones entre ubicaciones y pasadizos
        (connecta ?pas - passadis ?loc1 ?loc2 - ubicacio)

        ; Estado del pasadizo
        (bloquejat ?pas - passadis ?col - color) ; Pasadizo bloqueado con un color

        ; Estado de las llaves
        (clau-a ?c - clau ?loc - ubicacio) ; La llave está en una ubicación
        (te-clau ?c - clau) ; Grimmy tiene la llave
        (color-clau ?c - clau ?col - color) ; Color de la llave

        ; Tesoro
        (tresor-a ?loc - ubicacio) ; Ubicación del Tesoro
        (te-tresor) ; Grimmy tiene el tesoro
    )

    ; Grimmy va de ?des_de a ?fins_a por el pasadizo ?pas si este une los dos sitios y no está bloqueado ni derrumbado
    ; si era un pasadizo peligroso, este colapsará una vez usado
    (:action moure
        :parameters (?des_de ?fins_a - ubicacio ?pas - passadis)

        :precondition (and
            (grimmy-a ?des_de) ; Grimmy está en la ubicación de origen
            (or
                (connecta ?pas ?des_de ?fins_a) ; El pasadizo conecta las dos ubicaciones
                (connecta ?pas ?fins_a ?des_de)
            )
            (not (exists
                    (?col - color)
                    (bloquejat ?pas ?col))) ; El pasadizo no está bloqueado
        )

        :effect (and
            ; Grimmy pasa de estar en la ubicación de origen a estar en la de destino
            (not (grimmy-a ?des_de))
            (grimmy-a ?fins_a)

            ; Si hay tesoro en la ubicación de destino, Grimmy lo recibe
            (when
                (tresor-a ?fins_a)
                (te-tresor)
            )
        )
    )

    ; Grimmy recoge la llave si no lleva ninguna encima y está en la ubicación de la llave que se quiere recoger
    (:action recollir
        :parameters (?loc - ubicacio ?c - clau)

        :precondition(and
            (grimmy-a ?loc) ; Grimmy está en la ubicación
            (clau-a ?c ?loc) ; La llave está en la ubicación 
            (not (exists
                    (?c2 - clau)
                    (te-clau ?c2))) ; Grimmy no lleva ninguna llave encima
        )

        ; La llave ya no está en la ubicación y Grimmy pasa a tenerla
        :effect (and
            (not (clau-a ?c ?loc))
            (te-clau ?c)
        )
    )

    ; Grimmy deja la llave que lleva encima en la ubicación donde él se encuentra
    (:action deixar
        :parameters (?loc - ubicacio ?c - clau)

        :precondition (and
            (grimmy-a ?loc) ; Grimmy está en la ubicación
            (te-clau ?c) ; Grimmy tiene la llave que se quiere dejar
        )

        ; Grimmy ya no tiene la llave y esta pasa a estar en la ubicación
        :effect (and
            (not (te-clau ?c))
            (clau-a ?c ?loc)
        )
    )

    ; Grimmy puede desbloquear un pasadizo ?pas conectado con la sala ?loc
    ; mediante un pasadizo bloqueado con el color ?col, y él lleva la llave
    ; del mismo color que el candado 
    (:action desbloquejar
        :parameters (?loc - ubicacio ?pas - passadis ?col - color ?c - clau)

        :precondition (and
            (grimmy-a ?loc) ; Grimmy está en la ubicación
            (te-clau ?c) ; Grimmy tiene llave
            (color-clau ?c ?col) ; La llave es del color correcto
            (bloquejat ?pas ?col) ; El pasadizo está bloqueado con un candado de ese color
            (or
                (exists
                    (?loc2 - ubicacio)
                    (connecta ?pas ?loc ?loc2)) ; El pasadizo conecta con la ubicación o la ubicación con el pasadizo
                (exists
                    (?loc2 - ubicacio)
                    (connecta ?pas ?loc2 ?loc))
            )
        )

        ; El pasadizo deja de estar bloqueado
        :effect (and
            (not (bloquejat ?pas ?col))
        )
    )
)