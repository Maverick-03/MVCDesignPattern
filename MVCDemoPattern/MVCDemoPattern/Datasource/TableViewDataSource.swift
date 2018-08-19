//
//  TableDataSource.swift
//  MVCDesignPattern
//
//  Created by Administrator on 19/08/18.
//  Copyright © 2018 MyTeam. All rights reserved.
//

import Foundation
import UIKit

// protocols
protocol Reusable:class {
    static var reuseIdentifier: String { get }

}

extension Reusable {
    static var reuseIdentifier: String {return Self.reuseIdentifier}
}

protocol CellConfigurable: class {
    
    associatedtype Controller
    var cellController: Controller? { get set }
}

extension UITableView {
    
    func registerReusableCell<T: UITableViewCell >(_: T.Type) where T: Reusable {
        register(T.self, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(indexPath: IndexPath) -> T  where T: Reusable{
        return dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as! T
    }
}


final class TableViewDataSource<Model,Cell:UITableViewCell>:NSObject,UITableViewDataSource  where Cell: Reusable, Cell: CellConfigurable, Model == Cell.Controller{
    var dataSource: [Model] = [] {
        didSet { tableView.reloadData() }
    }
    
    private unowned var tableView: UITableView
    
    init(tableView: UITableView) {
        self.tableView = tableView
        
        tableView.registerReusableCell(Cell.self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: Cell = tableView.dequeueReusableCell(indexPath: indexPath as IndexPath)
        cell.cellController = dataSource[indexPath.row]
        return cell
    }
    
    
}
