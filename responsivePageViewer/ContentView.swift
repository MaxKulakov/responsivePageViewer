//
//  Created by Max Kulakov on 20.11.2021.
//

import SwiftUI

//func getOSInfo()->String {
//    let os = ProcessInfo().operatingSystemVersion
//    return String(os.majorVersion) + "." + String(os.minorVersion) + "." + String(os.patchVersion)
//}
//
//extension UIDevice {
//    var modelName: String {
//        var systemInfo = utsname()
//        uname(&systemInfo)
//        let machineMirror = Mirror(reflecting: systemInfo.machine)
//        let identifier = machineMirror.children.reduce("") { identifier, element in
//            guard let value = element.value as? Int8, value != 0 else { return identifier }
//            return identifier + String(UnicodeScalar(UInt8(value)))
//        }
//        return identifier
//    }
//}

func verifyUrl (urlString: String?) -> Bool {
    if let urlString = urlString {
        if let url = NSURL(string: urlString) {
            return UIApplication.shared.canOpenURL(url as URL)
        }
    }
    return false
}

struct ContentView: View {
    @Environment(\.openURL) var openURL
    @State private var linkname: String = ""
    
    var body: some View {
        VStack{
            Text("YKS. Проверка сайтов")
                .font(.title)
                .padding()
            HStack{
                TextField("Введите ссылку на сайт", text: $linkname)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                Button("Перейти") {
                    if (verifyUrl(urlString: linkname)){
                        openURL(URL(string: linkname)!)}
//                    else {
//                        var newlinkname = "https://google.com/search?q=%@" + linkname
//                        openURL(URL(string: newlinkname)!)}
                    }
                
            }.padding()
            Button("...или просто откройте браузер") {
                    openURL(URL(string: "https://google.com")!)}
            
            Spacer()
            Spacer()
            Spacer()
            Text("Шаблоны ссылок")
                .font(.title)
                .padding()
            
            List {
                Button("ГК Основа") {
                        openURL(URL(string: "https://gk-osnova.ru")!)}
                Button("Very") {
                        openURL(URL(string: "https://very-botsad.ru/")!)}
                Button("UNO.СТАРОКОПТЕВСКИЙ") {
                        openURL(URL(string: "https://uno.moscow/starokoptevskij/")!)}
                Button("RED 7") {
                        openURL(URL(string: "https://red-7.ru/")!)}
                Button("MAINSTREET") {
                        openURL(URL(string: "https://zk-mainstreet.ru/")!)}
                Button("ГОГОЛЬ ПАРК") {
                        openURL(URL(string: "https://gogolpark.ru/")!)}
                Button("ЗОЛОТЫЕ ВОРОТА") {
                        openURL(URL(string: "https://zolotievorota2019.ru/")!)}
                Button("ПАРАД ПЛАНЕТ") {
                        openURL(URL(string: "https://zk-paradplanet.ru/")!)}
                Button("PUERTA DE LOS CRISTIANOS") {
                        openURL(URL(string: "https://plc-tenerife.ru/")!)}
                Button("RESIDENCE VALENTINKA") {
                        openURL(URL(string: "https://valentinka-praga5.ru/")!)}
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
