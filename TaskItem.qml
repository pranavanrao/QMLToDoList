import QtQuick 2.12

Rectangle {
    id: taskItm
    width: taskList.width
    height: 60
    color: "white"
    radius: 10

    property string title

    title: _title

    Row {
        id: taskItemRow
        anchors.fill: parent

        Item {
            id: taskBulletItem
            width: parent.width * 0.1
            height: parent.height

            Rectangle {
                width: 10
                height: 10
                color: "green"
                anchors.centerIn: parent
                radius: width
            }
        }

        Text {
            id: taskText
            text: taskItm.title
            width: parent.width * 0.8
            height: parent.height
            verticalAlignment: Text.AlignVCenter
        }

        Image {
            id: deleteIcon
            source: "qrc:/images/delete.png"
            width: parent.width * 0.1
            height: parent.height

            MouseArea {
                anchors.fill: parent

                onClicked: taskModel.remove(index)
            }
        }
    }
}
