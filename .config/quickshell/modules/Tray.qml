import Quickshell.Services.SystemTray
import Quickshell.Widgets
import QtQuick

Row {

    property color primaryColor: "#0db9d7"

    property string fontFamily: "JetBrainsMono Nerd Font"

    spacing: 8

    Repeater {
        model: SystemTray.items

        IconImage {
            property var item: modelData

            source: item.icon
            implicitSize: 24

            MouseArea {
                anchors.fill: parent
                onClicked: (mouse) => {
                    if (mouse.button == Qt.RightButton) {
                        const win = parent.window
                        const pos = parent.mapToItem(win.contentItem, mouse.x, mouse.y)
            
                        item.display(win, pos.x, pos.y)
                    } else {
                        item.activate()
                    }
                }
            }
        }
    }

}