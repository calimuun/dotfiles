import Quickshell.Services.SystemTray
import Quickshell.Widgets
import Quickshell
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
                id: mouseArea
                anchors.fill: parent
                acceptedButtons: Qt.LeftButton | Qt.RightButton | Qt.MiddleButton

                onClicked: (mouse) => {
                    if (mouse.button == Qt.RightButton) {
                        menuAnchor.open()
                    } else if (mouse.button == Qt.LeftButton) {
                        item.activate()
                    } else if (mouse.button == Qt.MiddleButton) {
                        item.secondaryActivate()
                    }
                }

                QsMenuAnchor {
                    id: menuAnchor
                    menu: item.menu

                    anchor.window: mouseArea.QsWindow.window
                    anchor.adjustment: PopupAdjustment.Flip

                    anchor.onAnchoring: {
                        const window = mouseArea.QsWindow.window
                        const widgetRect = window.contentItem.mapFromItem(mouseArea, 0, mouseArea.height, mouseArea.width, mouseArea.height)

                        menuAnchor.anchor.rect = widgetRect
                    }
                }
            }
        }
    }
}