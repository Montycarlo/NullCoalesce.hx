
## NullCoalesce.hx
Null Coalescing operator `||~` for Haxe.  

The Null-Coalescing operator is a relatively recent addition to multiple languages, including PHP<sup>[[1][1]]</sup> and C#<sup>[[2][2]]</sup>, which I thought was a handy addition. 

In non-null safe languages and contexts, it is almost certain your code is littered with checks like `var param = someSource.y != null ? someSource.y : "default"` while parsing parameters, options or manually deserializing data. It would make everyone's day just a little bit better if we didn't have to write those same tiresome checks out again and again for the same behaviour.

#### Solution 
The Null Coalescing operator `A ||~ B` is a binary operator that simply transforms it's two operands `A` and `B` into the following form; `A != null ? A : B`. 

Why didn't I use two question marks as the operator like in PHP and C#?  
Good question - I wanted to but as far as I know you can't create new operators in haxe that break current syntax rules, ergo you can't construct an operator out of simple macro transformations that doesn't already exist. No introducing new symbols. Code must be syntactically correct to produce the AST, then you can transform it with a build macro. Haxe doesn't have a unary operator for question marks (?) so we can't easily construct the normal null coalesce operator(`??`) out of two in direct sequence.

#### Usage
1. Include the library. `-lib NullCoalesce`
2. Add the `@:nullcoalesce` metadata to any class declaration that you wish to use the operator in.  
3. Use the Operator as follows;
```haxe
  var x = y ||~ z;
```
Which will translate to;
```haxe
  var x = y != null ? y : z;
```

[1]: https://wiki.php.net/rfc/isset_ternary
[2]: https://docs.microsoft.com/en-us/dotnet/csharp/language-reference/operators/null-conditional-operator
