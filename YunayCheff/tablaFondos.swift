//
//  tablaFondos.swift
//  YunayCheff
//
//  Created by MAC19 on 5/06/19.
//  Copyright © 2019 OscarMolleapaza. All rights reserved.
//

import UIKit
import Foundation

class tablaFondos: UITableView, UITableViewDataSource, UITableViewDelegate{
    
   
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
  //    let cellFondos = tableView.dequeueReusableCell(withIdentifier: "itemFondo", for:
      //  indexPath) as! tblFondos
        
      //  cellFondos.txtFondo?.text = "Lomo Saltado"
       // cellFondos.lblCantidad?.text = "Cantidad: "
        //cellFondos.txtCantidad?.text = "2"
        let cellEntrada = UITableViewCell()
      
        return cellEntrada
        
        

    }
    
    
}
