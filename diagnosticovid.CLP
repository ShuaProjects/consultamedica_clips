;;----------------------------------------------------------------------
;;      SISTEMA EXPERTO PARA DIAGNOSTICO BASICO DE COVID
;;Se pretende que con este sistema se entregue un diagnostico despues de
;;haberle entregado los sintomas de determinado paciente

;;Se define el template
(deftemplate estado-paciente
		(multislot temperatura)
		(slot tos)
		(slot fatiga)
		(slot respiracion)
		(slot diarrea)
		(slot perdidagusto)
		(slot dolormusculos))


;;Se definen las reglas para el diagnostico positivo

;;=======DIAGNOSTICO CON TODOS LOS SINTOMAS===========================================

(defrule diagpositivo-1
	(estado-paciente
		(temperatura > 37)
		(tos si)
		(fatiga si)
		(respiracion si)
		(diarrea si)
		(perdidagusto si)
		(dolormusculos si))
	=> (printout t crlf "De seguro tienes COVID-19, ya tienes todos los sintomas, debiste ir a consulta antes" crlf crlf ))


;;=======DIAGNOSTICOS CON UN SOLO SINTOMA===========================================

(defrule diagpositivo-2
	(estado-paciente
		(temperatura < 37)
		(tos si)
		(fatiga si)
		(respiracion si)
		(diarrea si)
		(perdidagusto si)
		(dolormusculos si))
	=> (printout t crlf "Cuentas con casi todos los sintomas, por favor ve al medico" crlf crlf ))

(defrule diagpositivo-2-1
	(estado-paciente
		(temperatura > 37)
		(tos no)
		(fatiga si)
		(respiracion si)
		(diarrea si)
		(perdidagusto si)
		(dolormusculos si))
	=> (printout t crlf "Cuentas con casi todos los sintomas, por favor ve al medico" crlf crlf ))

(defrule diagpositivo-2-2
	(estado-paciente
		(temperatura > 37)
		(tos si)
		(fatiga no)
		(respiracion si)
		(diarrea si)
		(perdidagusto si)
		(dolormusculos si))
	=> (printout t crlf "Cuentas con casi todos los sintomas, por favor ve al medico" crlf crlf ))

(defrule diagpositivo-2-3
	(estado-paciente
		(temperatura > 37)
		(tos si)
		(fatiga si)
		(respiracion no)
		(diarrea si)
		(perdidagusto si)
		(dolormusculos si))
	=> (printout t crlf "Cuentas con casi todos los sintomas, por favor ve al medico" crlf crlf ))

(defrule diagpositivo-2-4
	(estado-paciente
		(temperatura > 37)
		(tos si)
		(fatiga si)
		(respiracion si)
		(diarrea no)
		(perdidagusto si)
		(dolormusculos si))
	=> (printout t crlf "Cuentas con casi todos los sintomas, por favor ve al medico" crlf crlf ))

(defrule diagpositivo-2-5
	(estado-paciente
		(temperatura > 37)
		(tos si)
		(fatiga si)
		(respiracion si)
		(diarrea si)
		(perdidagusto no)
		(dolormusculos si))
	=> (printout t crlf "Cuentas con casi todos los sintomas, por favor ve al medico" crlf crlf ))

(defrule diagpositivo-2-6
	(estado-paciente
		(temperatura > 37)
		(tos si)
		(fatiga si)
		(respiracion si)
		(diarrea si)
		(perdidagusto si)
		(dolormusculos no))
	=> (printout t crlf "Cuentas con casi todos los sintomas, por favor ve al medico" crlf crlf ))


;;=======DIAGNOSTICOS CON 4 SINTOMAS===========================================

(defrule diagpositivo-3
	(estado-paciente
		(temperatura < 37)
		(tos no)
		(fatiga no)
		(respiracion si)
		(diarrea si)
		(perdidagusto si)
		(dolormusculos si))
	=> (printout t crlf "Tienes algunos sintomas, acude al medico antes de que empeores" crlf crlf ))

(defrule diagpositivo-3-1
	(estado-paciente
		(temperatura > 37)
		(tos no)
		(fatiga no)
		(respiracion no)
		(diarrea si)
		(perdidagusto si)
		(dolormusculos si))
	=> (printout t crlf "Tienes algunos sintomas, acude al medico antes de que empeores" crlf crlf ))

