import QtQuick 2.12
import QtQuick.Controls 2.15

Row {
    id: root
    height: 60
    width: parent.width

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
