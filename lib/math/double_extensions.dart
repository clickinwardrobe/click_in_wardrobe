extension DoubleExtensions on double {
    /// Represent (this) with given fixed precision using (this).toStringAsFixed
    double toDoubleAsFixed(final int fractionDigits) {
        return double.parse((this).toStringAsFixed(fractionDigits));
    }
}
