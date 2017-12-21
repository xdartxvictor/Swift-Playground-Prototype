//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

class ViewController : UIViewController, UITableViewDataSource{
    var tableView: UITableView!
    var items = ["Completar los retos", "Completar el Proyecto", "Completar el Examen","Apoyar con las dudas", "Obtener 10 en el examen", "etc", "etc", "etc", "etc", "etc", "etc", "etc", "etc"]
    
    override func viewDidLoad() {
        super.viewDidLoad() // llamamos a la superclase
        self.view.frame = CGRect(x: 0, y: 0, width: 320, height: 480) //definimos las dimensiones de la vista
        self.tableView = UITableView(frame:self.view.frame) //  inicializamos nuestra tabla con las dimenciones de la vista
        self.tableView!.dataSource = self
        self.tableView!.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        // definimos algunos
        self.tableView.separatorStyle = .none  // eliminamos el separador de las celdas
        self.tableView.rowHeight = 50.0  // definimos el alto de la celda
        self.tableView.backgroundColor = UIColor.black  // definimos el color de fondo de la tabla en color negro
        self.view.addSubview(self.tableView)  // agregamos la tabla a la vista
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return self.items.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "\(self.items[indexPath.row])"
        return cell
    }
}

let controller = ViewController()
PlaygroundPage.current.liveView = controller.view
