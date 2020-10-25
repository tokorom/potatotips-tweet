import Foundation
import PotatotipsTweet

let standardInput = FileHandle.standardInput
let data = standardInput.availableData
let input = String(data: data, encoding: .utf8) ?? ""

let items = Parser.parse(input)

print(items)
