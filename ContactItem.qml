import QtQuick 2.0
import QtQuick.Controls 2.13
import QtQuick.Layouts 1.13
//import QtGraphicalEffects 1.13


Rectangle {
    id: me
    property alias icon: icon.source
    property alias text: label.text
    property bool selected: false
    signal leftClick()
    signal rightClick()

    width: parent.width
    height: 60

    color: {
        if (selected) // Если будет выбрано
            return "#4fc1e9"
        if (area.containsMouse) // Если курсор находится внутри области
            return "#f1f1f1"
        return "white";
    }


    RowLayout {
        anchors.fill: parent
        anchors.leftMargin: 4
        anchors.rightMargin: 4
        spacing: 4
        Image {
            id: icon
            //            property bool rounded: true // Для скругления изображения
            //            property bool adapt: true
            //            layer.enabled: rounded
            //            layer.effect: OpacityMask {
            //                maskSource: Item {
            //                    width: icon.width
            //                    height: icon.height
            //                    Rectangle {
            //                        anchors.centerIn: parent
            //                        width: icon.adapt ? icon.width : Math.min(icon.width, icon.height)
            //                        height: icon.adapt ? icon.height : width
            //                        radius: Math.min(width, height)
            //                    }
            //                }
            //            }
            source: "icons/1.png"
            Layout.fillHeight: true
            Layout.preferredWidth: height
            Layout.margins: 4
            states: [
                State {
                    name: "State1"
                    PropertyChanges {
                        target: icon
                        source: "icons/1.png"
                    }
                },

                State {
                    name: "State2"
                    PropertyChanges {
                        target: icon
                        source: "icons/2.png"

                    }
                },

                State {
                    name: "State3"
                    PropertyChanges {
                        target: icon
                        source: "icons/3.png"

                    }
                },

                State {
                    name: "State4"
                    PropertyChanges {
                        target: icon
                        source: "icons/4.png"
                    }
                },

                State {
                    name: "State5"
                    PropertyChanges {
                        target: icon
                        source: "icons/5.jpg"

                    }
                },

                State {
                    name: "State6"
                    PropertyChanges {
                        target: icon
                        source: "icons/6.png"

                    }
                }
            ]

        }

        Column {
            Layout.fillWidth: true
            spacing: 8
            Label {

                id: label
                text: "test"
                font.bold: true
            }
            Label {
                id: label2
                text: "Message"

            }
        }

    }
    Rectangle {
        height: 1
        radius: 1
        color: "#dddddd"
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
    }
    MouseArea {
        id: area
        anchors.fill: parent
        hoverEnabled: true
        acceptedButtons: Qt.LeftButton | Qt.RightButton
        onClicked: {

            if(icon.state == "State1")
                icon.state = "State2"
            else if (icon.state == "State2")
                icon.state = "State3"
            else if (icon.state == "State3")
                icon.state = "State4"
            else if (icon.state == "State4")
                icon.state = "State5"
            else if (icon.state == "State5")
                icon.state = "State6"
            else
                icon.state = "State1"

            if (mouse.button === Qt.LeftButton )
                leftClick();
            if (mouse.button === Qt.RightButton )
                rightClick();


        }
    }
}

