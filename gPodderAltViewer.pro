# Add more folders to ship with the application, here
# folder_01.source = qml
# folder_01.target = .
# DEPLOYMENTFOLDERS = folder_01

# folder_02.source = images
# folder_02.target = .
# DEPLOYMENTFOLDERS = folder_02

# Additional import path used to resolve QML modules in Creator's code model
QML_IMPORT_PATH =

# If your application uses the Qt Mobility libraries, uncomment the following
# lines and add the respective components to the MOBILITY variable.
# CONFIG += mobility
# MOBILITY +=

# Speed up launching on MeeGo/Harmattan when using applauncherd daemon
# CONFIG += qdeclarative-boostable

QT += sql

# The .cpp file which was generated for your project. Feel free to hack it.
SOURCES += main.cpp \
    sqlquerymodel.cpp

# Please do not modify the following two lines. Required for deployment.
include(qmlapplicationviewer/qmlapplicationviewer.pri)
qtcAddDeployment()

HEADERS += \
    sqlquerymodel.h

OTHER_FILES += \
    qml/main.qml \
    qml/PodcastItem.qml \
    qml/RssItem.qml \
    qml/age.js

RESOURCES += \
    resource.qrc