(defrule diagpositivo-3-2
	(estado-paciente
		(temperatura > 37)
		(tos si)
		(fatiga no)
		(respiracion no)
		(diarrea no)
		(perdidagusto si)
		(dolormusculos si))
	=> (printout t crlf "Tienes algunos sintomas, acude al medico antes de que empeores" crlf crlf ))

(defrule diagpositivo-3-3
	(estado-paciente
		(temperatura > 37)
		(tos si)
		(fatiga si)
		(respiracion no)
		(diarrea no)
		(perdidagusto no)
		(dolormusculos si))
	=> (printout t crlf "Tienes algunos sintomas, acude al medico antes de que empeores" crlf crlf ))

(defrule diagpositivo-3-4
	(estado-paciente
		(temperatura > 37)
		(tos si)
		(fatiga si)
		(respiracion si)
		(diarrea no)
		(perdidagusto no)
		(dolormusculos no))
	=> (printout t crlf "Tienes algunos sintomas, pero son todos los repiratorios, acude a una clinica lo antes posible" crlf crlf ))

(defrule diagpositivo-3-5
	(estado-paciente
		(temperatura < 37)
		(tos si)
		(fatiga si)
		(respiracion si)
		(diarrea si)
		(perdidagusto no)
		(dolormusculos no))
	=> (printout t crlf "Tienes algunos sintomas, acude al medico antes de que empeores" crlf crlf ))

(defrule diagpositivo-3-6
	(estado-paciente
		(temperatura < 37)
		(tos no)
		(fatiga si)
		(respiracion si)
		(diarrea si)
		(perdidagusto si)
		(dolormusculos no))
	=> (printout t crlf "Tienes algunos sintomas, acude al medico antes de que empeores" crlf crlf ))

;;=======DIAGNOSTICOS CON 2 SINTOMAS===========================================

;;=======DIAGNOSTICOS CON 2 SINTOMAS CON TEMPERATURA COMO CONSTANTE===========================================

(defrule diag2sintomas-temperatura-1
	(estado-paciente
		(temperatura > 37)
		(tos si)
		(fatiga no)
		(respiracion no)
		(diarrea no)
		(perdidagusto no)
		(dolormusculos no))
	=> (printout t crlf "Cuentas con pocos sintomas, seria prudente hacerse una prueba " crlf crlf ))

(defrule diag2sintomas-temperatura-2
	(estado-paciente
		(temperatura > 37)
		(tos no)
		(fatiga si)
		(respiracion no)
		(diarrea no)
		(perdidagusto no)
		(dolormusculos no))
	=> (printout t crlf "Cuentas con pocos sintomas, seria prudente hacerse una prueba " crlf crlf ))

(defrule diag2sintomas-temperatura-3
	(estado-paciente
		(temperatura > 37)
		(tos no)
		(fatiga no)
		(respiracion si)
		(diarrea no)
		(perdidagusto no)
		(dolormusculos no))
	=> (printout t crlf "Cuentas con pocos pero los mas preocupante sintomas, acude a una clinica cuanto antes" crlf crlf ))


(defrule diag2sintomas-temperatura-4
	(estado-paciente
		(temperatura > 37)
		(tos no)
		(fatiga no)
		(respiracion no)
		(diarrea si)
		(perdidagusto no)
		(dolormusculos no))
	=> (printout t crlf "Cuentas con pocos sintomas, seria prudente hacerse una prueba " crlf crlf ))


(defrule diag2sintomas-temperatura-5
	(estado-paciente
		(temperatura > 37)
		(tos no)
		(fatiga no)
		(respiracion no)
		(diarrea no)
		(perdidagusto si)
		(dolormusculos no))
	=> (printout t crlf "Cuentas con pocos sintomas, seria prudente hacerse una prueba " crlf crlf ))


(defrule diag2sintomas-temperatura-6
	(estado-paciente
		(temperatura > 37)
		(tos no)
		(fatiga no)
		(respiracion no)
		(diarrea no)
		(perdidagusto no)
		(dolormusculos si))
	=> (printout t "Cuentas con pocos sintomas, seria prudente hacerse una prueba " crlf))



