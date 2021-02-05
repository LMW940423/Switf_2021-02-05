//
//  ViewController.swift
//  Alert
//
//  Created by 이민우 on 2021/02/05.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    let imgOn = UIImage(named: "lamp_on.png")
    let imgOff = UIImage(named: "lamp_off.png")
    let imgRemove = UIImage(named: "lamp_remove.png")
    var isLampOn = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = imgOn
    }

    // 램프 켜기
    @IBAction func btnLampOn(_ sender: Any) {
        if isLampOn{
            let lampOnAlert = UIAlertController(title: "경고!", message: "현재 On상태입니다.", preferredStyle: UIAlertController.Style.alert)
            let onAction = UIAlertAction(title: "네, 알겠습니다.", style: UIAlertAction.Style.destructive, handler: nil)
            
            // UIAlertController.Style.alert => 중앙 배치
            // UIAlertController.Style.actionSheet => 하단 배치
            
            // UIAlertAction.style.default => 파란색
            // UIAlertAction.style.cancel => 파란색
            // UIAlertAction.style.destructive => 빨간색
            
            // Action은 여러개를 붙일 수 있다!
            lampOnAlert.addAction(onAction)
            present(lampOnAlert, animated: true, completion: nil) // alert실행
        }else{
            imageView.image = imgOn
            isLampOn = true
        }
    }
    // 램프 끄기
    @IBAction func btnLampOff(_ sender: Any) {
        if isLampOn{
            let lampOffAlert = UIAlertController(title: "램프 끄기", message: "램프를 정말 끄시겠습니까?", preferredStyle: UIAlertController.Style.alert)
            
            // Closure를 이용한 실행
            let offAction = UIAlertAction(title: "네", style: UIAlertAction.Style.default, handler: { [self]ACTION in
                imageView.image = imgOff
                isLampOn = false
            })
            let cancelAction = UIAlertAction(title: "아니오", style: UIAlertAction.Style.cancel, handler: nil)
            
            lampOffAlert.addAction(offAction)
            lampOffAlert.addAction(cancelAction)
            present(lampOffAlert, animated: true, completion: nil)
        }else{
            let lampOffAlert = UIAlertController(title: "경고!", message: "현재 Off상태입니다.", preferredStyle: UIAlertController.Style.alert)
            let offAction = UIAlertAction(title: "네, 알겠습니다.", style: UIAlertAction.Style.default, handler: nil)
            
            lampOffAlert.addAction(offAction)
            present(lampOffAlert, animated: true, completion: nil)
        }
    }
    // 램프 제거
    @IBAction func btnLampRemove(_ sender: Any) {
        let lampRemove = UIAlertController(title: "램프 제거?", message: "램프를 제거할까요?", preferredStyle: UIAlertController.Style.alert)
        let lampOnAction = UIAlertAction(title: "아니오, 켭니다!", style: UIAlertAction.Style.default, handler: btnLampOn(_:))
        let lampOffAction = UIAlertAction(title: "아니오, 끕니다!", style: UIAlertAction.Style.default, handler: btnLampOff(_:))
        let lampRemoveAction = UIAlertAction(title: "네, 제거합니다!", style: UIAlertAction.Style.default, handler: { [self]ACTION in
            imageView.image = imgRemove
        })
        
        lampRemove.addAction(lampOnAction)
        lampRemove.addAction(lampOffAction)
        lampRemove.addAction(lampRemoveAction)
        present(lampRemove, animated: true, completion: nil)
    }
}

