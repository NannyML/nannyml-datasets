# NannyML Datasets

This Python package contains our curated datasets, used for testing and product demos.

We provide datasets for the following problem types: binary classification, multiclass classification and regression.


## Anatomy of a `Dataset`

Each `Dataset` has `reference` and `monitoring` properties. Each of these exposes the following properties:

- `data`: access the full dataset as a `pyarrow.Table`
- `predictions`: access the model predictions as a `numpy.ndarray`
- `predicted_probabilities`: access the model's predicted probablilities. Only available for classification datasets. For binary classification datasets this will be a single 
- `targets`: access the model targets as a `numpy.ndarray`
- `timestamps`: access the model timestamps as a `numpy.ndarray`
- `categorical_features`: access the model's categorical features as an `Iterable` of `numpy.ndarray`
- `continuous_features`: access the model's continuous features as an `Iterable` of `numpy.ndarray`
- `features`: access the model's features as an `Iterable` of `numpy.ndarray`

If any of these properties are not available, trying to access them will raise an `AssertionError`.


## Example usage

```python

from nannyml_dataset.binary_classification import synthetic_car_loan  # Import the dataset

print(synthetic_car_loan.reference.timestamps)  # Access some reference property
print(synthetic_car_loan.monitoring.timestamps)  # Access some monitoring property

for col in synthetic_car_loan.reference.categorical_features:  # Loop over reference categorical features
    print(col)  # You can do more useful stuff here, like setting up a univariate covariate shift monitor!

```

## Available datasets

### Binary Classification


| Dataset | Synthetic | Description |
|---------|-----------|-------------|
| synthetic_car_loan | yes | A synthetic dataset describing a model that predicts defaulting a loan for a car. |