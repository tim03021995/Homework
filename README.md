# ToDo
請完成以下題目， 
請提供實作完整專案檔，架構請符合MVC，如為Android應徵者請多交付apk檔 
app首頁請分別製作按鈕，並連至以下題目： 
1. 嶔入google地圖，地圖需定位現在位置，並在最上方顯示現在座標值，介面屬自由發揮。 
2. 開啟照相功能，拍完照片後，並讓使用者選擇套用附件1相框其一後存檔 
3. 請讓App同時送出兩個Request 
(1) http://demo.kidtech.com.tw/files/appexam/appexam1.htm 
(2) http://demo.kidtech.com.tw/files/appexam/appexam2.htm 
   將接回來的Response做成列表顯示在同一個View上  
4.  請製作一個登出入的功能，並且登入後取該使用者的會員資訊顯示，介面屬自由發揮。 
登入的帳/密:ccwork/ccwork 
API網址http://webdemo.kidtech.com.tw/AppTest/swagger/ui/index相關參數內容， 
呼叫方式http://webdemo.kidtech.com.tw/AppTest/API/名稱。 
注意: 
GetToken中的Secret Key: KidTech24930722(未加密)，密碼: ufis2zWuT3Am3gEJ0LUKRso4，Key IV: APPQirFg，3DES加密模式CBC，且轉成Base64，資料使用Json傳送。成功後會取得token。 
MemberLogin(登入)，Header須帶token(使用GetToken取得)，取的token值前面請加 "Bearer "(後面有空白1格)，資料使用Json傳送。登入後會取得MemberToken。 
MemberData(取會員資料)，Header須帶MemberToken，值前面請加 "Bearer "(後面有空白1格)，資料使用Json傳送。 
