//Simulacro Wollok

object riley {

	var felicidad = 1000
	var emocionDominante		/*   "alegre" || "triste" || etc.   */
	
	const recuerdosDelDia = []
	const pensamientosCentrales = #{}
	const memoriaALargoPlazo = []
	
	/* */
	method emocionDominante() = emocionDominante
	method pensamientosCentrales() = pensamientosCentrales
	
	method recuerdosRecientesDelDia() = recuerdosDelDia.take(5)
	method pensamientosCentralesDificilesDeExplicar() = 
		pensamientosCentrales.filter( {pensamiento => pensamiento.descripcion().words().size() > 10} )
		
	/* Vivir */	
	method vivir(evento) {		
		recuerdosDelDia.add(evento.recuerdoAsociado())		
	}
	
	method asentarRecuerdo(recuerdo) {
		//recuerdo alegre
		if(recuerdo.esAlegre() && felicidad > 500){
			pensamientosCentrales.add(recuerdo)
		}
		//recuerdo triste
		else if(recuerdo.esTriste()){
			pensamientosCentrales.add(recuerdo)
			felicidad -= felicidad*0.1
			
			if(felicidad<1){
				self.error("El coeficiente de felicidad no puede ser menor a 1")
			}
		}
		//otros recuerdos (nada)
	}	
	
	
	/* Descansar */
	method niega(unRecuerdo){
		if(emocionDominante == "alegre")
			return !unRecuerdo.esAlegre()
		if(emocionDominante == "triste")
			return unRecuerdo.esAlegre()
		return false	
	} 
	
	method descansar(){
		
	}
	
	/* Procesos Mentales */
	method asentamiento() = recuerdosDelDia.forEach( {recuerdo => self.asentarRecuerdo(recuerdo)} )
	method asentamientoSelectivo(palabraClave) = 
		recuerdosDelDia.forEach( {recuerdo => 
			if(recuerdo.descripcion().words().contains(palabraClave))
				self.asentarRecuerdo(recuerdo)
		})
	method profundizacion() =
		
	
}

/* Evento */
class Evento {	
	const recuerdoAsociado
	
	method recuerdoAsociado() = recuerdoAsociado
}

/* Recuerdo */
class Recuerdo {
	
	const descripcion
	const fecha
	const emocion = riley.emocionDominante()
	
	method descripcion() = descripcion
	method fechaObjeto() = fecha
	
	method fecha() = fecha.dia() + " / " + fecha.mes() + " / " + fecha.anio()
	
	method esAlegre() = emocion == "alegre"
	method esTriste() = emocion == "triste"
}

/* Fecha */
class Fecha {
	const dia
	const mes
	const anio
	
	method dia() = dia
	method mes() = mes
	method anio() = anio
}


