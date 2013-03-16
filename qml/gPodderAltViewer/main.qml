import QtQuick 1.1
import "."

Rectangle {
    width: 640
    height: 640


    ListView {
        id: allEpisodes
        anchors.fill: parent
        model: testModel
        delegate: PodcastItem {
            id: podcastItem
        }

        highlight: Rectangle { color: "lightsteelblue"; radius: 5 }
        focus: true
    }
}
