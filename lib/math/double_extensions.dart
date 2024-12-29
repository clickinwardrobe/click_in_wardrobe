extension DoubleExtensions on double {
    /// Represent [this] with given fixed precision using [this.toStringAsFixed(int)]
    double toDoubleAsFixed(final int fractionDigits) {
        return double.parse((this).toStringAsFixed(fractionDigits));
    }
}
