import QtQuick 2.14
import QtQuick.Controls 2.5
import Quwi.Constants 1.0

Rectangle {
    property real tempProgress: 0 // prevent reloading the progress bar
    color: Constants.colors.white
    visible: (opacity > 0.1)

    Component.onCompleted: show()

    Connections {
        target: splashScreenManager

        function onProgressChanged(progress) {
            if (tempProgress < progress)
                control.value = progress

            tempProgress = progress
        }
    }

    Behavior on opacity {
        OpacityAnimator {
            duration: 300
        }
    }
    Column {
        anchors.centerIn: parent
        spacing: 32
        Text {
            id: appName
            font.pixelSize: 14
            scale: 1.1
            opacity: 0
            font.letterSpacing: 4
            font.family: Constants.primary
            color: Constants.colors.primary_light
            anchors.horizontalCenter: parent.horizontalCenter
            text: qsTr("Quwi Project Manager")
        }
    }

    ProgressBar {
        opacity: .2
        id: control
        Behavior on value {
            NumberAnimation {
                duration: 300
            }
        }
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 80
        from: 0
        to: 100
        value: 0
        indeterminate: true
        height: 2

        background: Rectangle {
            implicitWidth: 200
            implicitHeight: 6
            color: "#e6e6e6"
            radius: 3
        }

        contentItem: Item {
            implicitWidth: 200
            implicitHeight: 4

            Rectangle {
                width: control.visualPosition * parent.width
                height: parent.height
                radius: 2
                color: Constants.colors.primary
            }
        }
    }
    //version numbers
    Row {
        id: copyrightRow
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 16
        spacing: 4
        opacity: 0

        Text {
            anchors.verticalCenter: parent.verticalCenter
            font.letterSpacing: 2
            font.pixelSize: 12
            font.family: Constants.primary
            text: qsTr("1.0.0")
            color: Constants.colors.primary
        }
    }
    states: [
        State {
            name: "show"
            PropertyChanges {
                target: appName
                scale: 1
                opacity: 1
            }
            PropertyChanges {
                target: copyrightRow
                opacity: 1
            }
        }
    ]
    transitions: [
        Transition {
            from: ""
            to: "show"
            reversible: false
            NumberAnimation {
                properties: "scale,opacity"
                easing.type: Easing.OutExpo
                duration: 3000
            }
        }
    ]

    function show() {
        opacity = 1
        state = "show"
    }
    function hide() {
        opacity = 0
    }
}
