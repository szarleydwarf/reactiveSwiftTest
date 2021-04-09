//
//  Model.swift
//  ReactiveSwiftConquer
//
//  Created by The App Experts on 09/04/2021.
//

import Foundation
//{
//    "quoteText": "This is the final test of a gentleman: his respect for those who can be of no possible value to him. ",
//    "quoteAuthor": "William Lyon Phelps",
//    "senderName": "",
//    "senderLink": "",
//    "quoteLink": "http://forismatic.com/en/9d86f2a8a0/"
//}
struct AQuote: Decodable {
    let quoteText:String?
    let quoteAuthor :String?
}
