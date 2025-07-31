# 🏦 Term Deposit Subscription Prediction

This project uses machine learning to predict whether a customer will subscribe to a term deposit based on a range of marketing and demographic features. The dataset is sourced from the UCI Bank Marketing dataset and includes details on previous campaign outcomes, customer attributes, and contact methods.

## 📊 Objective

To build a predictive model that identifies high-potential customers for term deposit products, enabling more targeted and effective marketing strategies.

## 🔍 Problem Statement

Financial institutions often run marketing campaigns to encourage customers to open term deposit accounts. However, these campaigns can be costly and inefficient when not well-targeted. By using machine learning, we aim to predict customer subscription likelihood and help improve ROI on marketing efforts.

## 🧰 Tools & Technologies

- **Python**  
- **Pandas**, **NumPy** – data manipulation  
- **Scikit-learn** – modeling and evaluation  
- **Matplotlib**, **Seaborn** – data visualization  
- **SMOTE** – to address class imbalance  
- **Jupyter Notebook**

## 🧪 ML Techniques

- Logistic Regression  
- Decision Trees  
- Random Forest  
- SVM  
- LightGBM  
- Feature selection using Welch's t-test and Chi-square  
- 5-fold cross-validation  
- Model evaluation using ROC-AUC, precision, recall, confusion matrix

## 📈 Key Results

- Best performance achieved with **Random Forest** (ROC-AUC: 0.79)
- Feature insights:
  - Customers with prior successful contact were more likely to subscribe
  - Retired and student demographics showed high engagement
  - Cellular contact method outperformed others

## 🧠 Key Learnings

- Importance of feature selection in improving model accuracy
- Effectiveness of ensemble methods for classification
- Dealing with imbalanced classes using SMOTE
- Translating insights into actionable segmentation strategies

## 🚀 How to Run

1. Clone the repository  
2. Open `Term_Deposit_ML_prediction.ipynb` in Jupyter Notebook  
3. Install required packages using `pip install -r requirements.txt`  
4. Run all cells to see the results and visualizations  

## 📂 Data Source

UCI Machine Learning Repository: [Bank Marketing Dataset](https://archive.ics.uci.edu/ml/datasets/bank+marketing)

## 🙋‍♀️ Author

**Jo Nguyen**  
Data Analyst | Aspiring Data Scientist  
📧 nguyen.hang1997@gmail.com  
🌱 Ask me about: Self-improvement, running  
⚡ Fun fact: I biked from San Francisco to LA during El Niño in 2016!

