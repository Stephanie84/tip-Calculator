//
//  CalculateViewController.swift
//  tipCalculator
//
//  Created by etudiant08 on 02/03/2017.
//  Copyright © 2017 etudiant08. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet weak var checkAmountLabel: UILabel!
    
    @IBOutlet weak var checkAmountTextField: UITextField!
    
    @IBOutlet weak var starButtonPoor: UIButton!
    @IBOutlet weak var starButtonGood: UIButton!
    @IBOutlet weak var starButtonExcellent: UIButton!
    
    @IBOutlet weak var serviceLabel: UILabel!
    
    @IBOutlet weak var currencySegmentedControl: UISegmentedControl!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var serviceStringLabel: UILabel!
    
    //@IBOutlet weak var backButton: UIButton!
    
    var brain = CalculatorModel()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //backButton.layer.borderColor = UIColor.black.cgColor
        //backButton.layer.borderWidth = 2.0
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.barTintColor = UIColor.orange
        self.serviceStringLabel.layer.borderColor = UIColor.black.cgColor
        self.serviceStringLabel.layer.borderWidth = 1.0
//faire un cadre et couleur 
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
     //@IBAction func backButtonClicked(_ sender: UIButton) {
        //print("BACK BUTTON CLICKED")
        //self.dismiss(animated:true, completion: nil)
    //}

    @IBAction func serviceButtonType(_ sender: UIButton) {
        print("button\(sender.tag)")
        brain.serviceLevel = sender.tag
//Permet d'avoir le niveau du service
        let imagePleine = #imageLiteral(resourceName: "fleche_pleine")
        let imageVide = #imageLiteral(resourceName: "fleche_creuse")
//        switch sender.tag{
//        case 0:
//            self.serviceLabel.text = "Service pour 10%"
//            self.starButtonPoor.setImage(#imageLiteral(resourceName: "fleche_pleine"), for: UIControlState.normal)
//             self.starButtonGood.setImage(#imageLiteral(resourceName: "fleche_creuse"), for: UIControlState.normal)
//            self.starButtonExcellent.setImage(#imageLiteral(resourceName: "fleche_creuse"), for: UIControlState.normal)
//        case 1:
//            self.serviceLabel.text = "Service pour 15%"
//            self.starButtonPoor.setImage(#imageLiteral(resourceName: "fleche_pleine"), for: UIControlState.normal)
//            self.starButtonGood.setImage(#imageLiteral(resourceName: "fleche_pleine"), for: UIControlState.normal)
//            self.starButtonExcellent.setImage(#imageLiteral(resourceName: "fleche_creuse"), for: UIControlState.normal)
//        case 2:
//            self.serviceLabel.text = "Service pour 20%"
//            self.starButtonPoor.setImage(#imageLiteral(resourceName: "fleche_pleine"), for: UIControlState.normal)
//            self.starButtonGood.setImage(#imageLiteral(resourceName: "fleche_pleine"), for: UIControlState.normal)
//            self.starButtonExcellent.setImage(#imageLiteral(resourceName: "fleche_pleine"), for: UIControlState.normal)
//        default:
//            self.serviceLabel.text = "Service pour 10%"
//            self.starButtonPoor.setImage(#imageLiteral(resourceName: "fleche_pleine"), for: UIControlState.normal)
//            self.starButtonGood.setImage(#imageLiteral(resourceName: "fleche_creuse"), for: UIControlState.normal)
//            self.starButtonExcellent.setImage(#imageLiteral(resourceName: "fleche_creuse"), for: UIControlState.normal)
//        }
        self.starButtonPoor.setImage(imagePleine, for: .normal)
        self.starButtonGood.setImage(brain.serviceLevel >= 1 ? imagePleine : imageVide, for:.normal)
        self.starButtonExcellent.setImage(brain.serviceLevel >= 2 ? imagePleine : imageVide, for: .normal)
        
        if let amount = checkAmountTextField.text ,
        let formattedAmount = stringToDouble(amount){
             brain.checkAmount = formattedAmount
// extrait la valeur numerique pour faire le calcul
            print(brain.checkAmount)
            self.tipLabel.text = "\(brain.computedTip) €"
            self.serviceStringLabel.text = "\(brain.serviceLabelText)"

//            brain.checkAmount = amount
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    @IBAction func changeCurrency(_ sender: UISegmentedControl) {
        print("Devise :\(sender.selectedSegmentIndex)")
        switch sender.selectedSegmentIndex{
        case 0:
            print("Devise : €")
            tipLabel.text = "\(brain.computedTip) €"

        case 1:
            print("Devise : $")
            tipLabel.text = "\(brain.computedTip) $"
            
        default:
            print("Devise : €")
            tipLabel.text = "\(brain.computedTip) €"
        }
    
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
