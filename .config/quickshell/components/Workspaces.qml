import QtQuick
import Quickshell
import Quickshell.Hyprland

Row {
    id: workspaces_root

    Row {
        spacing: 5

        Repeater {
            model: Hyprland.workspaces

            Rectangle {
                readonly property bool isActive: modelData.active

                width: 30
                height: 30
                color: isActive ? accentColor : itemBackgroundColor
                opacity: modelData.windows > 0 ? 1.0 : 0.5
                radius: 0

                Text {
                    anchors.centerIn: parent
                    text: modelData.id
                    color: itemForegroundColor
                    font.bold: isActive
                }
            }
        }
    }
}
