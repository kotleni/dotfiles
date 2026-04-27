import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.Pipewire
import Quickshell.Widgets

Row {
    id: volume_root 
    height: parent.height
    spacing: 10
    leftPadding: 0
    rightPadding: 0

    property string globalFont: "SF Pro Display Bold"

    PwObjectTracker {
        objects: [
            Pipewire.defaultAudioSink,
            Pipewire.defaultAudioSource,
        ]
    }

    Connections {
        target: Pipewire.defaultAudioSink
    }

    property var audioSink: Pipewire.defaultAudioSink && Pipewire.defaultAudioSink.audio
        ? Pipewire.defaultAudioSink.audio : null

    property var audioSource: Pipewire.defaultAudioSource && Pipewire.defaultAudioSource.audio
        ? Pipewire.defaultAudioSource.audio : null

    property var isAudioSinkMuted: audioSink.muted

    property var isAudioSourceMuted: audioSource.muted

    MouseArea {
        anchors.fill: parent
        scrollGestureEnabled: true

        onWheel: (wheel) => {
            if (!audioSink) return;

            let delta = wheel.angleDelta.y > 0 ? 0.05 : -0.05;
            let newVol = Math.min(Math.max(audioSink.volume + delta, 0), 1);

            audioSink.volume = newVol;
        }
    }

    // Audio sink
    Text {
        width: parent.height + 20
        anchors.verticalCenter: parent.verticalCenter

        text: {
            var vol = Math.round(audioSink.volume * 100)
            var icon = "󰕾"; // Default speaker icon.

            if (audioSink.muted) icon = "󰝟"; // Muted icon.
            else if (vol <= 0) icon = "󰝟"; // Muted icon for zero volume.
            else if (vol < 30) icon = "󰕿"; // Low volume icon.
            else if (vol < 70) icon = "󰖀"; // Medium volume icon.

            return icon + " " + vol + "%"
        }
        font.pixelSize: 14
        font.family: globalFont
        color: isAudioSinkMuted ? "red" : "white"
    }

    // Audio source
    Text {
        width: parent.height + 20
        anchors.verticalCenter: parent.verticalCenter

        text: {
            var icon = isAudioSourceMuted ? "󰍭" : "󰍬"
            return icon + " " + Math.round(audioSource.volume * 100) + "%"
        }
        font.pixelSize: 14
        font.family: globalFont
        color: isAudioSourceMuted ? "red" : "white"
    }

}
