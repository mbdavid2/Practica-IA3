(define (domain extension1)
    (:requirements :adl :strips :typing :fluents)
    (:types habitacion reserva - object)

    (:predicates 
        (asignada ?res - reserva ?hab - habitacion)
        (atendida ?res - reserva) 
    )
     
    (:functions
        (pers_hab ?hab - habitacion)
        (pers_res ?res - reserva)
        (dia_ini ?res - reserva)
        (dia_fin ?res - reserva)
        (puntuacion)
    )
    
    (:action asignar_habitacion
        :parameters (?res - reserva ?hab - habitacion)
        :precondition (and (not (atendida ?res)) (<= (pers_res ?res) (pers_hab ?hab))
                        (forall (?auxres - reserva)
                            (or (not (asignada ?auxres ?hab))
                                (or
          	                    (and (< (dia_fin ?res) (dia_ini ?auxres)))
          	                    (and (< (dia_fin ?auxres) (dia_ini ?res)))
          	                    )
          	                )
                        )
                    )
        :effect (and (atendida ?res) (asignada ?res ?hab) (increase (puntuacion) 2))
    )
    
    (:action no_atender_reserva
  	    :parameters (?res - reserva)
  	    :precondition (not (atendida ?res))
  	    :effect (and (atendida ?res) (increase (puntuacion) 1) )
  )
)