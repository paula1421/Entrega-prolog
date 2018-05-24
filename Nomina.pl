contratacion('Maicol','Tipo3').
contratacion('Pedro','Tipo2').
contratacion('Juliana','Tipo1').
contratacion('Natalia','Tipo4').
contratacion('Ismael','Tipo5').
contratacion('David','Tipo3').
contratacion('Liliana','Tipo2').
contratacion('Mariana','Tipo2').
contratacion('Cristian','Tipo1').
contratacion('Osvaldo','Tipo4').
contratacion('Pepa','Tipo5').
contratacion('Andrea','Tipo3').
contratacion('Diana','Tipo2').

%Tipo de contratacion y las horas pagadas a la semana
horaSemanalContrato('Tipo1',35).
horaSemanalContrato('Tipo2',40).
horaSemanalContrato('Tipo3',22).
horaSemanalContrato('Tipo4',16).
horaSemanalContrato('Tipo5',20).

contratacionCategoria('Tipo1','Secundario').
contratacionCategoria('Tipo1','Principal').
contratacionCategoria('Tipo4','Secundario').
contratacionCategoria('Tipo4','Principal').
contratacionCategoria('Tipo5','Secundario').
contratacionCategoria('Tipo5','Principal').
contratacionCategoria('Tipo3','Secundario').
contratacionCategoria('Tipo3','Principal').
contratacionCategoria('Tipo2','Secundario').
contratacionCategoria('Tipo2','Principal').

%Tipo de contratacion, tipoContratacion y valor de la hora
valorHoraCategoria('Tipo1','Secundario',20000).
valorHoraCategoria('Tipo1','Principal',10000).
valorHoraCategoria('Tipo4','Secundario',10000).
valorHoraCategoria('Tipo4','Principal',15000).
valorHoraCategoria('Tipo5','Secundario',8000).
valorHoraCategoria('Tipo5','Principal',12000).
valorHoraCategoria('Tipo3','Secundario',3000).
valorHoraCategoria('Tipo3','Principal',9000).
valorHoraCategoria('Tipo2','Secundario',14000).
valorHoraCategoria('Tipo2','Principal',15000).


tipoContratacion('Maicol','Principal').
tipoContratacion('Pedro','Secundario').
tipoContratacion('Juliana','Principal').
tipoContratacion('Natalia','Secundario').
tipoContratacion('Ismael','Principal').
tipoContratacion('David','Secundario').
tipoContratacion('Liliana','Principal').
tipoContratacion('Mariana','Secundario').
tipoContratacion('Cristian','Principal').
tipoContratacion('Osvaldo','Secundario').
tipoContratacion('Pepa','Principal').
tipoContratacion('Andrea','Secundario').
tipoContratacion('Diana','Principal').


sumar([],0).
sumar([ X | Xs ],R) :- sumar(Xs, R1), R is R1+X.

%Tipo y semanas del semestre
tipoSemestre('Normal',18).
tipoSemestre('Intersemestral',4).

%Calculo de la nomina individual en un semestre especifico
nominaEmpleado(A,K,B):-contratacion(A,C),horaSemanalContrato(C,D),tipoContratacion(A,P),valorHoraCategoria(C,P,E),tipoSemestre(K,S),B is round(((D*E*S)*(1+(F/100)))).


%Calculo de la nomina general en un semestre especifico
nominaNormal(Total) :- findall(B, (contratacion(A,C),horaSemanalContrato(C,D),tipoContratacion(A,P),valorHoraCategoria(C,P,E), B is round(((D*E*18)*(1+(F/100))))), Lista), sumar(Lista,Total).
nominaInter(Total) :- findall(B, (contratacion(A,C),horaSemanalContrato(C,D),tipoContratacion(A,P),valorHoraCategoria(C,P,E), B is round(((D*E*4)*(1+(F/100))))), Lista), sumar(Lista,Total).
