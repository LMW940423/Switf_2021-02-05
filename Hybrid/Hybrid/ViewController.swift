//
//  ViewController.swift
//  Hybrid
//
//  Created by 이민우 on 2021/02/05.
//

import UIKit
import WebKit // WebKitView를 쓰기 위함

class ViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var myActivtyIndicator: UIActivityIndicatorView!
    @IBOutlet weak var txtUrl: UITextField!
    @IBOutlet weak var myWebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myWebView.navigationDelegate = self // toolbar button들의 history를 기억하고 관리
        
        // 초기화면 : www.naver.com
        loadWebPage(url: "https://www.naver.com")
    }
    
    func loadWebPage(url : String) {
        let myUrl = URL(string: url) // url 타입으로 변경
        let myRequest = URLRequest(url: myUrl!) // Requesting
        myWebView.load(myRequest) // 화면 띄우기
    }
    
    // Indicator 시작
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        myActivtyIndicator.startAnimating() // 시작
        myActivtyIndicator.isHidden = false // 숨길지 말지
    }
    
    // Indicator 종료
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        myActivtyIndicator.stopAnimating() // 종료
        myActivtyIndicator.isHidden = true // 숨겨라
    }
    
    // Error 발생
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        myActivtyIndicator.stopAnimating()
        myActivtyIndicator.isHidden = true
    }
    
    // http를 안붙였을 경우 추가해주기
    func checkUrl(_ url : String) -> String {
        var strUrl = url
        let flag = strUrl.hasPrefix("http://") // 앞글자에 해당값이 들어있는지 확인 (return => Bool)
        let endFlag = strUrl.hasSuffix(".com")
        
        if !flag{
            strUrl = "http://" + strUrl
        }
        
        if !endFlag{
            strUrl = strUrl + ".com"
        }
        
        return strUrl
        
    }
    
    // ----------------------------------
    
    @IBAction func btnGo(_ sender: UIButton) {
        let myUrl = checkUrl(txtUrl.text!)
        txtUrl.text?.removeAll()
        loadWebPage(url: myUrl)
    }
    
    @IBAction func btnSite1(_ sender: UIButton) {
        loadWebPage(url: "https://www.google.com")
    }
    
    @IBAction func btnSite2(_ sender: UIButton) {
        loadWebPage(url: "https://www.daum.net")
    }
    
    @IBAction func btnHtml(_ sender: UIButton) {
        let htmlString = """
            <html>
            <head>
               <meta charset="utf-8">
               <meta name="viewport" content="width=device-width, initial-scale=1.0">
            </head>
            <body>
            <h1> HTML String </h1>
            <p>String 변수를 이용한 웹페이지</p>
            <p><a href=\"http://jtbc.joins.com\">JTBC</a>로 이동</p>
            </body>
            </html>
        """
        
        myWebView.loadHTMLString(htmlString, baseURL: nil)
    }
    
    @IBAction func btnFile(_ sender: UIButton) {
        // 파일 경로 찾기 => forResource : 파일 이름, ofType : 확장자
        let filePath = Bundle.main.path(forResource: "htmlView", ofType: "html")
        let myUrl = URL(fileURLWithPath: filePath!)
        let myRequest = URLRequest(url: myUrl)
        myWebView.load(myRequest)
    }
    
    @IBAction func btnStop(_ sender: UIBarButtonItem) {
        myWebView.stopLoading() // stop
    }
    
    @IBAction func btnReload(_ sender: UIBarButtonItem) {
        myWebView.reload() // 갱신
    }
    
    @IBAction func btnGoBack(_ sender: UIBarButtonItem) {
        myWebView.goBack() // 전 화면
    }
    
    @IBAction func btnGOFoward(_ sender: UIBarButtonItem) {
        myWebView.goForward() // 앞 화면
    }
}

