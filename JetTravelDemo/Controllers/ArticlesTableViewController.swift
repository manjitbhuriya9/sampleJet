//
//  ArticlesTableViewController.swift
//  JetTravelDemo
//
//  Created by Organization on 04/07/20.
//  Copyright © 2020 Organization. All rights reserved.
//

import Foundation
import UIKit

class ArticlesTableViewController: UITableViewController {

    private var articleListVM: ArticleListViewModel!
    private var pageNumber = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        setup()
        self.articleListVM = ArticleListViewModel(self)
        self.articleListVM.getArticleListFromServer()
        
    }
    
    private func setup() {
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    /*private func getArticleListFromServer() {
        let url = URL(string: Constant().apiDomain + "blogs?page=\(pageNumber)&limit=10")!
        WebServices().getArticlesList(url: url) { [unowned self] (articles) in
            if let artilces = articles {
                self.articleListVM = ArticleListViewModel(articles: artilces)

                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }*/

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ArticlesTableViewController: ArticleListViewModelDelegate {
    
    func parseArticlSuccess() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func parseArticleFailedWithMessage(_ message: String) {
        
    }
}
