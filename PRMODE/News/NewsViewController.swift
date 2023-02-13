//
//  NewsViewController.swift
//  PRMODE
//
//  Created by Javier Bachero Gosalbo on 11/2/23.
//

import UIKit



class NewsViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    var news: News?

    let newsModel = NewsModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        newsModel.searchData { (news) in
            if let news = news {
                self.news = news
                self.tableView.reloadData()
            } else {
                // maneja el error aquí
            }
        }
    }
    

    

}

extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news?.articles.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "mycell")
        if cell == nil {
           cell = UITableViewCell(style: .default, reuseIdentifier: "mycell")
        }
        if let article = news?.articles[indexPath.row] {
            cell!.textLabel?.text = article.title
            //cell.descriptionLabel.text = article.description
        }
        return cell!
    }
    
    
    
    
}
