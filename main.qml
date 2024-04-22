import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")
    color: "#C4C4C4"

    ListModel {
        id: taskModel
    }

    Item {
        id: root
        anchors.fill: parent

        Rectangle {
            id: topBar
            height: 60
            width: parent.width
            color: "green"
            anchors.top: root.top
            z: 10

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

        Rectangle {
            id: sectionMain
            width: parent.width
            anchors.top: topBar.bottom
            anchors.bottom: bottomBar.top
            color: "#C4C4C4"
            z: 0

            ListView {
                id: taskList
                model: taskModel
                spacing: 5
                anchors.centerIn: parent
                width: parent.width * 0.8
                height: parent.height * 0.8

                delegate: Rectangle {
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
            }
        }

        Row {
            id: bottomBar
            height: 60
            width: parent.width
            anchors.bottom: root.bottom
            anchors.left: root.left
            anchors.right: root.right
            anchors.margins: 20
            z: 10

            TextField {
                id: textInput
                width: parent.width * 0.9
                height: parent.height
                placeholderText: "Enter your todo task"
                placeholderTextColor: "green"
            }

            Image {
                id: addIcon
                source: "qrc:/images/add.png"
                width: parent.width * 0.1
                height: parent.height

                MouseArea {
                    anchors.fill: parent

                    onClicked: {
                        if (textInput.text === "") {
                            console.log("No items to append")
                        } else {
                            taskModel.append({"_title": textInput.text})
                            textInput.text = ""
                        }
                    }
                }
            }
        }
    }
}
