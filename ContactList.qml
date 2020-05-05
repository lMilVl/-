import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.13


ListView {
    id: list
    clip: true // Запрещает любую адрессовку элементов за пределами списка
    boundsBehavior: ListView.StopAtBounds // Отключение подпружинивания элементов
    ScrollBar.vertical: ScrollBar{}
    delegate: ContactItem { // Свойство, которое определяет компонент, с помощью которого будет адрессовываться каждый элемент списка
        text: name
        text2: time
        icon: avatar
        selected: list.currentIndex === index
        onLeftClick: {
            list.currentIndex = index // Хранит номер текущего элемента
        }
    }
}
