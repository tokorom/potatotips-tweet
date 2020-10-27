import PotatotipsTweet
import XCTest

final class PotatotipsTweetTests: XCTestCase {
  func testCount() throws {
    let sample = """
      | hogehoge（主催者枠） | hogehoge | ライブラリを作って5年たったので振り返る | iOS | [@hogehoge](https://twitter.com/hogehoge) | |
      | kotaro.hashi（主催者枠） | はし | Flutter Add To ANDPAD App | Android | derahashi | [speaker deck](https://speakerdeck.com/hashi/flutter-add-to-andpad-app) |
      | _momo | モモ | UIKitやSwiftUIで表現や動きが特徴的なUI実装事例を考察する | iOS | [@_momo](https://twitter.com/_momo) | [資料URL](https://www.slideshare.net/momo/uikitswiftuiui) |
      | kitaro | kitaro | Gradle Plugin for Multi Module | Android | [@kita_ro](https://twitter.com/kita_ro) | [slide](https://speakerdeck.com/kitaro/gradle-plugin-for-multi-module) |
      | Tamappe | タマゴロウ | 商業雑誌に技術記事を寄稿した振り返り | iOS | [@tamapppe](https://twitter.com/tamapppe) | [speaker deck](https://speakerdeck.com/tamappe/shang-ye-za-zhi-niji-shu-ji-shi-woji-gao-sitazhen-rifan-ri) |
      | aroha |アロハ| Android Studio 4.1推しポイント！ | Android |[@aroha](https://twitter.com/aroha)| https://speakerdeck.com/aroha/android-studio-4-dot-1tui-sipointo |
      | 417_88ab | (ご欠席） |(ご欠席） | iOS | | |
      | SS|エスエス | TwilioのVideoCapturerをカスタムした時に困った話 | Android | [@t_ss](https://twitter.com/t_ss) | |
      | やっさん | やっさん | iOS 14からのアプリ内課金実装 | iOS | [@yassan](https://twitter.com/yassan) | [speaker deck](https://speakerdeck.com/yassan/ios-14karafalseapurinei-ke-jin) |
      | Roid Kanazawa | カナザワ　ロイド| Flutterアプリ開発高速化Tips(コーディング編)| Android | [@roidroid](https://twitter.com/roidroid)| |
      | yutatokoro | ところ | GitHub ActionsでiOSビルドするActionを作って得たノウハウ | iOS | [@yutatokoro](https://twitter.com/yutatokoro) | [speaker deck](https://speakerdeck.com/yutatokoro/github-actionsdeiosbirudosuruactionwozuo-tutede-tafalseuhau) |
      | しょじょじ | しょじょじ | WhiteSource Bolt for GitHubでShift LeftなAndroid開発を | Android | @shuhei_dev  | |
      | superboy | スーパーボーイ | Mixpanelのすゝめ | iOS | [@superboy](https://twitter.com/superboy) | |
      """

    let items = Parser.parse(sample)

    XCTAssertEqual(items.count, 13)
  }

  func testItem1() throws {
    let line =
      "| hogehoge（主催者枠） | hogehoge | ライブラリを作って5年たったので振り返る | iOS | [@hogehoge](https://twitter.com/hogehoge) | |"
    let item = Parser.Item(line)

    XCTAssertEqual(item.name, "hogehoge（主催者枠）")
    XCTAssertEqual(item.pronunciation, "hogehoge")
    XCTAssertEqual(item.title, "ライブラリを作って5年たったので振り返る")
    XCTAssertEqual(item.category, "iOS")
    XCTAssertEqual(item.twitterName, "hogehoge")
    XCTAssertEqual(item.document, nil)
  }

  func testItem2() throws {
    let line =
      "| kotaro.hashi （主催者枠） | はし | Flutter Add To ANDPAD App | Android | derahashi | [speaker deck](https://speakerdeck.com/hashi/flutter-add-to-andpad-app) |"
    let item = Parser.Item(line)

    XCTAssertEqual(item.name, "kotaro.hashi （主催者枠）")
    XCTAssertEqual(item.pronunciation, "はし")
    XCTAssertEqual(item.title, "Flutter Add To ANDPAD App")
    XCTAssertEqual(item.category, "Android")
    XCTAssertEqual(item.twitterName, "derahashi")
    XCTAssertEqual(item.document, "https://speakerdeck.com/hashi/flutter-add-to-andpad-app")
  }
}
