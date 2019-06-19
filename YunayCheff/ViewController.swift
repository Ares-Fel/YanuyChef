import UIKit
import Firebase
import FirebaseAuth

class ViewController: UIViewController {
    
    
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtContraseña: UITextField!
    
    var pedidos: [Pedido] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        consultaPedidos()
    }
    
    @IBAction func btnIngresar(_ sender: Any) {
 
            Auth.auth().signIn(withEmail: txtEmail.text!, password: txtContraseña.text!) { (user, error) in
                print("Intentando iniciar sesion")
               
                if error != nil {
                    print("Se presento el siguente error: \(error)")
                    
                    let alerta = UIAlertController(title: "No se encontro el usuario", message: "Intentelo de Nuevo", preferredStyle: .alert)
                    let btnOk = UIAlertAction(title: "OK", style: .default, handler: {(UIAlertAction) in
                        
                    })
                
                    alerta.addAction(btnOk)
                    self.present(alerta, animated: true, completion: nil)
                    
                }else{
                    print("Inicio de sesion exitoso")
                    print("==============================")
                    self.performSegue(withIdentifier: "pedidosSegue", sender: self.pedidos)
                }
            }
    }
    
    func consultaPedidos(){
        Database.database().reference().child("pedidos").observe(DataEventType.childAdded, with: {(datos) in
            let pedido=Pedido()
            pedido.estado = (datos.value as! NSDictionary)["estado"] as? String ?? ""
            pedido.fecha = (datos.value as! NSDictionary)["fecha"] as? String ?? ""
            pedido.nroMesa = (datos.value as! NSDictionary)["nroMesa"] as? String ?? ""
            pedido.hora = (datos.value as! NSDictionary)["hora"] as? String ?? ""
            pedido.id = datos.key
            self.pedidos.append(pedido)
        })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let siguenteVC = segue.destination as! PendientesViewController
            siguenteVC.pedidos = sender as! [Pedido]
        
    }
}




