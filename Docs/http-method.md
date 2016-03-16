# HTTPMethod

The `HTTPMethod` type represents an HTTP method.

```swift
public enum HTTPMethod {
    case Delete
    case Get
    case Head
    ...
    case Raw(method: String)
}
```

### Motivation

Having HTTPMethod as an enum with a Raw case ensures flexible and accurate communication of HTTP method between projects. Without an enum, string matching issues could cause inconsistencies.