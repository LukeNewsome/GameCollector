//
//  GameViewController.swift
//  GameCollector
//
//  Created by Luke Newsome on 1/27/19.
//  Copyright © 2019 Zappy Code. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var deleteButton: UIButton!
    
    
    
    @IBOutlet weak var addUpdateButton: UIButton!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var gameImageView: UIImageView!
    
    
    var imagePicker = UIImagePickerController()
    var game : Game? = nil
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imagePicker.delegate = self
        if game != nil {
            gameImageView.image = UIImage(data: game!.image as! Data)
            titleTextField.text = game!.title
            
    addUpdateButton.setTitle("Update", for: .normal)
        } else {
            deleteButton.isHidden = true
        }

    }
        
    
    
    
    // ACTIONS ARE HERE
    
   
    @IBAction func photosTapped(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
        }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        
        gameImageView.image = image
        
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func cameraTapped(_ sender: Any) {
       
    }
    @IBAction func addTapped(_ sender: Any) {
       
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let game = Game(context: context)
        game.title = titleTextField.text
        game.image = gameImageView.image!.pngData()
    (UIApplication.shared.delegate as! AppDelegate).saveContext()
    
       navigationController!.popViewController(animated: true)
    }
    
   
    
}
