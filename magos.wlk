import academia.*

object arcanaMagister {
    const magosReclutados = []

    method reclutarUnMago(unMago) {
        magosReclutados.add(unMago)
    }


}

object selene {
    var poder = 60
    var energia = 35
    var luzLunarEstado = false

    method poder() = poder
    method energia() = energia

    method entrenar() {
        if (luzLunarEstado == true) {
            poder *= 2
        }
        else {
            energia += (energia * 0.25)
        } 
    }
    method alternarEstadoDeHabilidad() {
        if (luzLunarEstado == true) {
            luzLunarEstado = false
        }
        else {
            luzLunarEstado = true
        }
    }
}

object balthazar {
    var hechizosUsados = 0
    var horasDeEntreanamiento = 450
        
    method poder() = (35 - hechizosUsados) * 3
    method energia() = 0
    method horasDeEntrenamiento() = horasDeEntreanamiento
    method poderMagico() = horasDeEntreanamiento / 10

    method entrenar() {
        horasDeEntreanamiento += 100
        self.hacerHechizoDanino() 
    }
    method hacerHechizoDanino() {
        hechizosUsados += 1
    }
}

object iris {
    var capacidadDeSanacion = 2

    method poder() = 35
    method energia() = 80

    method entrenar() {
        capacidadDeSanacion += 1
    }
    method capacidadDeSanacion() = capacidadDeSanacion
    method usarSanacionEnEscudoMagicoDeArcana() {
        if (capacidadDeSanacion.odd()) {
            academia.aumentarResistenciaDeEscudoMagico(150)
            academia.aumentarDurabilidadDeEscudoMagico(100)
        }
        else {
            academia.aumentarResistenciaDeEscudoMagico(80)
            academia.aumentarDurabilidadDeEscudoMagico(60 * capacidadDeSanacion)
        }
    }
}

object aldric {
    var cantidadDeEntrenamientos = 2
    var habilidadConBastones = 30 
    var bastonActual = "Baston de Hielo"

    method poder() = habilidadConBastones * 0.5
    method energia() = 65 + 20 * cantidadDeEntrenamientos

    method entrenar() {
        if (bastonActual == "Baston de Hielo") {
            habilidadConBastones += 40
            cantidadDeEntrenamientos += 1
        }
        else {
            cantidadDeEntrenamientos += 1
            habilidadConBastones += 60
        }
    }
    method cambiarBaston(nuevoBaston) {
        bastonActual = "nuevoBaston"
    } 
}