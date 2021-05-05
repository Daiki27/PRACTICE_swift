# PRACTICE_swift

### Grammer

* 変数の型を表示する.
```
print(type(of: number))
```
* 関数の表記 | [ref](https://docs.swift.org/swift-book/LanguageGuide/Functions.html).
以下の3つの場合のresultは同じ値を示す. 同じ挙動をしている.  

▶︎ Argument label : 関数呼び出し時に使用する.  
> Argument label is used when calling the function; each argument is written in the function call with its argument label before it.  
 
▶︎ Parameter name : 関数定義に使用する. デフォルトでは, Parameter nameをArgument labelとして使用される.  
> Parameter name is used in the implementation of the function. By default, parameters use their parameter name as their argument label.  

Argument labelは指定しない限りParameter nameと同じ名前になる. Argument labelを指定したい場合は, 関数定義のときにParameter nameの前に記述する. 関数呼び出しのときにArgument labelを記述したくない場合は"_"を明示的に記述することで省略できる.  

```
func someFunction(height: Int, width: Int) {
    return height * width
}
result = someFunction(height: 100, width: 30)
```

```
func someFunction(height h: Int, width w: Int) {
    return h * w
}
result = someFunction(height: 100, width: 30)
```

```
func someFunction(_ height: Int, _ width: Int) {
    return height * width
}
result = someFunction(100, 30)
```
