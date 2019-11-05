//
//  ViewController.swift
//  eventos
//
//  Created by equipo on 01/11/19.
//  Copyright © 2019 equipo. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tvEventos: UITableView!
    
    var eventos :   [modeloEvento] = []
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "celdaEvento") as? celdaEventoController
        celda?.lblNombreEvento.text = eventos[indexPath.row].nombre
        celda?.lblFecha.text = eventos[indexPath.row].fecha
        celda?.lblTipoLugar.text = eventos[indexPath.row].tipoEvento
        celda?.lblLugar.text = eventos[indexPath.row].lugar
        
        AF.request(eventos[indexPath.row].urlFlyer).responseImage{
            response in
            switch(response.result){
            case.success(let data):
                celda?.imgFlayer.image = data
            case.failure(_):
                print("Algo salio mal")
            }
        }
        
        return celda!
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        AF.request("http://localhost:8888/eventos/wp-json/wp/v2/eventos").responseJSON{
            response in
            switch(response.result){
            case.success(let dato) : if let arregloEventos = dato as? NSArray{
                    for evento in arregloEventos{
                        if let diccionarioEvento = evento as? NSDictionary{
                            let nuevoEvento = modeloEvento(direccionar : diccionarioEvento)
                            self.eventos.append(nuevoEvento)
                        }
                    }
                
                self.tvEventos.reloadData()
                }
                
            case.failure(_) : print("Algo malio sal")
            
            
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 163
    }


}

