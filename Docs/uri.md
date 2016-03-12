# URI

The `URI` type represents an URI.

```swift
public struct URI {
    public var scheme: String?
    public var userInfo: (username: String, password: String)?
    public var host: String?
    public var port: Int?
    public var path: String?
    public var query: [(key: String, value: String?)]
    public var fragment: String?
}
```

## Motivation

Having `URI` as a `struct` allows it to conform to protocols in extensions.

## References

- [RFC 3986](https://tools.ietf.org/html/rfc3986)