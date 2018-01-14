(define (problem problemaextension4)
	
	(:domain extension4)
	(:objects 
			hab1 hab2 hab3 hab4 - habitacion
			res1 res2 res3 res4 - reserva
	)
	(:init
    	(not (utilizada hab1))
    	(not (utilizada hab2))
    	(not (utilizada hab3))
    	(not (utilizada hab4))
    	
    	(not (atendida res1))
    	(not (atendida res2))
    	(not (atendida res3))
    	(not (atendida res4))
    	
		(= (pers_hab hab1) 4)
		(= (pers_hab hab2) 4)
		(= (pers_hab hab3) 3)
		(= (pers_hab hab4) 3)
		
		(= (pers_res res1) 4)
		(= (dia_ini res1) 9)
		(= (dia_fin res1) 17)
		
		(= (pers_res res2) 3)
		(= (dia_ini res2) 19)
		(= (dia_fin res2) 22)
		
		(= (pers_res res3) 2)
		(= (dia_ini res3) 9)
		(= (dia_fin res3) 17)
		
		(= (pers_res res4) 1)
		(= (dia_ini res4) 19)
		(= (dia_fin res4) 22)

		
		(= (punt_asignadas) 0)
		(= (no_asignadas) 0)
		(= (hab_asignadas) 0)
	)

	(:goal
		(forall (?res - reserva) (atendida ?res))
	)
	(:metric minimize (+ (punt_asignadas) (+ (* (no_asignadas) 60) (* (hab_asignadas) 30))))
)
