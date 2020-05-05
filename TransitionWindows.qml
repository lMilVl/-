import QtQuick 2.0
import QtQuick.Controls 2.13
import QtQuick.Layouts 1.13
Rectangle {
    Layout.preferredHeight: 50
    Layout.preferredWidth: parent.width

    Rectangle {
        height: 1
        radius: 1
        color: "#dddddd"
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right

    }

    RowLayout {
        anchors.fill: parent
        anchors.margins: 10
        Image {
            id: pic1
            source: "/icons/contacts.png"
            Layout.preferredHeight: parent.height
            Layout.preferredWidth: height
            Layout.alignment : Qt.AlignLeft
            Layout.leftMargin: 20
        }

        Image {
            source: "/icons/chats.png"
            Layout.preferredHeight: parent.height + 10
            Layout.preferredWidth: height + 5
            Layout.alignment : Qt.AlignHCenter
        }
        Image {
            source: "/icons/settings.png"
            Layout.preferredHeight: parent.height
            Layout.preferredWidth: height
            Layout.alignment : Qt.AlignRight
            Layout.rightMargin: 20
        }
    }

}
