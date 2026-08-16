import QtQuick 2.15

Text {
    id: clock

    color: textColor

    text: Qt.locale("pt_BR").toString(new Date(), "dddd, dd MMM - HH:mm")
    font { family: fontFamily; pixelSize: fontSize; bold: true }

    // Propriedades externas
    property color textColor: "white"
    property string fontFamily: "JetBrainsMono Nerd Font"
    property int fontSize: 16

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: clock.text = Qt.locale("pt_BR").toString(new Date(), "dddd, dd MMM - HH:mm")
    }
}