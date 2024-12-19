/// A function which takes no values and returns a value of type T
///
/// It "supplies" a value from no input
typedef Supplier<T> = T Function();

/// A function which takes one argument of type T and returns nothing
///
/// It "consumes" a value and returns nothing
typedef Consumer<T> = void Function(T);

/// A function which takes one argument of type T and returns a boolean
typedef Predicate<T> = bool Function(T);

class FunctionUtils {
    static T identity<T>(final T value) => value;
}

