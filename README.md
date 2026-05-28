# Blockies: A Parametric Dataset Generator for Human-AI Reliance Studies
***A synthetic visual diagnosis framework for evaluating XAI-based decision support***

## Introduction
**Blockies** is a parametric dataset generator for creating synthetic visual diagnostic tasks to study human-AI reliance and XAI-based decision support. It produces configurable images of virtual creatures with controlled visual traits, diagnostic labels, and model-relevant features, enabling researchers to design experiments that systematically vary task difficulty, dataset bias, AI behavior, and explanation interfaces.

Blockies was developed as part of our research on how task stakes shape reliance on AI-based decision support. If you use this dataset generator or build on the framework, please cite our UMAP publication:

```bibtex
@inproceedings{johnson2026blockies,
  title     = {Raising the Stakes: Assessing the Influence of Stakes on User Reliance Behavior in Human-AI Decision-Making},
  author    = {Johnson, David S.},
  booktitle = {Proceedings of the 34th ACM Conference on User Modeling, Adaptation and Personalization UMAP ’26)},
  year      = {2026},
  publisher = {ACM}
}
```

**Blockies** extends the [Two4Two library](https://github.com/mschuessler/two4two) by adding multiple customizable traits that can be used as symptoms for diagnosing predefined illnesses. This allows human-AI collaboration researchers to create more challenging visual diagnostic tasks for studying reliance, decision-making, and XAI-based support in simulated high-stakes settings.

The original Two4Two dataset was designed for controlled human-subject evaluations of interpretable machine learning methods using synthetic image data. Full details on Two4Two can be found in the original paper:

```bibtex
@inproceedings{
    sixt2022do,
    title={Do Users Benefit From Interpretable Vision? A User Study, Baseline, And Dataset},
    author={Leon Sixt and Martin Schuessler and Oana-Iuliana Popescu and Philipp Wei{\ss} and Tim Landgraf},
    booktitle={International Conference on Learning Representations},
    year={2022},
    url={https://openreview.net/forum?id=v6s3HVjPerv}
}
```

## Installation

**Blockies** uses [`uv`](https://docs.astral.sh/uv/) for Python package and dependency management.

### Requirements

- Python 3.11 or newer
- `uv`
- Blender API, downloaded automatically with `--download_blender`

### 1. Install `uv`

If you do not already have `uv` installed, install it with:

```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
```

Alternative installation methods, including Homebrew, `pip`, and Windows instructions, are available in the official [`uv` installation guide](https://docs.astral.sh/uv/getting-started/installation/).

### 2. Install Blockies dependencies

From the root of the repository, run:

```bash
uv sync
```

This creates a local virtual environment, installs the project dependencies, and syncs them with the lockfile. `uv` will also automatically sync the environment when using `uv run`, but running `uv sync` explicitly is a good first setup step.

### 3. Check the installation

Run the test script to verify that the package is installed correctly and that Blender is available:

```bash
./run_test.sh
```

If needed, make the script executable first:

```bash
chmod +x run_test.sh
```

(NOTE: Currently, the MyPy checks fail, but this shouldn't stop the code from working as long as the PyTest unit tests all pass.)

### 4. Run a small test generation

To test the dataset generator with the example configuration, run:

```bash
uv run blockies-generate --download_blender config/example.toml
```

The `--download_blender` option downloads Blender automatically if it is not already available.

### 5. Generate the default UMAP dataset

To generate the default dataset configuration used in the UMAP publication, run:

```bash
uv run blockies-generate config/default_blockies.toml
```


## Usage
More to come...