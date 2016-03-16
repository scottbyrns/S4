# URI

The `URI` type represents an URI.

```swift
public struct URI {
    public struct userInfo {
        public var username: String
        public var password: String
    }

    public struct Query {
        public var key: String
        public var value: String?
    }

    public var scheme: String?
    public var userInfo: userInfo?
    public var host: String?
    public var port: Int?
    public var path: String?
    public var query: [Query]
    public var fragment: String?
}
```

## Motivation

Having `URI` as a `struct` allows it to conform to protocols in extensions.

## References

- [RFC 3986](https://tools.ietf.org/html/rfc3986)