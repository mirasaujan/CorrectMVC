# iOS Project Module Example
Project demonstrates my vision of how MVC should be used in iOS project. 

## Stack:
- MVC + Coordinator
- UIKit
- Combine
- URLSession

## Overview
Project is broken down into 4 parts. Each has its own purpose.

### Application
It is an app's entry point.
- Configure modules, app level settings
- `Application` creates and configures `Coordinator`s that controls app's navigation flow.

### Domain 
Domain is a bridge that helps `Presentation` to work with abstraction. 
- Domain models
- Abstract entities (protocols)

### Presentation
Presentation logic. Contains all `MVC` parts. 
`Model` in this case acts as a facade that hides iterconnections between modules. `View` may be active, know about Domain models, or passive, opposite of active. `Controller` binds `View` with `Model` and should do nothing else.

### Configuration
- Domain implemntations 
- Providers, Repositories, Services for Domain entities

## Advantages
There are two possible versions from this architecture

**Break down Domain, Presentation, Configuration into separate modules for one app**
- Forces good design (Separates `Model` from `View`)
- Decrease build time (if previously app was monolithic)
- Ability to run tests in parallel

**Break down app into separate logically connected modules (Auth, Feed, Search)**
- Decrease build time (if previously app was monolithic)
- Ability to run tests in parallel
