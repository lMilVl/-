import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.13
import QtQuick.Layouts 1.12

RowLayout {
    signal newItem(string text)
    TextField {
        id: textField
        selectByMouse: true // Возможность выделять текст
        Layout.fillWidth: true
        placeholderText: "Введите имя пользователя"
    }

    function add()
    {
        newItem(textField.text);
        textField.clear();

    }

    Button{
        Layout.preferredHeight: 40
        Layout.preferredWidth: 40
        background: Rectangle {
            Image {
                anchors.fill: parent
                source: "icons/AddUser.png"
            }
        }

        onClicked: {
            add();
        }
    }

    Keys.onReturnPressed: { // Обработка нажатия клавиш
        add();
    }
    Keys.onEnterPressed: {
        add();
    }
}
