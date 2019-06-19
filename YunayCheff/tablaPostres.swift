//
//  tablaPostres.swift
//  YunayCheff
//
//  Created by MAC19 on 5/06/19.
//  Copyright © 2019 OscarMolleapaza. All rights reserved.
//

import Foundation
import UIKit

class tablaPostres:UITableView,UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //let cellPostre = tableView.dequeueReusableCell(withIdentifier: "itemPostre", for:
        // indexPath) as! tblPostres
        let cellEntrada = UITableViewCell()

      /*  cellPostre.txtPostre?.text = "Mazamorra"
        cellPostre.lblCantidad?.text = "Cantidad:"
        cellPostre.txtCantidadPostre?.text = "1"
    */
        
        return cellEntrada
        
    }
    
    
}
