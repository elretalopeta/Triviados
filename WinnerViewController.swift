//
//  WinnerViewController.swift
//  trivia2
//
//  Created by usu27 on 10/11/15.
//  Copyright © 2015 usu27. All rights reserved.
//

import UIKit

class WinnerViewController: UIViewController {
    var puntuacion: Int=0
    
    @IBOutlet weak var verPuntuacion: UILabel!
        override func viewDidLoad() {
        super.viewDidLoad()
            verPuntuacion.text = "La puntuacion es de: "+String(puntuacion)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
