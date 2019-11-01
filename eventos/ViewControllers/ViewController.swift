//
//  ViewController.swift
//  eventos
//
//  Created by equipo on 01/11/19.
//  Copyright © 2019 equipo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
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
        
        return celda!
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    


}

