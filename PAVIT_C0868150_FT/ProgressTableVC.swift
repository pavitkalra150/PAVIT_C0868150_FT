//
//  ProgressTableVC.swift
//  PAVIT_C0868150_FT
//
//  Created by PAVIT KALRA on 2022-11-07.
//

import UIKit

class ProgressTableVC: UIViewController
,UITableViewDelegate,UITableViewDataSource
{
    struct Progress {
        let number: String
        let title: String
        let imageName: String
    }
    
    
    @IBOutlet weak var table: UITableView!
    let data: [Progress] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let progress = data[indexPath.row]
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ProgressCellVC
        cell.title.text = progress.number + progress.title
        cell.imgView.image = UIImage(named: progress.imageName)
        return cell
    }

}
