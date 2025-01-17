Abz Test Task
  from https://www.work.ua/jobs/6124924/

1. Configuration options and how to customize them.
    - /Service/Constants.swift baseURL variable provides API url;
    - /Types/EntdpointType.swift provides API endpoints;

2. Dependencies and any external libraries used.
    - no external librares used;

3. Troubleshooting tips and common issues.
    - prepare photos for signup and put them to device gallery;
    - users list pull down gesture updates users list from API cal imiiately;
    - first press on Signup button with empty inputs activates validation colors;

4. Instructions on how to build the application.
    - use XCode to buid this SwiftUI project; 
    - in project properties in Singing & Capabilites set your team;
    
Code structure and important modules.
    - Common: top Views;
    - Controls: controls structures;
        - PositionSelector: user poosition selector control;
        - TabBar: custom TabView;
    - Fonts: custom fonts;
    - Models: MVVM data models;
    - Pages: TabView pages & Status page
    - Service: API calls & constants and standart fonts settings;
    - Styles: controls custom ctyles;
    - Types: custom controls types;
    - ViewModels: MVVM ViewModels;
