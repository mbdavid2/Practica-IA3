(define (problem problemaextension2)
	
	(:domain extension2)
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
		(= (orientacio hab1) 3)
		
		(= (pers_hab hab2) 4)
		(= (orientacio hab2) 1)
		
		(= (pers_res res1) 3)
		(= (dia_ini res1) 1)
		(= (dia_fin res1) 5)
		(= (orientacio res1) 1)
		
		(= (pers_res res2) 2)
		(= (dia_ini res2) 5)
		(= (dia_fin res2) 7)
		(= (orientacio res2) 2)
		
		(= (pers_res res3) 1)
		(= (dia_ini res3) 8)
		(= (dia_fin res3) 10)
		(= (orientacio res3) 2)
		
		(= (pers_res res4) 3)
		(= (dia_ini res4) 2)
		(= (dia_fin res4) 6)
		(= (orientacio res4) 3)
		
		(= (bien_orientadas) 0)
		(= (no_atendidas) 0)
	)

	(:goal
		(forall (?res - reserva) (atendida ?res))
	)
	(:metric maximize (- (bien_orientadas) (no_atendidas)))
)
