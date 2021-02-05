//
//  ViewController.swift
//  Quiz_09
//
//  Created by 이민우 on 2021/02/05.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
   
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var textView: UITextView!
    
    let MAX_ARRAY_NUM = 8 // 전체 구구단 출력 개수 (2~9단이므로 8개)
    let PICKER_VIEW_COLUMN = 1 // PickerVIew의 컬럼 개수
    
    var danArray = [Int](2...9)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 초기값 세팅
        lblTitle.text = "\(danArray[0])단"
        textView.text = "\(gugudan(num: 0))"

    }

    // DataSource의 stubs
    
    // pickerView의 col 설정
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return PICKER_VIEW_COLUMN
    }
    
    // pickerView의 row 설정
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return MAX_ARRAY_NUM
    }
    
    // Delegate의 stubs
    
    // pickerView에 dan 출력
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let strDan = "\(danArray[row])단"
        return strDan
    }
    
    // textView에 결과 출력
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        lblTitle.text = "\(danArray[row])단"
        textView.text = gugudan(num : row)
    }

    // 구구단 계산 함수
    func gugudan(num : Int) -> String{
        var strResult = ""
        for i in 1...9{
            strResult += "\(danArray[num]) * \(i) = \(String(format : "%2d", danArray[num] * i))\n"
        }
        return strResult
    }
}

