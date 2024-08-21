//
//  Author.swift
//  CodeTest
//
//  Created by Thazin Nwe on 20/08/2024.
//

import Foundation

struct ResultData: Codable{
    var authors :[Author]
}


struct Author: Codable {
    var id : String
    var author : String
    var width : Double
    var height : Double
    var url : String
    var download_url : String
}
