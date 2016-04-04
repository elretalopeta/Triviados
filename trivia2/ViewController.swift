//
//  ViewController.swift
//  trivia2
//
//  Created by usu27 on 3/11/15.
//  Copyright © 2015 usu27. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pregunta: UILabel!
    @IBOutlet weak var button01: UIButton!
    @IBOutlet weak var button02: UIButton!
    @IBOutlet weak var button03: UIButton!
    @IBOutlet weak var button04: UIButton!
    
    var respuestas: [String] = []
    var random: Int!
    var randomrespuestas: Int!
    
    var valor = 5
    var puntuacion = 0
    
    var arrayPreguntas: [preguntas] = [preguntas(enunciado: "¿En qué deporte se usa tiza?", respuestaOK: "Billar", respuestaKO1: "Tenis", respuestaKO2: "Golf", respuestaKO3: "Futbol"), preguntas(enunciado: "¿Cuántas manos tiene un caballo?", respuestaOK: "2", respuestaKO1: "3", respuestaKO2: "4", respuestaKO3: "0"), preguntas(enunciado: "¿Qué instrumento musical tiene nombre y forma geométricos?", respuestaOK: "El triángulo", respuestaKO1: "Clarinete", respuestaKO2: "Tambor", respuestaKO3: "Maracas"),preguntas(enunciado: "¿Cuáles son las dos primeras palabras de la Biblia?", respuestaOK: "Al Principio", respuestaKO1: "Habia una vez", respuestaKO2: "Amén", respuestaKO3: "Ala es grande")]
    
    @IBAction func buttonAction01(sender: UIButton) {
       solucion(sender)
       bloquear()
       tiempo()
    }

    func noColor(){
        button01.backgroundColor=UIColor.lightGrayColor()
        button02.backgroundColor=UIColor.lightGrayColor()
        button03.backgroundColor=UIColor.lightGrayColor()
        button04.backgroundColor=UIColor.lightGrayColor()
        arrayPreguntas.removeAtIndex(random)
    }
    
    func siguiente(){
        noColor()
        desbloquear()
        mostrar()
    }

    func tiempo(){
        NSTimer.scheduledTimerWithTimeInterval(1, target: self,
        selector: Selector("siguiente"), userInfo: nil, repeats: false)}
    
    func mostrar(){
        valor = valor-1
        if(valor==0){
            let vc = self.storyboard!.instantiateViewControllerWithIdentifier("winner") as!
            WinnerViewController
            vc.puntuacion = puntuacion
            let topController =
            UIApplication.sharedApplication().keyWindow!.rootViewController
            topController!.dismissViewControllerAnimated(true, completion: nil)
            topController!.presentViewController(vc, animated: true, completion: nil)
        }else{
            
            random = Int(arc4random_uniform(UInt32(valor)))
            
            respuestas.append(arrayPreguntas[random].respuestaOK)
            respuestas.append(arrayPreguntas[random].respuestaKO1)
            respuestas.append(arrayPreguntas[random].respuestaKO2)
            respuestas.append(arrayPreguntas[random].respuestaKO3)
            
            pregunta.text = arrayPreguntas[random].enunciado
            
            randomrespuestas = Int(arc4random_uniform(4)) - 0
            button01.setTitle(String(respuestas[randomrespuestas]), forState: .Normal)
            respuestas.removeAtIndex(randomrespuestas)
            
            randomrespuestas = Int(arc4random_uniform(3)) - 0
            button02.setTitle(String(respuestas[randomrespuestas]), forState: .Normal)
            respuestas.removeAtIndex(randomrespuestas)
            
            randomrespuestas = Int(arc4random_uniform(2)) - 0
            button03.setTitle(String(respuestas[randomrespuestas]), forState: .Normal)
            respuestas.removeAtIndex(randomrespuestas)
            
            randomrespuestas = Int(arc4random_uniform(1)) - 0
            button04.setTitle(String(respuestas[randomrespuestas]), forState: .Normal)
            respuestas.removeAtIndex(randomrespuestas)
            
        }
    }
    
    func bloquear(){
        button01.enabled=false
        button02.enabled=false
        button03.enabled=false
        button04.enabled=false
    }
    
    func desbloquear(){
        button01.enabled=true
        button02.enabled=true
        button03.enabled=true
        button04.enabled=true
    }
    
    func solucion(sender:UIButton){
        if(sender.titleLabel?.text ==  arrayPreguntas[random].respuestaOK){
            sender.backgroundColor = UIColor.greenColor()
            puntuacion = puntuacion + 1;
        }else{sender.backgroundColor = UIColor.redColor()}
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mostrar()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool) {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        let showTutorial = userDefaults.boolForKey("SettingsShowTutorialOnLaunch")
        if(showTutorial){
            
            let alertView: UIAlertController = UIAlertController(title: "Instrucciones", message:
                "Selecciona la respuesta correcta de cada pregunta. Cada acierto te dará 1 punto.Pasas a la siguiente pregunta al contestar la anterior, aciertes o falles.", preferredStyle: .Alert)
            let aceptar = UIAlertAction(title: "Aceptar", style: .Default, handler: nil)
            alertView.addAction(aceptar)
            self.presentViewController(alertView, animated: true, completion: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

