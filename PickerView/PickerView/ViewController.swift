//
//  ViewController.swift
//  PickerView
//
//  Created by 이민우 on 2021/02/05.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var pickerImage: UIPickerView!
    @IBOutlet weak var lblImageFileName: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    let MAX_ARRAY_NUM = 10 // 전체 이미지 개수
    let PICKER_VIEW_COLUMN = 1 // PickerVIew의 컬럼 개수
    var imageArray = [UIImage?]()
    var imageFileName = [String]()
    //선생님 방식
//    var imageFileName = ["w1.jpg", "w2.jpg", "w3.jpg", "w4.jpg", "w5.jpg", "w6.jpg", "w7.jpg", "w8.jpg", "w9.jpg", "w10.jpg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // imageFileName 준비
        for i in 0..<MAX_ARRAY_NUM{
            imageFileName.append("w\(i + 1).jpg")
        }
        
        // image 준비 : image를 배열로 생성한다.
        for i in 0..<MAX_ARRAY_NUM{
            let image = UIImage(named: imageFileName[i])
            imageArray.append(image)
        }
        
        lblImageFileName.text = imageFileName[0]
        imageView.image = imageArray[0]
    }
    
    // -----------------------------
    // UIPickerVIewDataSource의 stubs
    // -----------------------------
    
    // pickerView의 컬럼 개수
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return PICKER_VIEW_COLUMN
    }
    
    // 출력할 이미지 파일 개수 (ROW)
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return imageFileName.count
    }
    
    // -----------------------------
    // UIPickerVIewDelegate의 stubs
    // -----------------------------

    // pickerView에 파일명 배치
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return imageFileName[row]
//    }
    
    // pickerView에 파일명 대신 이미지 배치
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let letImageView = UIImageView(image: imageArray[row])
        letImageView.frame = CGRect(x: 0, y: 0, width: 50, height: 20)
        return letImageView
    }
    
    // pickerVIew로 선택된 파일명의 이미지 출력
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        lblImageFileName.text = imageFileName[row]
        imageView.image = imageArray[row]
    }


}

