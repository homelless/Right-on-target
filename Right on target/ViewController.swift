//
//  ViewController.swift
//  Right on target
//
//  Created by MacBookAir on 20.12.23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var slider : UISlider!
    @IBOutlet var label : UILabel!
    
    lazy var secondViewController: SecondViewController = getSecondViewController()
    
    private func getSecondViewController() -> SecondViewController{
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
     
        let viewController = storyboard.instantiateViewController(identifier:
        "SecondViewController")
        return viewController as! SecondViewController
    }
    
    
    override func loadView() {
        super.loadView()
        print("loadView")
        
        let versionLabel = UILabel(frame: CGRect(x: 20, y: 10, width: 200, height: 20))
        versionLabel.text = "Версия 1.1"
        self.view.addSubview(versionLabel)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear")
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        
        self.number = Int.random(in: 1...50)
        self.label.text = String(self.number)
        
        // Do any additional setup after loading the view.
    }

    //загаданное число
    var number : Int = 0
    //раунд
    var round : Int = 1
    //сумма очков за раунд
    var points : Int = 0

    
    @IBAction func checkNumber() {

            let numSlider = Int(self.slider.value.rounded())
        
            if numSlider > self.number {
                self.points += 50 - numSlider + self.number
            }else if numSlider < self.number {
                self.points += 50 - self.number + numSlider
            }else{
                self.points += 50
            }
            if self.round == 5{
                let alert = UIAlertController(title: "Игра окончена", message: "Вы заработали \(self.points) очков", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Начать заново", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                self.round = 0
                self.points = 0
            }else{
                self.round += 1
                
            }
            self.number = Int.random(in: 1...50)
            self.label.text = String(self.number)
        }
    }


