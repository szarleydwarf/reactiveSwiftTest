//
//  Maths.swift
//  ReactiveSwiftConquer
//
//  Created by The App Experts on 13/04/2021.
//

import Foundation

class Maths {
    func calculate (from str: String) -> String {
        var toReturn:String = ""
        // example 6*(8/2)+2+10
        if str.count == 0 {
            return "Nothing to calculate!"
        }
        let equasion = str.filter("0123456789+-/*()".contains)
        var stack:[Int] = []
        var num = 0
        for c in equasion {
            if c.isNumber {
                num = num * 10 + Int(String(c))!
            } else if c == "(" {
                print("bracket")
            } else {
                print("SIGN")
            }
        }
        print(" >> \(stack)")
        // check if number
        // check if symbol
        // check if bracket open close
        
        return toReturn
    }
}
