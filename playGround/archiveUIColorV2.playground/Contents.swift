/*
 UIColor -> Encode -> Data -> save -> Get Any -> Data -> Decode -> Any -> UIColor
 
 */

import UIKit

var str = "Hello, playground"

let defaults = UserDefaults.standard

//保存したい色.
let myColor = UIColor.red

//保存したい色をエンコードする.
//もしかしたら返り値がnilの可能性もあるから,オプショナル型で受け取る. 欲しいのはData型になる.
let myColor_Encoded = try? NSKeyedArchiver.archivedData(withRootObject: myColor, requiringSecureCoding: false)

//エンコードした色をUserDefaultsに書き込む.
defaults.set(myColor_Encoded, forKey: "myColor")

//UserDefaultsからkey値を元に保存した色を取り出し(Any型になる), Date方にキャストする.
//オプショナル型で受け取りたいからas?にしている.
let myColor_saved = defaults.object(forKey: "myColor") as? Data

let myColor_Decoded: UIColor?
if let setColor = myColor_saved{
    myColor_Decoded = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(setColor) as? UIColor
}else{
    myColor_Decoded = nil
    print("Error")
}

let viewColor:UIColor
if let viewColor = myColor_Decoded{
    print(viewColor)
    print(myColor)
}else{
    print("Error")
}


print(type(of: myColor_Encoded))
print(type(of: myColor_Decoded))

