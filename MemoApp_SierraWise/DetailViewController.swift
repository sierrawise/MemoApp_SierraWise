//
//  DetailViewController.swift
//  MemoApp_SierraWise
//
//  Created by Sierra Wise on 9/26/24.
//

import UIKit

class DetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension DetailViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row{
        case 0:
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "MemoCell", for: indexPath)
            print("MemoCell row \(indexPath.row)")
            print("MemoCell section \(indexPath.section)")
            return cell1
        case 1:
            let cell2 = tableView.dequeueReusableCell(withIdentifier: "DateCell", for: indexPath)
            print("DateCell row \(indexPath.row)")
            print("DateCell section \(indexPath.section)")
            return cell2
        default:
            fatalError()
        }
        
        
    }
    
    
}
