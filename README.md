# Switf_2021-02-05

2021-02-05

PickerView => delegate, datasource

Quiz_09 => PickerVIew를 이용한 구구단

// --------------

Alert => Closure를 사용

UIAlertController.Style.alert => 중앙 배치

UIAlertController.Style.actionSheet => 하단 배치
            
UIAlertAction.style.default => 파란색

UIAlertAction.style.cancel => 파란색

UIAlertAction.style.destructive => 빨간색

// --------------

Quiz_10 Alert이용한 알람끄기 (Quiz_07로 대체)

Quiz_11 Random 함수 이용한 구구단 게임

Hybird => webkitView, ToolBar, bar button, flexible Space, button icon은  더블클릭해서 system icon 변경, progressing Bar = Activity Indicator Bar

// --------------

-netwrok연결 =>

- 1. info.plist

- 2. Information property List 

- 3. App Transport Security Settings +

- 4. Allow Arbitrary Loads => YES

-File 경로 찾기

파일 경로 찾기 => forResource : 파일 이름, ofType : 확장자

 let filePath = Bundle.main.path(forResource: "htmlView", ofType: "html")
 
- PickerView 사용 시에는 ViewController에 연결하고 delegate선택!
