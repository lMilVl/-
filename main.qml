import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.13
import QtQuick.Layouts 1.13

Window {
    visible: true
    width: 320
    height: 480
    title: qsTr("Mail.ru Агент")

    ListModel { // Для определения индивидуальных значений для элементов списков, их представление
        id: contactsModel
        ListElement { // Необходим для хранения данных элементов
            name: "Ирина"
            time: "Был(-а) вчера 21:00"
            avatar: "/icons/Avatar3.png"
        }
        ListElement {
            name: "Анна"
            time: "Был(-а) 26 апр. в 14:00"
            avatar: "/icons/Avatar2.png"
        }
        ListElement {
            name: "Александр"
            time: "Онлайн"
            avatar: "/icons/Avatar1.png"
        }
    }
    ColumnLayout {
        anchors.fill: parent
        spacing: 0
        Text {
            Layout.alignment: Qt.AlignCenter
            Layout.margins: 5
            text: "Контакты"
            font.pixelSize: 12
        }

        MainToolBar {
            Layout.fillWidth: true
            Layout.margins: 4
            onNewItem: {
                contactsModel.append({name : text}); // Чтобы добавить новый элемент
            }
        }

        ContactList {
            id: list
            Layout.fillHeight: 2 * parent.height / 4
            Layout.fillWidth: true
            model: contactsModel
            onMenu: {
                contactListMenu.popup();
            }
        }
        TransitionWindows {
            Layout.fillWidth: true
        }
    }
    Menu {
        id: contactListMenu
        modal: true  // Чтобы при открытии меню никуда более нельзя было нажать
        MenuItem {
            text: "Удалить"
            onTriggered: { // Обработчик срабатывания меню
                contactsModel.remove(list.menuIndex);
            }
        }
    }
}
