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
    init(_ line: String) {
    }
  }
}
