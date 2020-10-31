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
      | やっさん |||||
      | Roid Kanazawa | カナザワ　ロイド| Flutterアプリ開発高速化Tips(コーディング編)| Android | ||
      | yutatokoro | ところ | GitHub ActionsでiOSビルドするActionを作って得たノウハウ | iOS | [@yutatokoro](https://twitter.com/yutatokoro) | [speaker deck](https://speakerdeck.com/yutatokoro/github-actionsdeiosbirudosuruactionwozuo-tutede-tafalseuhau) |
      | しょじょじ | しょじょじ | WhiteSource Bolt for GitHubでShift LeftなAndroid開発を | Android | @shuhei_dev  | |
      | superboy | スーパーボーイ | Mixpanelのすゝめ | iOS | [@superboy](https://twitter.com/superboy) | |
      """

    let items = Parser.parse(sample)

    XCTAssertEqual(items.count, 13)

    guard items.count >= 13 else {
      return
    }

    let item0 = items[0]
    let item1 = items[1]
    let item2 = items[2]
    let item3 = items[3]
    let item4 = items[4]
    let item5 = items[5]
    let item6 = items[6]
    let item7 = items[7]
    let item8 = items[8]
    let item9 = items[9]
    let item10 = items[10]
    let item11 = items[11]
    let item12 = items[12]

    XCTAssertEqual(
      item0,
      "つぎは @hogehoge (hogehoge) さんで「ライブラリを作って5年たったので振り返る」 (iOS) #potatotips "
    )
    XCTAssertEqual(
      item1,
      "つぎは @derahashi (はし) さんで「Flutter Add To ANDPAD App」 (Android) #potatotips https://speakerdeck.com/hashi/flutter-add-to-andpad-app"
    )
    XCTAssertEqual(
      item2,
      "つぎは @_momo (モモ) さんで「UIKitやSwiftUIで表現や動きが特徴的なUI実装事例を考察する」 (iOS) #potatotips https://www.slideshare.net/momo/uikitswiftuiui"
    )
    XCTAssertEqual(
      item3,
      "つぎは @kita_ro (kitaro) さんで「Gradle Plugin for Multi Module」 (Android) #potatotips https://speakerdeck.com/kitaro/gradle-plugin-for-multi-module"
    )
    XCTAssertEqual(
      item4,
      "つぎは @tamapppe (タマゴロウ) さんで「商業雑誌に技術記事を寄稿した振り返り」 (iOS) #potatotips https://speakerdeck.com/tamappe/shang-ye-za-zhi-niji-shu-ji-shi-woji-gao-sitazhen-rifan-ri"
    )
    XCTAssertEqual(
      item5,
      "つぎは @aroha (アロハ) さんで「Android Studio 4.1推しポイント！」 (Android) #potatotips https://speakerdeck.com/aroha/android-studio-4-dot-1tui-sipointo"
    )
    XCTAssertEqual(
      item6,
      "つぎは 417_88ab ((ご欠席）) さんで「(ご欠席）」 (iOS) #potatotips "
    )
    XCTAssertEqual(
      item7,
      "つぎは @t_ss (エスエス) さんで「TwilioのVideoCapturerをカスタムした時に困った話」 (Android) #potatotips "
    )
    XCTAssertEqual(
      item8,
      "つぎは やっさん さんで「」 () #potatotips "
    )
    XCTAssertEqual(
      item9,
      "つぎは Roid Kanazawa (カナザワ　ロイド) さんで「Flutterアプリ開発高速化Tips(コーディング編)」 (Android) #potatotips "
    )
    XCTAssertEqual(
      item10,
      "つぎは @yutatokoro (ところ) さんで「GitHub ActionsでiOSビルドするActionを作って得たノウハウ」 (iOS) #potatotips https://speakerdeck.com/yutatokoro/github-actionsdeiosbirudosuruactionwozuo-tutede-tafalseuhau"
    )
    XCTAssertEqual(
      item11,
      "つぎは @shuhei_dev (しょじょじ) さんで「WhiteSource Bolt for GitHubでShift LeftなAndroid開発を」 (Android) #potatotips "
    )
    XCTAssertEqual(
      item12,
      "つぎは @superboy (スーパーボーイ) さんで「Mixpanelのすゝめ」 (iOS) #potatotips "
    )
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

  func testItem3() throws {
    let line =
      " | _momo | モモ | UIKitやSwiftUIで表現や動きが特徴的なUI実装事例を考察する | iOS | [@_momo](https://twitter.com/_momo) | [資料URL](https://www.slideshare.net/momo/uikitswiftuiui) | "
    let item = Parser.Item(line)

    XCTAssertEqual(item.name, "_momo")
    XCTAssertEqual(item.pronunciation, "モモ")
    XCTAssertEqual(item.title, "UIKitやSwiftUIで表現や動きが特徴的なUI実装事例を考察する")
    XCTAssertEqual(item.category, "iOS")
    XCTAssertEqual(item.twitterName, "_momo")
    XCTAssertEqual(item.document, "https://www.slideshare.net/momo/uikitswiftuiui")
  }

  func testItem4() throws {
    let line =
      "| aroha dayo |アロハ ダヨ| Android Studio 4.1推しポイント！ | Android |[@aroha](https://twitter.com/aroha)| https://speakerdeck.com/aroha/android-studio-4-dot-1tui-sipointo |"
    let item = Parser.Item(line)

    XCTAssertEqual(item.name, "aroha dayo")
    XCTAssertEqual(item.pronunciation, "アロハ ダヨ")
    XCTAssertEqual(item.title, "Android Studio 4.1推しポイント！")
    XCTAssertEqual(item.category, "Android")
    XCTAssertEqual(item.twitterName, "aroha")
    XCTAssertEqual(
      item.document, "https://speakerdeck.com/aroha/android-studio-4-dot-1tui-sipointo"
    )
  }

  func testItem5() throws {
    let line =
      "| 417_88ab | (ご欠席） |(ご欠席） | | ||"
    let item = Parser.Item(line)

    XCTAssertEqual(item.name, "417_88ab")
    XCTAssertEqual(item.pronunciation, "(ご欠席）")
    XCTAssertEqual(item.title, "(ご欠席）")
    XCTAssertEqual(item.category, nil)
    XCTAssertEqual(item.twitterName, nil)
    XCTAssertEqual(item.document, nil)
  }

  func testEmpty() throws {
    let line = ""
    let item = Parser.Item(line)

    XCTAssertEqual(item.name, "ERROR")
    XCTAssertEqual(item.pronunciation, nil)
    XCTAssertEqual(item.title, nil)
    XCTAssertEqual(item.category, nil)
    XCTAssertEqual(item.twitterName, nil)
    XCTAssertEqual(item.document, nil)
  }

  func testEmptyTable() throws {
    let line = "|||||||"
    let item = Parser.Item(line)

    XCTAssertEqual(item.name, "ERROR")
    XCTAssertEqual(item.pronunciation, nil)
    XCTAssertEqual(item.title, nil)
    XCTAssertEqual(item.category, nil)
    XCTAssertEqual(item.twitterName, nil)
    XCTAssertEqual(item.document, nil)
  }
}
