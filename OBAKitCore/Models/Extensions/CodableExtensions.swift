//
//  CodableExtensions.swift
//  OBAKit
//
//  Created by Aaron Brethorst on 5/30/19.
//

import Foundation

extension KeyedDecodingContainer {

    /// Decodes an optional URL where the underlying value may either be
    /// nil, a blank string, or a valid URL, for the given key, if present.
    ///
    /// This method returns `nil` if the container does not have a value
    /// associated with `key`, or if the value is null or garbage (e.g. a blank string). The difference between
    /// these states can be distinguished with a `contains(_:)` call.
    ///
    /// - parameter key: The key that the decoded value is associated with.
    /// - returns: A decoded value of the requested type, or `nil` if the
    ///   `Decoder` does not have an entry associated with the given key, or if
    ///   the value is a null value.
    /// - throws: `DecodingError.typeMismatch` if the encountered encoded value
    ///   is not convertible to `String`.
    func decodeGarbageURL(forKey key: Self.Key) throws -> URL? {
        var rawStr: String?
        do {
            rawStr = try decodeIfPresent(String.self, forKey: key)
        } catch let err {
            print("Error: \(err)")
            throw err
        }
        guard let urlString = String.nilifyBlankValue(rawStr) else {
            return nil
        }
        return URL(string: urlString)
    }
}
