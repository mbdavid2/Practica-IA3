(define (domain extension2)
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
        (orientacio ?x - object)
        (no_atendidas)
        (bien_orientadas)
    )
    
    (:action asignar_habitacion
        :parameters (?res - reserva ?hab - habitacion)
        :precondition (and (not (atendida ?res)) (<= (pers_res ?res) (pers_hab ?hab)) (!= (orientacio ?res) (orientacio ?hab))
                        (forall (?auxres - reserva)
                            (or (not (asignada ?auxres ?hab))
                                (or
          	                    (and (< (dia_fin ?res) (dia_ini ?auxres)))
          	                    (and (< (dia_fin ?auxres) (dia_ini ?res)))
          	                    )
          	                )
                        )
                    )
        :effect (and (atendida ?res) (asignada ?res ?hab) (increase (bien_orientadas) 1))
    )
    
    (:action asignar_habitacion_buena
        :parameters (?res - reserva ?hab - habitacion)
        :precondition (and (not (atendida ?res)) (<= (pers_res ?res) (pers_hab ?hab)) (= (orientacio ?res) (orientacio ?hab))
                        (forall (?auxres - reserva)
                            (or (not (asignada ?auxres ?hab))
                                (or
          	                    (and (< (dia_fin ?res) (dia_ini ?auxres)))
          	                    (and (< (dia_fin ?auxres) (dia_ini ?res)))
          	                    )
          	                )
                        )
                    )
        :effect (and (atendida ?res) (asignada ?res ?hab) (increase (bien_orientadas) 2))
    )
    
    (:action no_atender_reserva
  	    :parameters (?res - reserva)
  	    :precondition (not (atendida ?res))
  	    :effect (and (atendida ?res) (increase (no_atendidas) 1) )
  )
)