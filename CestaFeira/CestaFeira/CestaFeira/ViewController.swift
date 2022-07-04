//
//  ViewController.swift
//  CestaFeira
//
//  Created by vko on 02/07/22.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

class FirstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate,  UITextFieldDelegate {

    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var field: UITextField!
    
    struct Images{
        let title: String
        let imageName: String
    }
    
    var data = [itemData]()
    var filteredData = [itemData]()
    var filtered = false
    
     
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupData()
        table.dataSource = self
        table.delegate = self
        field.delegate = self
        
        table.separatorStyle = .none
        table.showsVerticalScrollIndicator = false
        }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if let text = textField.text {
            
            filterText(text+string)
        }
        
        return true
    }
    
    func filterText(_ query: String) {
        filteredData.removeAll()
        for string in data {
            if string.itemName.lowercased().starts(with: query.lowercased()) {
                filteredData.append(string)
            }
        }
        table.reloadData()
        filtered = true
    }
    
    private func setupData() {
        let item1 = itemData(iName: "Alface", iImage: "alface")
        data.append(item1)
        let item2 = itemData(iName: "Banana", iImage: "banana")
        data.append(item2)
        let item3 = itemData(iName: "Cebola", iImage: "cebola")
        data.append(item3)
        let item4 = itemData(iName: "Limão", iImage: "limao")
        data.append(item4)
        let item5 = itemData(iName: "Tomate", iImage: "tomate")
        data.append(item5)
        let item6 = itemData(iName: "Alho", iImage: "alho")
        data.append(item6)
        let item7 = itemData(iName: "Berinjela", iImage: "berinjela")
        data.append(item7)
        let item8 = itemData(iName: "Ketchup", iImage: "ketchup")
        data.append(item8)
        let item9 = itemData(iName: "Maionese", iImage: "maio")
        data.append(item9)
        let item10 = itemData(iName: "Mostarda", iImage: "mostarda")
        data.append(item10)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !filteredData.isEmpty {
            return filteredData.count
        }
        return filtered ? 0 : data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let Cell = table.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        
        if !filteredData.isEmpty{
            Cell.label.text = filteredData[indexPath.row].itemName
            Cell.iconImageView.image = UIImage(named: filteredData[indexPath.row].itemImage)
            
        }
        else {
            Cell.label.text = data[indexPath.row].itemName
            Cell.iconImageView.image = UIImage(named: data[indexPath.row].itemImage)
        }

        //design
        Cell.iconView.layer.cornerRadius = Cell.iconView.frame.height / 3.5
        Cell.iconImageView.layer.cornerRadius = Cell.iconImageView.frame.height / 3.5
        
        
        return Cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}

class SecondViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var table: UITableView!
    
    struct pratos {
        let nome: String
        let foto: String
    }
        
    let recData: [pratos] = [
        pratos(nome: "Cuscuz", foto: "cuscuz"),
        pratos(nome: "Feijoada", foto: "feijoada"),
        pratos(nome: "Pizza", foto: "pizza"),
        pratos(nome: "Salada", foto: "salada")
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.dataSource = self
        table.delegate = self
        
        table.separatorStyle = .none
        table.showsVerticalScrollIndicator = false
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->
        UITableViewCell {
        let pratin = recData[indexPath.row]
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ReceitaTableCell
        
        cell.receitinhaLabel.text = pratin.nome
        cell.receitinhaView.image = UIImage(named: pratin.foto)
 
        cell.receitinhaView.layer.cornerRadius = cell.receitinhaView.frame.height / 8
        cell.receitaView.layer.cornerRadius = cell.receitaView.frame.height / 8
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
        
    }
}


