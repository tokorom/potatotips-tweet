import PotatotipsTweet
import XCTest

final class PotatotipsTweetTests: XCTestCase {
  func testSample() throws {
    let sample = """
      | daisuke0131（主催者枠） | daisuke0131 | ライブラリを作って5年たったので振り返る | iOS | [@daisuke0131](https://twitter.com/daisuke0131) | |
      | kotaro.kudo（主催者枠） | くどう | Flutter Add To ANDPAD App | Android | derakudo | [speaker deck](https://speakerdeck.com/kudou/flutter-add-to-andpad-app) |
      | fumiyasac | さかい | UIKitやSwiftUIで表現や動きが特徴的なUI実装事例を考察する | iOS | [@fumiyasac](https://twitter.com/fumiyasac) | [資料URL](https://www.slideshare.net/fumiyasakai37/uikitswiftuiui) |
      | kuu | kuu | Gradle Plugin for Multi Module | Android | [@fumiya_kume](https://twitter.com/fumiya_kume) | [slide](https://speakerdeck.com/fumiyakume/gradle-plugin-for-multi-module) |
      | Tamappe | たまっぺ | 商業雑誌に技術記事を寄稿した振り返り | iOS | [@tamapppe](https://twitter.com/tamapppe) | [speaker deck](https://speakerdeck.com/tamappe/shang-ye-za-zhi-niji-shu-ji-shi-woji-gao-sitazhen-rifan-ri) |
      | androhi |アンドロヒ| Android Studio 4.1推しポイント！ | Android |[@androhi](https://twitter.com/androhi)| https://speakerdeck.com/androhi/android-studio-4-dot-1tui-sipointo |
      | 417_72ki | (ご欠席） |(ご欠席） | iOS | | |
      | SSK | エスエスケー | TwilioのVideoCapturerをカスタムした時に困った話 | Android | [@t_ssksan](https://twitter.com/t_ssksan) | |
      | たなたつ | たなたつ | iOS 14からのアプリ内課金実装 | iOS | [@tanakasan2525](https://twitter.com/tanakasan2525) | [speaker deck](https://speakerdeck.com/tattn/ios-14karafalseapurinei-ke-jin) |
      | Kenichi Kambara | カンバラ　ケンイチ| Flutterアプリ開発高速化Tips(コーディング編)| Android | [@korodroid](https://twitter.com/korodroid)| |
      | yukiarrr | あらいかわ | GitHub ActionsでiOSビルドするActionを作って得たノウハウ | iOS | [@yukiarrr](https://twitter.com/yukiarrr) | [speaker deck](https://speakerdeck.com/yukiarrr/github-actionsdeiosbirudosuruactionwozuo-tutede-tafalseuhau) |
      | なかしょ | なかしょ | WhiteSource Bolt for GitHubでShift LeftなAndroid開発を | Android | @nakasho_dev  | |
      | aboy | あぼわい | Mixpanelのすゝめ | iOS | [@suxisuxido](https://twitter.com/suxisuxido) | |
      """

    let items = Parser.parse(sample)

    XCTAssertEqual(items.count, 13)
  }
}
