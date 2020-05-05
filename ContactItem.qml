import QtQuick 2.0
import QtQuick.Controls 2.13
import QtQuick.Layouts 1.13


Rectangle {
    id: me
    property alias icon: icon.source
    property alias text: label.text
    property alias text2: label2.text
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
            source: "icons/1.png"
            Layout.fillHeight: true
            Layout.preferredWidth: height
            Layout.margins: 4
        }

        ColumnLayout {
            Layout.fillWidth: true
            spacing: 4
            Label {
                id: label
                Layout.fillWidth: true
                text: "Имя контакта"
                font.bold: true
            }
            Label {
                id: label2
                Layout.fillWidth: true
                color: "gray"
                font.pixelSize: 10
            }
        }

    }
    MouseArea {
        id: area
        anchors.fill: parent
        hoverEnabled: true
        acceptedButtons: Qt.LeftButton | Qt.RightButton
        onClicked: {
            if (mouse.button === Qt.LeftButton )
                leftClick();
            if (mouse.button === Qt.RightButton )
                rightClick();
        }
    }
}

