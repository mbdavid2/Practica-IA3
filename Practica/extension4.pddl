(define (domain extension4)
    (:requirements :adl :strips :typing :fluents)
    (:types habitacion reserva - object)

    (:predicates 
        (asignada ?res - reserva ?hab - habitacion)
        (atendida ?res - reserva) 
        (utilizada ?hab - habitacion)
    )
     
    (:functions
        (pers_hab ?hab - habitacion)
        (pers_res ?res - reserva)
        (dia_ini ?res - reserva)
        (dia_fin ?res - reserva)
        (punt_asignadas)
        (hab_asignadas)
        (no_asignadas)
    )
    
    (:action asignar_habitacion_nueva
        :parameters (?res - reserva ?hab - habitacion)
        :precondition (and (not (atendida ?res)) (<= (pers_res ?res) (pers_hab ?hab)) (not (utilizada ?hab)))
        :effect (and (atendida ?res) (asignada ?res ?hab) (utilizada ?hab) (increase (punt_asignadas) (- (pers_hab ?hab) (pers_res ?res))) (increase (hab_asignadas) 1))
    )
    
    (:action asignar_habitacion
        :parameters (?res - reserva ?hab - habitacion)
        :precondition (and (not (atendida ?res)) (<= (pers_res ?res) (pers_hab ?hab)) (utilizada ?hab)
                        (forall (?auxres - reserva)
                            (or (not (asignada ?auxres ?hab))
                                (or
          	                    (and (< (dia_fin ?res) (dia_ini ?auxres)))
          	                    (and (< (dia_fin ?auxres) (dia_ini ?res)))
          	                    )
          	                )
                        )
                    )
        :effect (and (atendida ?res) (asignada ?res ?hab) (increase (punt_asignadas) (- (pers_hab ?hab) (pers_res ?res))))
    )
    
    
    
    (:action no_atender_reserva
  	    :parameters (?res - reserva)
  	    :precondition (not (atendida ?res))
  	    :effect (and (atendida ?res) (increase (no_asignadas) 1))
  )
)