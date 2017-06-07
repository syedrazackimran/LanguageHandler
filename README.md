# LanguageHandler

## Requirements

It's help you to change localization string easily

Step

1.Import your table.string file

Generate your file convenience you can use

Localize-String

2.Setting your string table at didFinishLaunchingWithOptions

## Theme
Theme Class nothing put i used for USerDefault Class
For Saving and Updating Language Key

## LanguageHandler

ShortKey is the Short Universal Key for Language 
e.g English is LongName == en is shortName

because for lproj file have a short key only

4.If you want to set up your string by program , your can use 

"lable.text" = ImranLocalizedString(key: "Lngkey", comment: "")
"Lngkey" is we used in Localizable

## RootBaseViewController

That Controller contain NotificationCenter.addObserver  ,
we need to inheriate Rootbase to All viewcontroller because of. if we update or change language it should have to affect all viewcontroller for that mean if we inheriate rootbase to all viewcontroller the change reflected automatically all viewcontroller

## Usage
* No Need to Reload View Controller to Update changed Language
* Its change by Run Time
* No Need Start from Root to update language



## Author

Imran, Syedrazackimran@gmail.com

## License

LanguageHandler is available under the MIT license. See the LICENSE file for more info.



