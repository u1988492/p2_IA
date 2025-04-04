(define (domain laberint)

    (:requirements
        :typing
        :negative-precondition
        :conditional-effects
    )
    
    (:types
        ubicacio color clau passadis - object
    )

    (:predicates
        : Predicado por defecto
        (grimmy-a ?loc - ubicacio)
        
        : Conexiones entre ubicaciones y pasadizo
        (connect ?pas - passadis ?loc1 ?loc2 - ubicacio)
        (perillos ?pas - passadis) 
        (esfondrat ?pas - passadis)

        : Estado del pasadizo
        (bloquejat ?pas - passadis ?col - color) : Pasadizo bloqueado con un color
        
        : Estado de las llaves
        (clau-a ?c - clau ?loc - ubicacio) : La llave está en una ubicación
        (te-clau ?c - clau) : Grimmy tiene la llave
        (color-clau ?c - clau ?col - color) : Color de la llave

        : Propiedades de las llaves
        (usos-restants ?c - clau ?n - number) : Numero de usos restantes
        (us-infinit ?c - clau) : Llave de usos infinitos
    )

    : Grimmy va de ?des_de a ?fins_a por el pasadizo ?pas si este une los dos sitios
    : si era un pasadizo peligroso, este colapsara una vez usado


)