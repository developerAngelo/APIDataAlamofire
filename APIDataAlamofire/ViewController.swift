//
//  ViewController.swift
//  APIDataAlamofire
//
//  Created by Ruthlyn Huet on 7/13/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var country = [Country]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        networkService()
        
    }
    
    func networkService(){
        let service = NetworkService(baseUrl: "https://restcountries.eu/rest/v2/")
        service.getAllCountry(endpoint: "all")
        service.completionHandler { [weak self] (country, status, msg) in
            if status {
                guard let self = self else {return}
                guard let _country = country else {return}
                self.country = _country
                self.tableView.reloadData()
            }
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return country.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil{
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        }
        let countries = country[indexPath.row]
        cell?.textLabel?.text = (countries.name ?? "") + " " + (countries.countryCode ?? "")
        cell?.detailTextLabel?.text = countries.capital
        return cell!
    }
    
}

