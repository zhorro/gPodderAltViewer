import QtQuick 1.1
import "age.js" as Age

Component {
    Item {
        property int w: 64


        // Описание
        //        podcast_id
        //        title
        //        description
        //        url
        //        published
        // Ссылки
        //        file_size
        //        guid
        //        link
        //        mime_type
        //        payment_url
        // Флаги
        //        state
        //        is_new
        //        archive
        // Время
        //        total_time
        // Проигрыватель
        //        current_position
        //        current_position_updated
        //        last_playback
        //        download_filename
        property int deleteInDays: -1

        width: 360
        height: w

        function mimeIcon(mime, w) {
            var iconStr = "qrc:/images/RSS.png"
            if (mime === "audio/mpeg")
                iconStr = "qrc:/images/Gnome-Audio-Input-Microphone-" + w + ".png"
            else if (mime === "video/mp4")
                iconStr = "qrc:/images/Gnome-Applications-Multimedia-" + w + ".png"
            return iconStr
        }

        Image {
            id: podcastIcon
            source: mimeIcon(_mime_type, w)
            height: w
            width: w
        }

        Text {
            id: titleText
            height: w / 2
            text: qsTr(_title)
            anchors.top: parent.top
            anchors.right: parent.right
            anchors.left: podcastIcon.right
        }

        Text {
            id: itemDescr
            height: w / 2
            text: Age.fromNow(Date(_published))
            anchors.right: parent.right
            anchors.left: podcastIcon.right
            anchors.top: titleText.bottom
        }
    }
}
