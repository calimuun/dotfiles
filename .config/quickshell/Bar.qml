import Quickshell
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts

import "modules"

PanelWindow {
    id: root

    property color backgroundColor: "#201f1d"
    property color dividerColor: "#565c3a"
    property color primaryColor: "#e1d6a6"
    property color secondaryColor: "#6eb4c3"

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

        Clock {
            textColor: root.primaryColor
            fontFamily: root.fontFamily
            fontSize: root.fontSize
        }

        Item { Layout.fillWidth: true }

        Rectangle { width: 2; height: 20; color: root.dividerColor }

        AudioController {
            textColor: root.primaryColor
            fontFamily: root.fontFamily
            fontSize: root.fontSize
        }

        Rectangle { width: 2; height: 20; color: root.dividerColor }

        Tray {
            primaryColor: root.primaryColor
            fontFamily: root.fontFamily
        }
    }
}