(define (problem banquete-2mesas-7sillas-6sillas-12comensales)
(:domain banquete)
(:objects Antonio Ainhoa Lola Lolo Esperanza Enrique Susana Manu
Manolito Susanita Jesus Quico - comensal
s1_1 s1_2 s1_3 s1_4 s1_5 s1_6 s1_7 s2_1 s2_2 s2_3 s2_4 s2_5 s2_6 - silla
m1 m2 - mesa
)
(:init
(necesita Antonio Ainhoa) (necesita Lola Lolo) (necesita Esperanza Enrique)
(necesita Susana Manu) (necesita Manolito Manu) (necesita Susanita Susana)
(nosoporta Ainhoa Susana) (nosoporta Quico Esperanza)
(pertenece_a s1_1 m1)(pertenece_a s1_2 m1)(pertenece_a s1_3 m1)(pertenece_a s1_4 m1)
(pertenece_a s1_5 m1)(pertenece_a s1_6 m1)(pertenece_a s1_7 m1)
(izquierda_de s1_1 s1_2)(izquierda_de s1_2 s1_3)(izquierda_de s1_3 s1_4)
(izquierda_de s1_4 s1_5)(izquierda_de s1_5 s1_6)(izquierda_de s1_6 s1_7)
(izquierda_de s1_7 s1_1)
(pertenece_a s2_1 m2) (pertenece_a s2_2 m2) (pertenece_a s2_3 m2) (pertenece_a s2_4 m2)
(pertenece_a s2_5 m2) (pertenece_a s2_6 m2)
(izquierda_de s2_1 s2_2)(izquierda_de s2_2 s2_3)(izquierda_de s2_3 s2_4)
(izquierda_de s2_4 s2_5)(izquierda_de s2_5 s2_6)(izquierda_de s2_6 s2_1)
)
(:goal (forall (?c2 - comensal) (colocado ?c2)))
)
