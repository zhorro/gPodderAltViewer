import QtQuick 1.1

Component {
    Item {
//        id: podcastItem
        property int w: 64

// Описание
        property int podcast_id
        property alias title: titleText.text
        property string description
        property string url
        property int published
// Ссылки
        property int file_size
        property string guid
        property string link
        property string mime_type
        property string payment_url
// Флаги
        property int state
        property bool is_new
        property bool archive
// Время
        property int total_time
// Проигрыватель
        property int current_position
        property int current_position_updated
        property int last_playback
        property string download_filename

        property int deleteInDays: -1

        width: 360
        height: w

        function mimeIcon (mime, w)
        {
            var iconStr = "qrc:/images/RSS.png";
            if(mime==="audio/mpeg")
                iconStr = "qrc:/images/Gnome-Audio-Input-Microphone-"+w+".png";
            else if (mime==="video/mp4")
                iconStr = "qrc:/images/Gnome-Applications-Multimedia-"+w+".png";
            return iconStr;
        }

        Image {
            id: podcastIcon;
            source: mimeIcon(podcastItem.mime_type, w)
            height: w
            width:  w
        }

        Text {
            id: titleText
            height: w/2
            text: qsTr("")
            anchors.top: parent.top
            anchors.right: parent.right
            anchors.left: podcastIcon.right
        }

        Text {
            id: itemDescr
            height: w/2
            text: published
            anchors.right: parent.right
            anchors.left: podcastIcon.right
            anchors.top: titleText.bottom
        }
    }
}
