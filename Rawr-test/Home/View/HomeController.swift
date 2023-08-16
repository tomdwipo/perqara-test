//
//  HomeController.swift
//  Rawr-test
//
//  Created by Tommy-a on 16/08/23.
//

import UIKit

class HomeController: UIViewController {

    @IBOutlet weak var searchView: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
   
    private var vm: HomeViewModel = HomeViewModelImpl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.searchView.delegate = self
        self.vm.search(query: "")
        vm.delegate = self
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: String(describing: CardCell.self), bundle: nil), forCellReuseIdentifier: String(describing: CardCell.self))
    }
}

extension HomeController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.vm.search(query: searchText)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar){
        searchBar.endEditing(true)
    }
}

extension HomeController: HomeViewDelegate {
    func refresh() {
        self.tableView.reloadData()
    }
}

extension HomeController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.vm.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CardCell.self), for: indexPath) as! CardCell
        cell.setupData(movie: self.vm.data[indexPath.row])
        return cell
    }
}

extension HomeController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.directToDetailPage(id: self.vm.data[indexPath.row].id.description)
    }
}
