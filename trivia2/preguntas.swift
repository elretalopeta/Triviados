//
//  preguntas.swift
//  trivia2
//
//  Created by usu27 on 3/11/15.
//  Copyright © 2015 usu27. All rights reserved.
//

import UIKit

class preguntas: NSObject {
    
    var enunciado = ""
    var respuestaOK = ""
    var respuestaKO1 = ""
    var respuestaKO2 = ""
    var respuestaKO3 = ""
    
    init(enunciado: String, respuestaOK: String, respuestaKO1: String, respuestaKO2: String,respuestaKO3: String){
        
        self.enunciado = enunciado;
        self.respuestaOK = respuestaOK;
        self.respuestaKO1 = respuestaKO1;
        self.respuestaKO2 = respuestaKO2;
        self.respuestaKO3 = respuestaKO3;
        
    }
    
    
    
    
}
