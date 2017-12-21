//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

class CustomTableViewCell: UITableViewCell {
    
    let gradientLayer = CAGradientLayer()
    
    required init(coder aDecoder: NSCoder) {
        fatalError("NSCoding not supported")
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        gradientLayer.frame = bounds
        let color1 = UIColor(white: 1.0, alpha: 0.2).cgColor as CGColor
        let color2 = UIColor(white: 1.0, alpha: 0.1).cgColor as CGColor
        let color3 = UIColor.clear.cgColor as CGColor
        let color4 = UIColor(white: 0.0, alpha: 0.1).cgColor as CGColor
        gradientLayer.colors = [color1, color2, color3, color4]
        gradientLayer.locations = [0.0, 0.01, 0.95, 1.0]
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }
}


class ViewController : UIViewController, UITableViewDataSource{
    var tableView: UITableView!
    var items = ["Completar los retos", "Completar el Proyecto", "Completar el Examen","Apoyar con las dudas", "Obtener 10 en el examen", "etc", "etc", "etc", "etc", "etc", "etc", "etc", "etc"]
    
    override func viewDidLoad() {
        super.viewDidLoad() // llamamos a la superclase
        self.view.frame = CGRect(x: 0, y: 0, width: 320, height: 480) //definimos las dimensiones de la vista
        self.tableView = UITableView(frame:self.view.frame) //  inicializamos nuestra tabla con las dimenciones de la vista
        self.tableView!.dataSource = self
        self.tableView!.register(CustomTableViewCell.self, forCellReuseIdentifier: "cell")
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        cell.textLabel?.text = "\(self.items[indexPath.row])"
        cell.textLabel?.textColor = UIColor(white: 1.0, alpha: 0.80)
        cell.backgroundColor = colorForRowAt(indexPath: indexPath.row)
        cell.textLabel?.backgroundColor = UIColor.clear
        return cell
    }
    
    func colorForRowAt(indexPath: Int) -> UIColor {
        let totalItems = self.items.count - 1
        let val = (CGFloat(indexPath) / CGFloat(totalItems)) * 0.6
        return UIColor(red: 1.0, green: val, blue: 0.0, alpha: 1.0)
    }
}

let controller = ViewController()
PlaygroundPage.current.liveView = controller.view
