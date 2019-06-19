
import UIKit
import Firebase

class tblEntradas: UITableViewCell{
   
    
    @IBOutlet weak var lblMesa: UILabel!
    @IBOutlet weak var lblEntrada1: UILabel!
    @IBOutlet weak var lblEntrada2: UILabel!
    @IBOutlet weak var lblEntrada3: UILabel!
    @IBOutlet weak var lblHora: UILabel!
    
    
    
    @IBAction func btnCompletado(_ sender: Any) {
    }
    
}


class tblFondos: UITableViewCell{
    
    @IBOutlet weak var lblHora: UILabel!
    @IBOutlet weak var lblMesaF: UILabel!
    @IBOutlet weak var lblFondo1: UILabel!
    @IBOutlet weak var lblFondo2: UILabel!
    @IBOutlet weak var lblFondo3: UILabel!
    
    @IBAction func btnCompletadoF(_ sender: Any) {
    }
    
    
}

class tblPostres: UITableViewCell{
    
    @IBOutlet weak var lblMesaP: UILabel!
    @IBOutlet weak var lblPostre1: UILabel!
    @IBOutlet weak var lblPostre2: UILabel!
    @IBOutlet weak var lblPostre3: UILabel!
    @IBOutlet weak var lblHora: UILabel!
    
    @IBAction func btnCompletadoP(_ sender: Any) {
    }
    
}


class PendientesViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource {
 
    @IBOutlet weak var tableViewEntradas: UITableView!
    
    @IBOutlet weak var tableViewFondos: UITableView!

    @IBOutlet weak var tableViewPostres: UITableView!
    
    
    var pedidos:[Pedido] = []
    var contenidos:[Contenido] = []
    
    var cadena:[String]=[]
    
    var datosEntradas  = [ ( Contenido() , Pedido() ) ]
    var datosPlatos  = [ ( Contenido() , Pedido() ) ]
    var datosPostres  = [ ( Contenido() , Pedido() ) ]

    override func viewDidLoad() {
        super.viewDidLoad()
      //  setEditing(true, animated: true)
      
        tableViewEntradas.delegate = self
        tableViewEntradas.dataSource = self
        tableViewFondos.dataSource = self
        tableViewFondos.delegate = self
        tableViewPostres.delegate = self
        tableViewPostres.dataSource = self
        
        print("pedidos=> \(pedidos.count)")
        
        var cont = 0
        
        datosEntradas.removeAll()
        datosPostres.removeAll()
        datosPlatos.removeAll()
        
        print(pedidos[0].nroMesa)
        print(pedidos[1].nroMesa)
        print(pedidos[2].nroMesa)
        print(pedidos[3].nroMesa)
        
        //ESTE FOR ESTA PRESENTANDO UN ERROR AL QUERER VOLVER A LA VISTA PROINCIPAL
        
        for i in pedidos {
            Database.database().reference().child("pedidos").child(pedidos[cont].id).child("contenido").observe(DataEventType.childAdded, with: {(datos) in
                
                var contenido = Contenido()
                
                //var contenido = Contenido()
                
                contenido.nombre = (datos.value as! NSDictionary)["nombre"] as! String
                contenido.cantidad = (datos.value as! NSDictionary)["cantidad"] as! Int
                contenido.tipo = (datos.value as! NSDictionary)["tipo"] as! String
                contenido.id = datos.key
                
                if contenido.tipo == "Entrada"{
                    print(i.hora)
                    self.datosEntradas.append( (contenido, i) )
                    
                }else if contenido.tipo == "Fondo"{
                    self.datosPlatos.append( (contenido, i) )

                }else if contenido.tipo == "Postre"{
                    self.datosPostres.append( (contenido, i) )
                }
                
                self.tableViewFondos.reloadData()
                self.tableViewPostres.reloadData()
                self.tableViewEntradas.reloadData()
                
            })
            cont = cont + 1
            print("Se recargarán las tablas por \(cont) vez.")
            
        }
    }
    
    
    
