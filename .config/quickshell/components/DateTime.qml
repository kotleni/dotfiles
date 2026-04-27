import QtQuick

Item {
    id: datetime_root
    implicitWidth: timeText.width + 20
    implicitHeight: parent.height

    property bool showTime: true

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: updateText()
    }

    function updateText() {
        let format = showTime ? "HH:mm" : "dd.MM.yyyy"
        timeText.text = Qt.formatDateTime(new Date(), format)
    }

    Text {
        id: timeText
        anchors.centerIn: parent
        color: "white"
        text: Qt.formatDateTime(new Date(), "HH:mm:ss")
        font.pixelSize: 14
        font.bold: false
        font.family: "SF Pro Display Bold"
    }

    MouseArea {
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        onClicked: {
            showTime = !showTime
            updateText()
        }
    }
}
