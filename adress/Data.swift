//
//  Data.swift
//  adress
//
//  Created by Дмитрий Абдуллаев on 16.11.2022.
//

import Foundation

struct Adrress {
    var adress: [String]
  
   static func getUserData() -> Adrress {
        Adrress(adress: ["Дресерувальний майданчик 'Голосієво'","Цимбалевська вулиця, 34", "Стрийська вулиця,11"] )
    }
}

