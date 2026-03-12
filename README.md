# Breast Cancer Classification with DVC MLOps Pipeline

A machine learning project demonstrating MLOps best practices using DVC (Data Version Control) for pipeline management and reproducibility. This project implements a Random Forest classifier for breast cancer detection using the scikit-learn breast cancer dataset.

## Project Overview

This project showcases a complete ML pipeline with version control for data and models, enabling:
- Reproducible machine learning workflows
- Data and model versioning
- Pipeline automation and dependency tracking
- Collaborative ML development

## Features

- **Automated Data Pipeline**: Loads and prepares the breast cancer dataset
- **Model Training**: Random Forest classifier with 100 estimators
- **DVC Integration**: Complete pipeline orchestration and versioning
- **Reproducibility**: All stages tracked and reproducible via DVC

## Project Structure

```
.
├── data/                      # Dataset directory (DVC tracked)
│   └── breast_cancer.csv      # Breast cancer dataset
├── models/                    # Trained models directory (DVC tracked)
│   └── model.pkl              # Serialized Random Forest model
├── src/                       # Source code
│   ├── create_dataset.py      # Dataset creation script
│   └── train.py               # Model training script
├── .dvc/                      # DVC configuration
├── dvc.yaml                   # DVC pipeline definition
├── .dvcignore                 # DVC ignore patterns
├── requirement.txt            # Python dependencies
└── README.md                  # Project documentation
```

## Prerequisites

- Python 3.7+
- pip or conda package manager
- Git (for version control)

## DagHub Integration

This project is integrated with DagHub for experiment tracking, data versioning, and collaboration.

### Setting Up DagHub Connection

1. **Create a DagHub account** at [dagshub.com](https://dagshub.com)

2. **Create a new repository** on DagHub or connect an existing one

3. **Configure DVC remote storage** with DagHub:
   ```bash
   dvc remote add origin https://dagshub.com/<username>/<repo-name>.dvc
   dvc remote modify origin --local auth basic
   dvc remote modify origin --local user <your-dagshub-username>
   dvc remote modify origin --local password <your-dagshub-token>
   ```

4. **Configure Git remote** (if not already set):
   ```bash
   git remote add origin https://dagshub.com/<username>/<repo-name>.git
   ```

5. **Push your code and data**:
   ```bash
   git add .
   git commit -m "Initial commit"
   git push -u origin main
   
   dvc push
   ```

### Getting Your DagHub Token

1. Go to [dagshub.com/user/settings/tokens](https://dagshub.com/user/settings/tokens)
2. Create a new token with appropriate permissions
3. Use this token as your password in the DVC remote configuration

## Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd DVC_Implementation_MLOPS
   ```

2. **Create and activate virtual environment**
   ```bash
   python -m venv venv
   
   # On Windows
   venv\Scripts\activate
   
   # On Linux/Mac
   source venv/bin/activate
   ```

3. **Install dependencies**
   ```bash
   pip install -r requirement.txt
   ```

4. **Initialize DVC** (if not already initialized)
   ```bash
   dvc init
   ```

## Usage

### Running the Complete Pipeline

Execute the entire ML pipeline with a single command:

```bash
dvc repro
```

This will:
1. Create the breast cancer dataset
2. Train the Random Forest model
3. Save the trained model

### Running Individual Stages

**Create Dataset Only:**
```bash
dvc repro create_dataset
```

**Train Model Only:**
```bash
dvc repro train_model
```

### Manual Execution

You can also run scripts manually:

```bash
# Create dataset
python src/create_dataset.py

# Train model
python src/train.py
```

## Pipeline Visualization

![DVC Pipeline](pipeline.png)

The diagram above shows the complete ML pipeline with dependencies between stages.

## Pipeline Stages

### Stage 1: Create Dataset (`create_dataset`)
- **Command**: `python src/create_dataset.py`
- **Dependencies**: `src/create_dataset.py`
- **Outputs**: `data/breast_cancer.csv`
- **Description**: Loads the breast cancer dataset from scikit-learn and saves it as CSV

### Stage 2: Train Model (`train_model`)
- **Command**: `python src/train.py`
- **Dependencies**: 
  - `data/breast_cancer.csv`
  - `src/train.py`
- **Outputs**: `models/model.pkl`
- **Description**: Trains a Random Forest classifier and saves the model

## Model Details

- **Algorithm**: Random Forest Classifier
- **Parameters**: 
  - n_estimators: 100
  - random_state: 42 (for reproducibility)
- **Train/Test Split**: 80/20
- **Evaluation Metric**: Accuracy Score

## DVC Commands Reference

```bash
# Reproduce the pipeline
dvc repro

# Check pipeline status
dvc status

# Show pipeline DAG
dvc dag

# Pull data/models from remote storage
dvc pull

# Push data/models to remote storage
dvc push

# Add remote storage (example with local directory)
dvc remote add -d myremote /path/to/remote/storage

# Track new data files
dvc add data/new_file.csv
```

## Dataset Information

The breast cancer dataset contains:
- **Samples**: 569 instances
- **Features**: 30 numeric features computed from digitized images
- **Target**: Binary classification (malignant or benign)
- **Source**: scikit-learn datasets

## Results

The model achieves competitive accuracy on the breast cancer classification task. Actual performance metrics are displayed during training execution.

## Version Control

This project uses:
- **Git**: For code versioning
- **DVC**: For data and model versioning

To track changes:
```bash
# Track code changes
git add .
git commit -m "Your message"

# Track data/model changes
dvc add data/breast_cancer.csv
dvc add models/model.pkl
git add data/.gitignore models/.gitignore data/breast_cancer.csv.dvc models/model.pkl.dvc
git commit -m "Update data/models"
```

## Reproducibility

To reproduce this project on another machine:

1. Clone the repository
2. Install dependencies
3. Pull DVC-tracked files: `dvc pull`
4. Run the pipeline: `dvc repro`

## Future Enhancements

- [ ] Add hyperparameter tuning stage
- [ ] Implement cross-validation
- [ ] Add model evaluation metrics (precision, recall, F1-score)
- [ ] Create visualization stage for results
- [ ] Add model comparison experiments
- [ ] Implement CI/CD pipeline
- [ ] Add remote storage configuration (S3, GCS, Azure)
- [ ] Create model serving endpoint

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/improvement`)
3. Commit your changes (`git commit -am 'Add new feature'`)
4. Push to the branch (`git push origin feature/improvement`)
5. Create a Pull Request

## License

This project is open source and available under the MIT License.

## Contact

For questions or feedback, please open an issue in the repository.

---

**Note**: This project is for educational purposes demonstrating MLOps practices with DVC.
