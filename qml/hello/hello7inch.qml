// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.0

Rectangle {
	width: 800
	height: 400
	Text {
		anchors.centerIn: parent
		text: "Hello World"
	}
	MouseArea {
		anchors.fill: parent
		onClicked: {
			Qt.quit();
		}
	}
}
