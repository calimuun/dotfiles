import Quickshell
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts

import "modules"

PanelWindow {
    id: root

    property color backgroundColor: "#1a1b26"
    property color dividerColor: "#444b6a"
    property color primaryColor: "#0db9d7"
    property color secondaryColor: "#7aa2f7"

    property string fontFamily: "JetBrainsMono Nerd Font"
    property int fontSize: 18

    anchors.top: true
    anchors.left: true
    anchors.right: true
    implicitHeight: 40
    color: root.backgroundColor

    RowLayout {
        anchors.fill: parent
        anchors.margins: 8

        WorkspaceList {
            selectedColor: root.primaryColor
            unselectedColor: root.secondaryColor
            fontSize: root.fontSize
            fontFamily: root.fontFamily
        }

        Rectangle { width: 2; height: 20; color: root.dividerColor }

        Item { Layout.fillWidth: true }

        Rectangle { width: 2; height: 20; color: root.dividerColor }

        Tray {
            primaryColor: root.primaryColor
            fontFamily: root.fontFamily
        }

        Rectangle { width: 2; height: 20; color: root.dividerColor }

        AudioController {
            textColor: root.secondaryColor
            fontFamily: root.fontFamily
            fontSize: root.fontSize
        }

        Rectangle { width: 2; height: 20; color: root.dividerColor }

        Clock {
            textColor: root.secondaryColor
            fontFamily: root.fontFamily
            fontSize: root.fontSize
        }
    }
}