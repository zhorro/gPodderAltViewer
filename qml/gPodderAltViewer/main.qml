import QtQuick 1.1

Rectangle {
    width: 640
    height: 640

    Component {
        id: episodeComponent
        Item {
            height: 20
            Row {
                Text { text:  id  }
                Text { text:  podcast_id  }
/*                Text { text:  title  }
                Text { text:  description  }
                Text { text:  url  }
                Text { text:  published  }
                Text { text:  guid  }
                Text { text:  link  }
                Text { text:  file_size  }
                Text { text:  mime_type  }
                Text { text:  state  }
                Text { text:  is_new  }
                Text { text:  archive  }
                Text { text:  download_filename  }
                Text { text:  total_time  }
                Text { text:  current_position  }
                Text { text:  current_position_updated  }
                Text { text:  last_playback  }
                Text { text:  payment_url  }*/
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
