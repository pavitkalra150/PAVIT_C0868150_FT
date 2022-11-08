//
//  ViewController.swift
//  PAVIT_C0868150_FT
//
//  Created by PAVIT KALRA on 2022-11-07.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var number: UILabel!
    @IBOutlet weak var resImage: UIImageView!
    @IBOutlet weak var evenBtn: UIButton!
    @IBOutlet weak var oddBtn: UIButton!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let tapEven = UITapGestureRecognizer(target: self, action: #selector(isEven))
//        let tapOdd = UITapGestureRecognizer(target: self, action: #selector(isOdd))
//
//        even.addGestureRecognizer(tapEven)
//        odd.addGestureRecognizer(tapOdd)
        loadRandomNumber()
    }

    @objc func isEven(){
        let number = Int(self.number.text!) ?? 0
        if isEvenOdd(number: number){
            resImage.image = UIImage(named: "correct")
            print("correct its even")
        }
        else {
            resImage.image = UIImage(named: "wrong")
            print("wrong answer")
            let alert = UIAlertController(title: "Result", message: "Oops... Wrong answer correct answer was Odd", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Play Again", style: .default))
            alert.addAction(UIAlertAction(title: "Show Progress", style: .default, handler: { _ in self.resultscreen()}))
            present(alert,animated: true, completion: { return })
        }
        loadRandomNumber()
    }
    @objc func isOdd(){
        let number = Int(self.number.text!) ?? 0
        if !isEvenOdd(number: number){
            resImage.image = UIImage(named: "correct")
            print("correct its odd")
        }
        else {
            resImage.image = UIImage(named: "wrong")
            let alert = UIAlertController(title: "Result", message: "Oops... Wrong answer correct answer was Even", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Play Again", style: .default))
            alert.addAction(UIAlertAction(title: "Show Progress", style: .default, handler: { _ in self.resultscreen()}))
            present(alert,animated: true, completion: { return })
        }
        loadRandomNumber()
    }
    
    
    
    
    func loadRandomNumber() {
        let number = Int(arc4random_uniform(100))
        self.number.text = "\(number)"
       //resImage.image = UIImage(named: "")
    }
    
    func isEvenOdd(number: Int) -> Bool {
        if(number % 2 != 0)
        {
            return false
        }
        else {
            return true
            
        }
    }
    
    @IBAction func evenBtnpress(_ sender: UIButton) {
        
        isEven()
        
    }
    
    @IBAction func oddBtnpress(_ sender: UIButton) {
        
        isOdd()
    }
    
    func resultscreen(){
            let mainSB : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let ProgressVC = mainSB.instantiateViewController(withIdentifier: "ProgressScene")
//            ProgressVC.imageName = "wrong"
//            ProgressVC.number = number
//            ProgressVc.title = 
            navigationController?.pushViewController(ProgressVC, animated: true)
        }
    
}

