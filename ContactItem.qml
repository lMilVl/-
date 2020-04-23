import QtQuick 2.0
import QtQuick.Controls 2.13
import QtQuick.Layouts 1.13

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
        spacing: 7
        Image {
            id: icon
            source: "icons/person.png"
            Layout.fillHeight: true
            Layout.preferredWidth: height
            Layout.margins: 7
        }
        Label {
            id: label
            Layout.fillWidth: true
            text: "test"
            font.bold: true

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
