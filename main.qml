import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("ToDo List")
    color: "#C4C4C4"

    ListModel {
        id: taskModel
    }

    Item {
        id: root
        anchors.fill: parent

        TopBar {
            id: topBar
            anchors.top: root.top
            z: 10
        }

        TaskBox {
            id: sectionMain
            anchors.top: topBar.bottom
            anchors.bottom: bottomBar.top
            z: 0
        }

        BottomBar {
            id: bottomBar
            anchors.bottom: root.bottom
            anchors.left: root.left
            anchors.right: root.right
            anchors.margins: 20
            z: 10
        }
    }
}
