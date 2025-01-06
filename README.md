## Flutter Scaffold Template

## Overview
This is a Flutter project developed as a technical test by **Dalayya Kalla**. The project focuses on **Folder struture, MVVM architecture and Lib integrations**.

## Table of Contents
- [Architecture](#architecture)
- [Technologies and Libraries Used](#technologies-and-libraries-used)
- [Author](#author)

## Architecture

The Project is Based on MVVM and Clean-Architecture with consideration of SOLID principles which Includes below folders Module:

1. core : which has all base classes/setup for network,storage,resources etc.
2. app : which has all app related stuff router, dependancy injection(di).
3. modules : total app modules/feautues ex: onboarding,auth and home etc.
            Each module has below folders based on  MVVM architecture. 
            - models
            - entities
            - usecases
            - repositories
            - datasources
            - screens
            - widgets
            - viewmodels 

All above folders all 3 modules , they are Data, Domain and Presenation layers.


**Data:** The data layer serves as a bridge between the domain layer and the presentation layer, supplying data through implementations of data sources, repositories, and models.

**Domain:** The domain layer encapsulates the core business logic and rules, acting as an intermediary between the data layer and presentation layer to ensure separation of concerns and maintain a clean, business-centric architecture. 

**Presentation**: The presentation layer manages user interfaces and interactions, focusing on the visual representation of data and user experience. It relies on the domain layer for business logic and the data layer for data retrieval, fostering a clear separation of concerns in the application architecture.

## Technologies and Libraries Used

- **Flutter**: Flutter is a UI toolkit that enables the creation of natively compiled applications for mobile, web, and desktop from a single codebase.


### Author

 **Dalayya Kalla**

- **LinkedIn**: https://www.linkedin.com/in/dalayya-kalla-4b11a059/
- **Email**: [dalu547@gmail.com]()






