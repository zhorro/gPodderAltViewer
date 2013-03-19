﻿// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Item {
    id: rssItem
    property int newEpisodes: 0
    property int downloaded: 0
    property string description: ""
    property string url: ""

    property string title: "untitled"
    property string icon: "../Images/RSS.png"
    property string tag: "All"
    property int deleteInDays: -1

    width: 360
    height: 32

    Image {
        id: itemImage
        anchors {
            top: parent.top
            bottom: parent.bottom
            left: itemsAmounts.right

            topMargin: 0
            bottomMargin: 0
            leftMargin: 16
        }

        width: height
        source: rssItem.icon
    }

    function positiveIntToString(a){
        var result = "";
        if (a>0)
            result = a;
        return result;
    }

    function ifFirstEmptySecond(a,b) {
        if (a === "")
            return b;
        return a;
    }


    Text {
        id: descLabel
        text: ifFirstEmptySecond(parent.description, parent.url)
        verticalAlignment: Text.AlignVCenter

        anchors{
            bottom: parent.bottom
            top: parent.top
            right: parent.right
            left: itemImage.right

            bottomMargin: 0
            topMargin: 0
            rightMargin: 0
            leftMargin: 16
        }
    }

    Rectangle {
        id: itemsAmounts
        width: height
        radius: 0
        visible: true

        anchors {
            left: parent.left
            bottom: parent.bottom
            top: parent.top

            leftMargin: 0
            bottomMargin: 0
            topMargin: 0
        }

        Image {
            id: stateImage
            visible: false
            anchors.fill: parent
        }

        Text {
            id: newItemsLabel
            text: positiveIntToString(parent.parent.newEpisodes)

            anchors{
                right: parent.right
                left: parent.left
                top: parent.top

                rightMargin: 0
                leftMargin: 0
                topMargin: 0
            }
            horizontalAlignment: Text.AlignRight
            verticalAlignment: Text.AlignVCenter

            height: width/2;
        }

        Text {
            id: dowItemsLabel
            text: positiveIntToString(parent.parent.downloaded)

            anchors {
                right: parent.right
                left: parent.left
                bottom: parent.bottom

                rightMargin: 0
                leftMargin: 0
                bottomMargin: 0
            }

            horizontalAlignment: Text.AlignRight
            verticalAlignment: Text.AlignVCenter

            height: width/2;
        }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            rssItem.state = 'updating'
            Ziba.updateRssItem(rssItem.url);
        }
    }

    states: [
        State {
            name: "awaiting"
            PropertyChanges {
                target: stateImage
                visible: false
            }

            PropertyChanges {
                target: newItemsLabel
                visible: true
            }
            PropertyChanges {
                target: dowItemsLabel
                visible: true
            }
        },
        State {
            name: "playing"
        },
        State {
            name: "updating"

            PropertyChanges {
                target: stateImage
                source: "../Images/loading/loading4.gif"
            }

            PropertyChanges {
                target: newItemsLabel
                visible: false
            }
            PropertyChanges {
                target: dowItemsLabel
                visible: false
            }
        }
    ]
}
