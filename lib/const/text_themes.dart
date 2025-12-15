enum TextStyle {
    defaultText(textStyle: TextStyle());

    final TextStyle textStyle;

    const TextStyle({
        required this.textStyle
    });

    TextStyle get() => textStyle;
}
