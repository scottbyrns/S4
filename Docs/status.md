# Status

The `Status` type represents an HTTP status.

```swift
public enum Status {
    case OK
    case Created
    case Accepted
    ...
    case Raw(statusCode: Int, reasonPhrase: String)
}
```

## Motivation

Having `Status` as an enum with a `Raw` case ensures flexible and accurate communication of HTTP status between projects. Without an enum, string matching issues could cause inconsistencies.
