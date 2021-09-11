//
//  ViewController.swift
//  Localization-Example
//
//  Created by Belal Samy on 11/09/2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var langLabel: UILabel!
    @IBOutlet weak var changeLangButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(Language.currentLanguage)
        self.showToast(message: "Belal".localized, font: .systemFont(ofSize: 25))
    }
    
    //MARK: - Functions
    
    func transition(_ options: UIView.AnimationOptions) {
        let window = (self.view.window?.windowScene?.delegate as? SceneDelegate)?.window
        let sb = UIStoryboard(name: "Main", bundle: nil)
        window?.rootViewController = sb.instantiateViewController(withIdentifier: "rootVC")
        UIView.transition(with: window!, duration: 0.5, options: options, animations: nil, completion: nil)
    }
    
    func changeToEnglish() {
        Language.setAppLanguage(lang: Lang.english) // change to English
        UIView.appearance().semanticContentAttribute = .forceLeftToRight // LTR
        transition(.transitionFlipFromLeft) // Flip from left
    }
    
    func changeToArabic() {
        Language.setAppLanguage(lang: Lang.arabic) // change to Arablic
        UIView.appearance().semanticContentAttribute = .forceRightToLeft // RTL
        transition(.transitionFlipFromRight) // Flip from right
    }
    
    //MARK: - Actions
    
    @IBAction func changeLangTapped(_ sender: Any) {
        if Language.currentLanguage == Lang.arabic.rawValue {
            changeToEnglish()
        } else {
            changeToArabic()
        }
        
    }
}




