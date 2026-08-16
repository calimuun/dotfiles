import Quickshell
import Quickshell.Io
import Quickshell.Services.Pipewire
import QtQuick
import QtQuick.Layouts

Row {
	id: volumeWidget

    property color textColor: "white"
    property string fontFamily: "JetBrainsMono Nerd Font"
    property int fontSize: 15

	readonly property PwNode sink: Pipewire.defaultAudioSink
	readonly property bool isMuted: !!sink?.audio?.muted
	readonly property real volume: sink?.audio?.volume ?? 0

	PwObjectTracker {
		objects: [sink]
	}

	RowLayout {
		spacing: 10

		Text {
			id: textIcon

			function getIcon() {
				if (isMuted) return "󰝟"
				if (volume >= 0.6) return "󰕾"
				if (volume >= 0.3) return "󰖀"
				return "󰕿"
			}

			text: getIcon()
			color: textColor
			font {
				pixelSize: fontSize
				family: fontFamily
			}

			horizontalAlignment: Text.AlignHCenter
		}

		Text {
			id: textValue

			text: isMuted ? "MUDO" : Math.round(volume * 100)
			color: textColor
			font {
				pixelSize: fontSize
				family: fontFamily
			}

			horizontalAlignment: Text.AlignHCenter
		}
	}
}