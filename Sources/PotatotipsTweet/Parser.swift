//
//  Parser.swift
//
//  Created by ToKoRo on 2020-10-25.
//

import Foundation

public final class Parser {
  public class func parse(_ input: String) -> [Item] {
    return
      input
      .split(whereSeparator: \.isNewline)
      .filter { !$0.isEmpty }
      .map { String($0) }
      .map { Item($0) }
  }
}

// MARK: - Item

extension Parser {
  public struct Item {
    public var name: String
    public var pronunciation: String? = nil
    public var title: String? = nil
    public var category: String? = nil
    public var twitterName: String? = nil
    public var document: String? = nil

    public init(_ line: String) {
      let items =
        line
        .trimmingCharacters(in: .whitespaces)
        .split(separator: "|")
        .map { String($0) }
        .map { $0.trimmingCharacters(in: .whitespaces) }

      self.name = Self.entryFromItems(items, index: 0) ?? "ERROR"
      self.pronunciation = Self.entryFromItems(items, index: 1)
      self.title = Self.entryFromItems(items, index: 2)
      self.category = Self.entryFromItems(items, index: 3)
      self.twitterName = Self.parseTwitterName(Self.entryFromItems(items, index: 4))
      self.document = Self.parseDocumentURL(Self.entryFromItems(items, index: 5))
    }

    private static func entryFromItems(_ items: [String], index: Int) -> String? {
      guard items.count > index else {
        return nil
      }
      let result = items[index]
      guard !result.isEmpty else {
        return nil
      }
      return result
    }

    private static let regexForMarkdownLink: NSRegularExpression? = {
      try? NSRegularExpression(pattern: "\\[@?([^]]+)\\]\\(([^)]*)\\)", options: [])
    }()

    private static func parseTwitterName(_ item: String?) -> String? {
      guard let item = item, !item.isEmpty else {
        return nil
      }

      guard let regex = Self.regexForMarkdownLink else {
        return item
      }

      guard
        let result = regex.firstMatch(in: item, options: [], range: NSRange(0..<item.count))
      else {
        return item
      }

      let range = result.range(at: 1)
      let start = item.index(item.startIndex, offsetBy: range.location)
      let end = item.index(start, offsetBy: range.length)
      return String(item[start..<end])
    }

    private static func parseDocumentURL(_ item: String?) -> String? {
      guard let item = item, !item.isEmpty else {
        return nil
      }

      guard let regex = Self.regexForMarkdownLink else {
        return item
      }

      guard
        let result = regex.firstMatch(in: item, options: [], range: NSRange(0..<item.count))
      else {
        return item
      }

      let range = result.range(at: 2)
      let start = item.index(item.startIndex, offsetBy: range.location)
      let end = item.index(start, offsetBy: range.length)
      return String(item[start..<end])
    }
  }
}
