import magos.*
object academia {

    const equipo = []
    const candidatos = []

    method equipo() = equipo
    method candidatos() = candidatos

    method puedeEntrarALaAcademia(unMago) = unMago.energia() > 40 and unMago.poder() >= 30
    method asignarEnAcademia(unMago) {
        if (self.puedeEntrarALaAcademia(unMago)) {
            equipo.add(unMago)
        }
        else {
            self.agregarACandidato(unMago)
        }
    }
    method agregarACandidato(unMago) {
        if(not candidatos.contains(unMago)) {
            candidatos.add(unMago)
        }
    }
    method entrenarEquipo() {
        equipo.forEach({ a => a.entrenar() })
    }
    method entrenarCandidato(unMago) { 
        if (candidatos.contains(unMago)) {
            unMago.entrenar()
        }
    }
    method volverAEvaluar() {
        candidatos.forEach({ a => self.asignarEnAcademia(a)
                                  candidatos.remove(a)
                            })
    }
    method poderTotalDeEquipo() {
        return equipo.sum({ a => a.poder() })
    }
    method equipoEnCondicionOptima() {
        return equipo.all({ a => a.energia() >= 45 })
    }
    method deltaDeEnergia(unaLista) = (self.magoConMayorPoder(unaLista).energia() - self.magoConMenorPoder(unaLista).energia()).abs()
    method magoConMayorPoder(unaLista) {
        return unaLista.max({ a => a.poder() })
    }
    method magoConMenorPoder(unaLista) {
        return unaLista.min({ a => a.poder() })
    }
    method poderesDeMagosConGranPoder(unaLista) {
        return unaLista.filter({a => self.esMagoConGranPoder(a) }).map({ a => a.poder() })
    }
    method esMagoConGranPoder(unMago) = unMago.energia() > 90

    // ESCUDO

    var escudoMagicoResistencia = 400
    var escudoMagicoDurabilidad = 600

    method escudoMagicoResistencia() = escudoMagicoResistencia
    method escudoMagicoDurabilidad() = escudoMagicoDurabilidad

    method aumentarResistenciaDeEscudoMagico(unNumero) {
        escudoMagicoResistencia += unNumero
    }
    method aumentarDurabilidadDeEscudoMagico(unNumero) {
        escudoMagicoDurabilidad = (escudoMagicoDurabilidad + unNumero).min(1000)
    }
}