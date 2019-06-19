//
//  tablaEntradas.swift
//  YunayCheff
//
//  Created by MAC19 on 5/06/19.
//  Copyright © 2019 OscarMolleapaza. All rights reserved.
//

import Foundation
import UIKit

class tablaEntradas:UITableView, UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        //let cellEntrada = tableView.dequeueReusableCell(withIdentifier: "itemEntrada", for:
           // indexPath) as! tblEntradas
        
        let cellEntrada = UITableViewCell()
     /* cellEntrada.txtEntrada?.text = "Salpicon"
        cellEntrada.txtCantidad?.text = "1"
        cellEntrada.lblCantidad?.text = "Cantidad: "
        */
        return cellEntrada
    }
    
    
}
