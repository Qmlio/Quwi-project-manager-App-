pragma Singleton

import QtQuick 2.0

Item {

    readonly property string primary: p.name
    readonly property string secondary: s.name
    readonly property alias colors: mColors

    FontLoader {
        id: p
        source: "qrc:/assets/fonts/HindVadodara-Medium.ttf"
    }
    FontLoader {
        id: s
        source: "qrc:/assets/fonts/HindVadodara-Medium.ttf"
    }

    QtObject {
        id: mColors
        readonly property color primary: Qt.rgba(2 / 255, 20 / 255, 43 / 255, 1)
        readonly property color primary_light: "#595c5f"
        readonly property color white: Qt.rgba(1, 1, 1, 1)
    }
}
