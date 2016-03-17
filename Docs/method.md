# Method

The `Method` type represents an HTTP method.

```swift
public enum Method {
    case Delete
    case Get
    case Head
    ...
    case Raw(method: String)
}
```

### Motivation

Having `Method` as an enum with a Raw case ensures flexible and accurate communication of HTTP method between projects. Without an enum, string matching issues could cause inconsistencies.