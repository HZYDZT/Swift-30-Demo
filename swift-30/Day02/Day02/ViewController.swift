//
//  ViewController.swift
//  Day02


import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var dataSource: Dictionary<String, Array<String>> = [:]
    var array:Array<String> = [(String)()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "what"
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "uitableviewcell")
        
        self.dataSource = [
            "1":["a","b"],
            "2":["c", "d"],
            "3":["e", "f", "g"],
            "4":["l", "m", "n","o"],
            "5":["p", "q", "r","s"],
        ]
        self.array = self.dataSource.keys.sorted()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let key = self.array[section]
        let array:Array = self.dataSource[key]!
        return array.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.dataSource.keys.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let key = self.array[indexPath.section];
        let array = self.dataSource[key];
        let value = array![indexPath.row]
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "uitableviewcell")!
        
        cell.textLabel?.text = value
        cell.backgroundColor = UIColor.white
        return cell;
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let key = self.array[section];
        let view:UIView? = UIView.init(frame: CGRect.init(origin: CGPoint.init(x: 0, y: 0), size: CGSize.init(width: self.view.frame.size.width, height: 30)))

        
        let label:UILabel? = UILabel.init(frame: CGRect.init(origin: CGPoint.init(x: 20, y: 0), size: CGSize.init(width: self.view.frame.size.width, height: 30)))
        label?.text = key;
        label?.font = UIFont.boldSystemFont(ofSize: 20)
        label?.backgroundColor = UIColor.white
        
        view?.addSubview(label!)
        return view;
    }
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return self.array
    }
}

