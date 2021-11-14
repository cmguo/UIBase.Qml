import QtQuick 2.12
import QtQuick.Controls 2.5
import UIBase 1.0


import QtWebEngine 1.8
import QtQml 2.2
import QtQuick 2.2
import QtQuick.Dialogs 1.2
import QtWebChannel 1.0

// this class is a copy from demo quicknanobrowser
WebEngineView {
    id: webEngineView
    focus: true
    url: ""

    Item {
        id : appSettings
        property var autoLoadImages: true
        property var javaScriptEnabled: true
        property var errorPageEnabled: true
        property var pluginsEnabled: true
        property var fullScreenSupportEnabled: true
        property var autoLoadIconsForPage: true
        property var touchIconsEnabled: true
        property var webRTCPublicInterfacesOnly : true
        property var devToolsEnabled: false
    }

    states: [
        State {
            name: "FullScreen"
            PropertyChanges {
            }
            PropertyChanges {
            }
        }
    ]

    settings.autoLoadImages: appSettings.autoLoadImages
    settings.javascriptEnabled: appSettings.javaScriptEnabled
    settings.errorPageEnabled: appSettings.errorPageEnabled
    settings.pluginsEnabled: appSettings.pluginsEnabled
    settings.fullScreenSupportEnabled: appSettings.fullScreenSupportEnabled
    settings.autoLoadIconsForPage: appSettings.autoLoadIconsForPage
    settings.touchIconsEnabled: appSettings.touchIconsEnabled
    settings.webRTCPublicInterfacesOnly: appSettings.webRTCPublicInterfacesOnly

    MessageDialog {
        id: sslDialog
        property var certErrors: []
        icon: StandardIcon.Warning
        standardButtons: StandardButton.No | StandardButton.Yes
        title: "Server's certificate not trusted"
        text: "Do you wish to continue?"
        detailedText: "If you wish so, you may continue with an unverified certificate. " +
                      "Accepting an unverified certificate means " +
                      "you may not be connected with the host you tried to connect to.\n" +
                      "Do you wish to override the security check and continue?"
        onYes: {
            certErrors.shift().ignoreCertificateError();
            presentError();
        }
        onNo: reject()
        onRejected: reject()

        function reject(){
            certErrors.shift().rejectCertificate();
            presentError();
        }
        function enqueue(error){
            certErrors.push(error);
            presentError();
        }
        function presentError(){
            visible = certErrors.length > 0
        }
    }


    onCertificateError: function(error) {
        error.defer();
        sslDialog.enqueue(error);
    }


    onFullScreenRequested: function(request) {
        if (request.toggleOn) {
            webEngineView.state = "FullScreen";
        } else {
            webEngineView.state = "";
        }
        request.accept();
    }

    onQuotaRequested: function(request) {
        if (request.requestedSize <= 5 * 1024 * 1024)
            request.accept();
        else
            request.reject();
    }

    onRegisterProtocolHandlerRequested: function(request) {
        console.log("accepting registerProtocolHandler request for "
                    + request.scheme + " from " + request.origin);
        request.accept();
    }

    onRenderProcessTerminated: function(terminationStatus, exitCode) {
        var status = "";
        switch (terminationStatus) {
        case WebEngineView.NormalTerminationStatus:
            status = "(normal exit)";
            break;
        case WebEngineView.AbnormalTerminationStatus:
            status = "(abnormal exit)";
            break;
        case WebEngineView.CrashedTerminationStatus:
            status = "(crashed)";
            break;
        case WebEngineView.KilledTerminationStatus:
            status = "(killed)";
            break;
        }
        print("Render process exited with code " + exitCode + " " + status);
        reloadTimer.running = true;
    }

    Timer {
        id: reloadTimer
        interval: 0
        running: false
        repeat: false
        onTriggered: parent.reload()
    }
}
