import QtQuick
import Quickshell.Hyprland

Row {

    property color selectedColor: "cyan"
    property color unselectedColor: "blue"
    property int fontSize: 15
    property string fontFamily: "JetBrainsMono Nerd Font"

    spacing: 8

    Repeater {
        // entenda isso como a variável de controle do loop for
        model: Hyprland.workspaces.values.filter(w => w || w.id === Hyprland.focusedWorkspace.id)

        Text {
            property var ws: modelData // model data é usar os dados davariável de controle do loop for

            text: ws.id
            color: (Hyprland.focusedWorkspace.id === ws.id) ? selectedColor : unselectedColor

            font { family: root.fontSize; pixelSize: root.fontSize; bold: true }

            MouseArea {
                anchors.fill: parent
                onClicked: Hyprland.dispatch("workspace " + (index + 1))
            }
        }
    }
}