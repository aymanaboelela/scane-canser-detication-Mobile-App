# Derma Check App 🔬📱
## Intelligent Skin Cancer Image-based Detection System

<div align="center">
  <img src="https://github.com/aymanaboelela/skin-cancer-detection-Derma-Check-App/blob/main/assets/images/logoApp.jpg" alt="Derma Check Logo" width="200"/>
  
  [![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev)
  [![Supabase](https://img.shields.io/badge/Supabase-3ECF8E?style=for-the-badge&logo=supabase&logoColor=white)](https://supabase.com)
  [![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)](https://python.org)
  [![TensorFlow](https://img.shields.io/badge/TensorFlow-FF6F00?style=for-the-badge&logo=tensorflow&logoColor=white)](https://tensorflow.org)
</div>

## 📋 Table of Contents
- Overview
- Features
- Technology Stack
- Model Performance
- Usage
- Dataset
- Model Architecture
- Screenshots
- License
- Acknowledgments

## 🔍 Overview

Derma Check is an intelligent skin cancer detection mobile application that leverages advanced Machine Learning (ML) and Deep Learning (DL) techniques to analyze skin lesion images and provide accurate classification results. The system aims to assist in early skin cancer detection, potentially improving patient outcomes through timely diagnosis.

This graduation project was developed at the Modern University for Technology & Information, Faculty of Computers & Artificial Intelligence, Department of Computer Science.

### Key Highlights
- 🎯 **High Accuracy**: Achieves up to 96.10% accuracy in multi-class classification
- 📱 **Mobile-First**: Cross-platform Flutter app for iOS and Android
- 🧠 **AI-Powered**: Ensemble of pre-trained deep learning models
- 🔒 **Secure**: Robust authentication and data privacy measures
- 📊 **Comprehensive**: Both binary and multi-class lesion classification

## ✨ Features

### 🔬 AI-Powered Detection
- **Binary Classification**: Distinguishes between benign and malignant lesions
- **Multi-Class Classification**: Identifies 7 types of skin lesions:
  - Melanoma (MEL)
  - Melanocytic Nevi (NV) 
  - Basal Cell Carcinoma (BCC)
  - Actinic Keratosis (AK)
  - Benign Keratosis (BKL)
  - Dermatofibroma (DF)
  - Vascular Lesions (VASC)

### 📱 User-Friendly Interface
- **Intuitive Design**: Clean, medical-grade UI/UX
- **Image Capture**: Direct camera integration for lesion photography
- **History Tracking**: View and track previous scans
- **Educational Content**: Information about skin cancer types and prevention
- **Report Generation**: Downloadable PDF reports
- **Doctor Sharing**: Direct result sharing with healthcare providers

## 🛠️ Technology Stack

### Frontend (Mobile App)
- **Framework**: Flutter 3.x
- **Language**: Dart
- **UI Components**: Material Design & Cupertino
- **Animations**: Lottie Files
- **State Management**: Provider/Bloc

### Backend & Database
- **Backend**: Supabase
- **Database**: PostgreSQL
- **Authentication**: Supabase Auth
- **File Storage**: Supabase Storage
- **Real-time**: WebSocket connections

### AI/ML Pipeline
- **Deep Learning Models**:
  - MobileNetV3 (Efficient mobile deployment)
  - ResNet50 (Deep residual learning)
  - DenseNet121 (Dense connectivity)
- **Ensemble Learning**: Weighted voting system
- **Transfer Learning**: Pre-trained on ImageNet
- **Traditional ML**: SVM and Random Forest classifiers

### Development Tools
- **IDE**: Visual Studio Code
- **Version Control**: Git & GitHub
- **Project Management**: Trello
- **Design**: Figma
- **CI/CD**: GitHub Actions
- **Training Model**: Kaggle

## 📊 Model Performance

### Deep Learning Results
| Dataset | Classification Type | Accuracy |
|---------|-------------------|----------|
| HAM10000 | Binary | 93.56% |
| HAM10000 | Multi-class | 96.10% |
| ISIC | Binary | 91.40% |
| ISIC | Multi-class | 81.20% |

### Machine Learning Results
| Model | Dataset | Binary | Multi-class |
|-------|---------|--------|-------------|
| Random Forest | HAM10000 | 89.43% | 66.70% |
| SVM | HAM10000 | 80.17% | 76.57% |
| Random Forest | ISIC | 83.45% | 60.71% |
| SVM | ISIC | 66.62% | 71.83% |

### Individual Model Performance
| Model | HAM10000 (Multi) | ISIC (Multi) |
|-------|------------------|--------------|
| DenseNet121 | 95.8% | 79.1% |
| ResNet50 | 94.9% | 79.8% |
| MobileNetV3 | 88.6% | 73.3% |
| **Ensemble** | **96.1%** | **81.2%** |

## 📖 Usage

### Getting Started
1. **Download & Install** the Derma Check app
2. **Create Account** with email verification
3. **Complete Onboarding** to learn about the app features

### Taking a Scan
1. **Navigate** to the camera section
2. **Position** the lesion within the frame
3. **Capture** a clear, well-lit image
4. **Wait** for AI analysis (typically 5-10 seconds)
5. **Review** the detailed results and recommendations

### Understanding Results
- **Confidence Score**: Percentage indicating model certainty
- **Classification**: Specific lesion type identified
- **Risk Level**: Color-coded risk assessment
- **Recommendations**: Next steps and medical advice

### Important Notes
⚠️ **This app is for screening purposes only and should not replace professional medical diagnosis. Always consult with a dermatologist for proper medical evaluation.**

## 📊 Dataset

### HAM10000 Dataset
- **Total Images**: 10,015 dermoscopic images
- **Classes**: 7 skin lesion types
- **Source**: ViDIR Group, Medical University of Vienna
- **Regions**: Austria and Australia
- **Dataset Link**: [HAM10000 on Kaggle](https://www.kaggle.com/datasets/kmader/skin-cancer-mnist-ham10000)

### ISIC Archive Dataset
- **Total Images**: 28,000 high-quality dermoscopic images
- **Classes**: 7 balanced classes (4,000 images each)
- **Source**: International Skin Imaging Collaboration
- **Usage**: ISIC Challenge benchmark dataset
- **Dataset Link**: [ISIC 2019 Balanced Dataset on Kaggle](https://www.kaggle.com/datasets/shadmansobhan/isic-2019-balanced-dataset-4000-images-per-class)

## 🏗️ Model Architecture

### Ensemble Deep Learning Framework
```
Input Image (224x224x3)
    ↓
Data Preprocessing
    ↓
┌─────────────────┬─────────────────┬─────────────────┐
│   MobileNetV3   │    ResNet50     │  DenseNet121    │
│   (Efficiency)  │   (Accuracy)    │  (Feature Rich) │
└─────────────────┴─────────────────┴─────────────────┘
    ↓
Feature Fusion & Ensemble Voting
    ↓
Final Classification Result
```

<div align="center">
  <img src="https://github.com/aymanaboelela/skin-cancer-detection-Derma-Check-App/blob/main/assets/images/dlframework.png" width="900" alt="Deep learning framework"/>
  </div>

### Machine Learning Pipeline
```
Input Image → Preprocessing → Feature Extraction → ML Classifier → Result
                ↓              ↓                   ↓
            Augmentation    Deep Features      SVM/Random Forest
            Normalization   + Handcrafted
            Resizing        Features
```

<div align="center">
  <img src="https://github.com/aymanaboelela/skin-cancer-detection-Derma-Check-App/blob/main/assets/images/mlframework.png" width="900" alt="Machine learning framework"/>
  </div>

## 📱 Screenshots

### Onboarding

<div align="center">
  <img src="https://github.com/aymanaboelela/skin-cancer-detection-Derma-Check-App/blob/main/assets/images/onboarding.png" width="600" alt="Onboarding"/>
  </div>
  
### Authentication
<div align="center">
  <img src="https://github.com/aymanaboelela/skin-cancer-detection-Derma-Check-App/blob/main/assets/images/login.png" width="242" alt="Login"/>
  <img src="https://github.com/aymanaboelela/skin-cancer-detection-Derma-Check-App/blob/main/assets/images/signup.png" width="250" alt="Sign Up"/>
</div>

### Main Interface
<div align="center">
  <img src="https://github.com/aymanaboelela/skin-cancer-detection-Derma-Check-App/blob/main/assets/images/home.png" width="430" alt="Home Screen"/>
  <img src="https://github.com/aymanaboelela/skin-cancer-detection-Derma-Check-App/blob/main/assets/images/camera.png" width="217" alt="Camera"/>
  <img src="https://github.com/aymanaboelela/skin-cancer-detection-Derma-Check-App/blob/main/assets/images/results.png" width="212" alt="Results"/>
</div>

### Additional Features
<div align="center">
  <img src="https://github.com/aymanaboelela/skin-cancer-detection-Derma-Check-App/blob/main/assets/images/history.png" width="400" alt="History"/>
  <img src="https://github.com/aymanaboelela/skin-cancer-detection-Derma-Check-App/blob/main/assets/images/help.png" width="400" alt="Help"/>
  <img src="https://github.com/aymanaboelela/skin-cancer-detection-Derma-Check-App/blob/main/assets/images/settings.png" width="400" alt="Settings"/>
</div>


## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- **International Skin Imaging Collaboration (ISIC)** for the dataset
- **HAM10000 Dataset** contributors from Medical University of Vienna
- **Flutter Team** for the excellent cross-platform framework
- **Supabase** for the robust backend infrastructure
- **PyTorch** communities for the deep learning tools


## 🔮 Future Work

- [ ] 3D imaging technology integration
- [ ] Integration with clinical workflows
- [ ] Multi-modal data integration
- [ ] Transformer-based models (Vision Transformers)
- [ ] Support for additional cancer types
- [ ] Longitudinal patient tracking

---

<div align="center">
  <p><strong>⚕️ Early Detection Saves Lives - Derma Check App ⚕️</strong></p>
  <p><em>Empowering individuals with AI-driven skin health monitoring</em></p>
</div>
