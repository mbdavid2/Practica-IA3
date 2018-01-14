(define (problem problemaextension3)
	
	(:domain extension3)
	(:objects 
			hab1 hab2 - habitacion
			res1 res2 res3 - reserva
	)
	(:init
    	(not (atendida res1))
    	(not (atendida res2))
    	
    	
		(= (pers_hab hab1) 4)
		(= (pers_hab hab2) 4)
		
		(= (pers_res res1) 4)
		(= (dia_ini res1) 1)
		(= (dia_fin res1) 4)
		
		(= (pers_res res2) 4)
		(= (dia_ini res2) 1)
		(= (dia_fin res2) 5)
		
		(= (pers_res res3) 2)
		(= (dia_ini res3) 1)
		(= (dia_fin res3) 4)

		
		(= (punt_asignadas) 0)
		(= (no_asignadas) 0)
	)

	(:goal
		(forall (?res - reserva) (atendida ?res))
	)
	(:metric minimize (+ (punt_asignadas) (no_asignadas)))
)
