//
//  ViewController.swift
//  Quiz_11
//
//  Created by 이민우 on 2021/02/05.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate{

    @IBOutlet weak var lblNum1: UILabel!
    @IBOutlet weak var lblNum2: UILabel!
    @IBOutlet weak var txtAnswer: UITextField!
    
    var num1 = 0
    var num2 = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 초기값 설정
        lblNum1.text = "\(getNum().0)"
        lblNum2.text = "\(getNum().1)"
    }

    @IBAction func btnResult(_ sender: UIButton) {
        let _ = textFieldShouldReturn(txtAnswer)
    }
    
    // enter쳤을 때도 실행
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        showAlert(bool : outputResult())
        return true
    }
    
    // 결과 출력 함수
    func outputResult() -> Bool{
        let inputNum = Int(txtAnswer.text!)
        
        num1 = Int(lblNum1.text!)!
        num2 = Int(lblNum2.text!)!
        
        if num2 * num1 == inputNum{
            return true
        }else{
            return false
        }
        
    }
    
    // Alert 생성 함수
    func showAlert(bool : Bool){
        
        if bool{ // 정답일 때
            let alertController = UIAlertController(title: "결과!", message: "정답입니다!", preferredStyle: UIAlertController.Style.alert)
            let alertAction = UIAlertAction(title: "다음문제!", style: UIAlertAction.Style.default, handler: { [self]ACTION in
                
                // 새로운 값 부여
                lblNum1.text = "\(getNum().0)"
                lblNum2.text = "\(getNum().1)"
                
                // 입력칸 초기화
                txtAnswer.text = ""
            })
            
            alertController.addAction(alertAction)
            present(alertController, animated: true, completion: nil)
        }else{ // 오답일 때
            let alertController = UIAlertController(title: "결과!", message: "오답입니다!", preferredStyle: UIAlertController.Style.alert)
            let alertAction = UIAlertAction(title: "다시풀기!", style: UIAlertAction.Style.default, handler: { [self]ACTION in
                // 입력칸 초기화
                txtAnswer.text = ""
            })
            
            alertController.addAction(alertAction)
            present(alertController, animated: true, completion: nil)
        }
    }
    
    // 랜덤값 생성 함수
    func getNum() -> (String, String){
        return (String(Int.random(in: 2...9)), String(Int.random(in: 1...9)))
    }
   
}

