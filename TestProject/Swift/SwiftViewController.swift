//
//  SwiftViewController.swift
//  TestProject
//
//  Created by BDKid on 2020/8/25.
//  Copyright © 2020 BDKid. All rights reserved.
//

import UIKit

class SwiftViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .yellow
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        /*
         var characterArray: [Character] = ["a", "b", "c", "d", "e", ]
         swap(array: &characterArray, p: 0, q: 1)
         print(numArray)
         */
        /*
         var numArray = [1, 2, 3, 4, 5]
         swap(array: &numArray, p: 2, q: 3)
         print(numArray)
         */
        /*
         toZero(x: 10)
         */
        
        //        var names = ["a", "d", "c", "b", "e", ]
        //        for i in 0 ... names.count - 1 {
        //            print(i)
        //        }
        /*
         let result = names.sorted()
         print(result)
         */
        
        //        let index = strStr(haystack: "ABCDEFGHIJK", "AB");
        /*
         let sa = "ABCDEFGHIJK".subStringFrom(inIndex: 4)
         print(sa)
         let sa2 = "ABCDEFGHIJK".subStringTo(inIndex: 4)
         print(sa2)
         */
        
        
        /**
         let sortedModel = tempArray.sorted{(s1, s2) -> Bool in
         return s1 < s2
         }
         print(sortedModel)
         */
        
//        testArray()
        var cArray = ContiguousArray(repeating: 2, count: 3)
        print(cArray.count)
        print(cArray.capacity)
        
        cArray.append(4)
        print(cArray.count)
        print(cArray.capacity)

        cArray.removeAll()
        cArray.reserveCapacity(14)
        print(cArray.count)        // 0
        print(cArray.capacity)     // 0

    }
    func testString() {
        let qutoedString = "如果句子里面有\"双引号\"就很尴尬"
        let escapeString = "如果句子里面有\\转义符号反斜杆\\也很尴尬"
        
        //        print(qutoedString)
        //        print(escapeString)
        
        let newQutoedString = #"如果句子里面有"双引号"就很尴尬"#
        let newEscapeString = #"如果句子里面有\转义符号反斜杆\也很尴尬"#
        
        //        print(newQutoedString)
        //        print(newEscapeString)
        
        let escapeCharacter = #"\"#
        let newParamString =  #"如果句子里面有\#(escapeCharacter)转义符号反斜杆\#(escapeCharacter)也很尴尬"#
        //        print(escapeCharacter)
        print(newParamString)
        let multiLineText = #"""
                   "\"
                一切正常
                """#
        //        print(multiLineText)
        let escapeHashCharacter = ##"如果刚好有个字符 "# 呵呵和结束符意义就尴尬了"##
        print(escapeHashCharacter)
    }
    func testArray() {
        let tempContiguousArray: ContiguousArray = ["A", "B", "C", "D"]
        let tempArraySlice: ArraySlice = ["A", "B", "C", "D"]
        var tempArray: Array = ["A", "B", "C", "D"]
        tempArray.sort { (A, B) -> Bool in
            return A < B
        }
        print(tempArray)
    }
    func strStr(haystack: String, _ needle: String) -> Int {
        
        guard haystack.count != 0 && haystack.count > needle.count else{
            return -1
        }
        
        for i in 0...haystack.count - needle.count {
            guard haystack.subscripta(i: i) == needle.subscripta(i: 0) else {
                continue
            }
            for j in 0..<needle.count{
                guard haystack.subscripta(i: i + j) == needle.subscripta(i: j) else {
                    break
                }
                if j == needle.count - 1 {
                    return i
                }
            }
        }
        return -1
    }
    
    func toZero(x: Int) -> Int {
        var x = x
        while x > 0 {
            x -= 1
            print(x)
        }
        return x
    }
    
    //范型
    func swap<T>( array: inout [T], p: Int, q: Int) {
        let temp = array[p]
        array[p] = array[q]
        array[q] = temp
    }
    
    func swap1( chars: inout [Character], p: Int, q: Int) {
        let temp = chars[p]
        chars[p] = chars[q]
        chars[q] = temp
    }
}

extension String {
    
    func subscripta(i: Int) -> Character {
        return self[index(startIndex, offsetBy: i)]
    }
    
    func subStringFrom(inIndex: Int) -> String {
        
        let tempString: String = self
        let temIndex = tempString.index(tempString.startIndex, offsetBy: inIndex)
        return String(tempString[temIndex...])
    }
    
    func subStringTo(inIndex: Int) -> String {
        
        let tempString: String = self
        let temIndex = tempString.index(tempString.startIndex, offsetBy: inIndex)
        return String(tempString[...temIndex])
    }
    
}
