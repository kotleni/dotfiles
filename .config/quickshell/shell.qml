import Quickshell
import Quickshell.Widgets
import QtQuick.Layouts
import QtQuick
import Quickshell.Hyprland

import "components"

ShellRoot {
    readonly property var accentColor: "#5555ff"
    readonly property var backgroundColor: "#232025"
    readonly property var itemBackgroundColor: "#333333"
    readonly property var itemForegroundColor: "white"

    PanelWindow {
        anchors {
            top: true
            left: true
            right: true
        }

        color: backgroundColor
        implicitHeight: 30

        // ActivateLinux { }
        RowLayout {
            anchors.fill: parent

            Workspaces { }
            Item {
                Layout.fillWidth: true
            }
            Volume { }
            DateTime { }
        }
    }
}
