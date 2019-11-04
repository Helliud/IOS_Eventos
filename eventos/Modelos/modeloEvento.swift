//
//  modeloEvento.swift
//  eventos
//
//  Created by equipo on 01/11/19.
//  Copyright © 2019 equipo. All rights reserved.
//

import Foundation

class modeloEvento{
    
    var nombre : String
    var fecha : String
    var urlFlyer : String
    
    var lugar : String?
    var tipoEvento : String?
    
    init(nombre : String, fecha : String, urlFlyer : String) {
        self.nombre = nombre
        self.fecha = fecha
        self.urlFlyer = urlFlyer
    }
    
    init(direccionar : NSDictionary){
        self.nombre = "nombre"
        self.fecha = "fecha"
        self.urlFlyer = "urlFlyer"
    }
}
