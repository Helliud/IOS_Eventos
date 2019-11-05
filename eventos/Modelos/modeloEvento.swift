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
    
    init(nombre : String, fecha : String, urlFlyer : String, lugar : String, tipoEvento : String) {
        self.nombre = nombre
        self.fecha = fecha
        self.urlFlyer = urlFlyer
        self.lugar = lugar
        self.tipoEvento = tipoEvento
    }
    
    init(direccionar : NSDictionary){
        self.nombre = ""
        self.fecha = "00-00-0000"
        self.urlFlyer = ""
        self.lugar = ""
        self.tipoEvento = ""
        
        
        if let title = direccionar.value(forKey: "title") as? NSDictionary{
            if let rendered = title.value(forKey: "rendered") as? String{
                self.nombre = rendered
            }
        }
        
        if let acf = direccionar.value(forKey: "acf") as? NSDictionary{
            
            if let fecha = acf.value(forKey: "fecha") as? String{
                self.fecha = fecha
            }
            
            if let lugar = acf.value(forKey: "lugar") as? String{
                self.lugar = lugar
            }
            
            if let tipoEvento = acf.value(forKey: "tipo_de_evento") as? String{
                self.tipoEvento = tipoEvento
            }
            
            if let flyer = acf.value(forKey: "flyer") as? String{
                self.urlFlyer = flyer
            }
            
        }
        
       
    }
}
