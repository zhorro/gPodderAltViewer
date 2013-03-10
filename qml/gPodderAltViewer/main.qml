import QtQuick 1.1

Rectangle {
    width: 640
    height: 640

    ListModel {
        id : testModel_bak
        ListElement { number: 23 }
        ListElement { number: 44 }
        ListElement { number: 78 }
    }

    Component {
        id: episodeComponent
        Item {
            height: 20
            Row {
                Text {
                    text: url
                }
                spacing: 10
            }
        }
    }

    ListView {
        id: allEpisodes
        anchors.fill: parent
        model: testModel
        delegate: episodeComponent
        highlight: Rectangle { color: "lightsteelblue"; radius: 5 }
        focus: true
    }
}
