(define (problem problemaextension1)
	
	(:domain extension1)
	(:objects 
			hab1 hab2 - habitacion
			res1 res2 res3 res4 - reserva
	)
	(:init
    	(not (atendida res1))
    	(not (atendida res2))
    	(not (atendida res3))
    	(not (atendida res4))
    	
    	
		(= (pers_hab hab1) 4)
		(= (pers_hab hab2) 4)
		
		(= (pers_res res1) 3)
		(= (dia_ini res1) 1)
		(= (dia_fin res1) 5)
		(= (pers_res res2) 2)
		(= (dia_ini res2) 5)
		(= (dia_fin res2) 7)
		(= (pers_res res3) 1)
		(= (dia_ini res3) 8)
		(= (dia_fin res3) 10)
		(= (pers_res res4) 3)
		(= (dia_ini res4) 2)
		(= (dia_fin res4) 6)
		
		(= (puntuacion) 0)
	)

	(:goal
		(forall (?res - reserva) (atendida ?res))
	)
	(:metric maximize (puntuacion))
)
