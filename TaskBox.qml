import QtQuick 2.12

Rectangle {
    id: root
    width: parent.width
    color: "#C4C4C4"

    ListView {
        id: taskList
        model: taskModel
        spacing: 5
        anchors.centerIn: parent
        width: parent.width * 0.8
        height: parent.height * 0.8

        delegate: TaskItem {}
    }
}
