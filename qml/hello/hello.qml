// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.0

Rectangle {
	width: 480
	height: 272
	Image {
		source: "background.bmp"
	}

	Text {
	 color: "#ffffff"
		anchors.centerIn: parent

		text: "Hello World"
  smooth: true
  styleColor: "#0320b3"
  style: Text.Raised
  font.pointSize: 50
	}
	MouseArea {
		anchors.fill: parent
		onClicked: {
			Qt.quit();
		}
	}
}
