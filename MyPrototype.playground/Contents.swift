//: Playground - noun: a place where people can play

import UIKit

class ViewController : UIViewController{
    var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad() // llamamos a la superclase
        self.view.frame = CGRect(x: 0, y: 0, width: 320, height: 480) //definimos las dimensiones de la vista
        self.tableView = UITableView(frame:self.view.frame) //  inicializamos nuestra tabla con las dimenciones de la vista
        // definimos algunos
        self.tableView.separatorStyle = .none  // eliminamos el separador de las celdas
        self.tableView.rowHeight = 50.0  // definimos el alto de la celda
        self.tableView.backgroundColor = UIColor.black  // definimos el color de fondo de la tabla en color negro
        self.view.addSubview(self.tableView)  // agregamos la tabla a la vista
    }
}
