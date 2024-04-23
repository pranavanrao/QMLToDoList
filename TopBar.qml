import QtQuick 2.12

Rectangle {
    id: root
    height: 60
    width: parent.width
    color: "green"

    Text {
        id: titleText
        text: qsTr("ToDo List")
        font.pointSize: 12
        font.bold: true
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 30
        color: "white"
    }
}
