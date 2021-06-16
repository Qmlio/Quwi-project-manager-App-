import QtQuick 2.14
import QtQuick.Controls 2.12
import QtWebEngine 1.1
import Quwi.Constants 1.0

Item {

    property bool pageLoaded: false
    readonly property url loadUrl: "https://quwiproject.herokuapp.com/"

    BusyIndicator {
        id: busyLoader
        running: visible
        visible: false
        anchors.centerIn: parent
        width: height
        height: 50
    }
    Column {
        id: controlColumn
        visible: false
        anchors.centerIn: parent
        spacing: 16
        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 30
            font.family: Constants.primary
            color: Constants.colors.primary
            text: qsTr("Oops!")
        }
        Text {
            font.pixelSize: 16
            color: Constants.colors.primary_light
            anchors.horizontalCenter: parent.horizontalCenter
            font.family: Constants.primary
            font.letterSpacing: .5
            text: qsTr("Connection lost, Try again later")
        }
        // spacer
        Item {
            height: 16
            width: height
        }
        Button {
            id: control
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Reload"
            opacity: down ? 0.8 : 1

            contentItem: Text {
                text: control.text
                font.family: Constants.primary
                font.pixelSize: 16
                opacity: enabled ? 1.0 : 0.3
                color: Constants.colors.white
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }

            background: Rectangle {
                implicitWidth: 100
                color: Constants.colors.primary
                implicitHeight: 36
                opacity: enabled ? 1 : 0.3
                radius: 2
            }
            onClicked: {
                controlColumn.visible = false
                mainWebEngineView.reload()
            }
        }
    }
    WebEngineView {
        visible: pageLoaded
        id: mainWebEngineView
        anchors.fill: parent

        url: loadUrl

        onLoadProgressChanged: {

            splashScreen.setProgress(loadProgress)
        }
        onLoadingChanged: {
            if (loadRequest.status === WebEngineLoadRequest.LoadSucceededStatus) {

                pageLoaded = true
            }

            if (loadRequest.status === WebEngineLoadRequest.LoadFailedStatus) {

                controlColumn.visible = true
                busyLoader.visible = false
                if (url == loadUrl)
                    pageLoaded = false
            }
        }
    }
}