    /*func crearPedido() -> [Pedido]{
        let pedido1 = Pedido()
        
        pedido1.contenido.cantidad = 3
        pedido1.contenido.nombre = "Lomo Saltado"
        pedido1.estado = "Completado"
        
        let pedido2 = Pedido()
        pedido2.nombre = "Ceviche"
        pedido2.cantidad = "3"
        pedido2.estado = "completado"
        
        let pedido3 = Pedido()
        pedido3.nombre = "Chicharron"
        pedido3.cantidad = "1"
        pedido3.estado = "servido"
        
        return [pedido1,pedido2,pedido3]
    }*/
    /*
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let botonEliminar = UITableViewRowAction(style: .normal, title: "Servido"){
            (accionesFila, indiceFila) in
            print("Eliminar")
            
        }
        botonEliminar.backgroundColor = UIColor.red
        
        let botonInsertar = UITableViewRowAction(style: .normal, title: "Completado"){
            (accionesFila, indiceFila) in
            print("insertar")
        }
        botonInsertar.backgroundColor = UIColor.green
        return[botonEliminar,botonInsertar]
    }
 */
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var nroRows = 0
       
        switch tableView {
            case tableViewEntradas:
                nroRows = datosEntradas.count
            case tableViewFondos:
                nroRows = datosPlatos.count
            case tableViewPostres:
                nroRows = datosPostres.count
            default:
                print("no hay datos")
        }
        return nroRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
       var cell = UITableViewCell()
        switch tableView {
        case tableViewEntradas:
            
            var   cellE = tableView.dequeueReusableCell(withIdentifier:"itemEntrada", for: indexPath) as! tblEntradas
            cellE.lblMesa?.text = "Mesa: \(datosEntradas[indexPath.row].1.nroMesa)"
            cellE.lblEntrada1?.text = "\(datosEntradas[indexPath.row].0.nombre) --> \(datosEntradas[indexPath.row].0.cantidad)"
            //cellE.lblEntrada2?.text = "\(datosEntradas[indexPath.row+1].0.nombre) --> \(datosEntradas[indexPath.row].0.cantidad)"
            //cellE.lblEntrada3?.text = "\(datosEntradas[indexPath.row+2].0.nombre) --> \(datosEntradas[indexPath.row].0.cantidad)"
            cellE.lblHora?.text = "Hora: \(datosEntradas[indexPath.row].1.hora)"
            /*cellE.lblEntrada1?.text = "\(datosEntradas[indexPath.row].nombre) --> \(datosEntradas[indexPath.row].cantidad) "
            cellE.lblEntrada2?.text = "\(datosEntradas[indexPath.row+1].nombre) --> \(datosEntradas[indexPath.row+1].cantidad) "
            cellE.lblEntrada3?.text = "\(datosEntradas[indexPath.row+2].nombre) --> \(datosEntradas[indexPath.row+2].cantidad) "*/
           // cell.textLabel?.text = datosEntradas[indexPath.row]
            cell = cellE
            
        case tableViewFondos:
            var cellF = tableView.dequeueReusableCell(withIdentifier:"itemFondo", for: indexPath) as! tblFondos
            //cellF.textLabel?.text = datosPlatos[indexPath.row]
            cellF.lblMesaF?.text = "Mesa: \(datosPlatos[indexPath.row].1.nroMesa)"
            cellF.lblFondo1?.text = "\(datosPlatos[indexPath.row].0.nombre)"
            cellF.lblHora?.text = "Hora: \(datosPlatos[indexPath.row].1.hora)"
        
            cell = cellF
            
        case tableViewPostres:
             var cellP = tableView.dequeueReusableCell(withIdentifier:"itemPostre", for: indexPath) as! tblPostres
            //cellP.textLabel?.text = datosPostres[indexPath.row]
             cellP.lblMesaP?.text = "Mesa: \(datosPostres[indexPath.row].1.nroMesa)"
             cellP.lblPostre1?.text = "\(datosPostres[indexPath.row].0.nombre)"
             cellP.lblHora?.text = "Hora: \(datosPostres[indexPath.row].1.hora)"
             
            cell = cellP
        default:
            print("no hay datos")
            
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        /*
        switch tableView {
        case tableViewEntradas:
            print(datosPostres[indexPath.row].nombre)
        case tableViewFondos:
            print(datosPostres[indexPath.row].nombre)
        case tableViewPostres:
            print(datosPostres[indexPath.row].nombre)
        default:
            print("no hay datos")
            
        }
 */
    }
   /*
    func cargarPedidos()  {
        
        let pedido = Pedido()
        
        Database.database().reference().child("pedidos").child("contenido").observe(DataEventType.childAdded, with: {(datos) in
            
            pedido.estado = (datos.value as! NSDictionary)["estado"] as! String
            
            print("===>>>\(pedido.estado)")
        })
    }*/
  

}
