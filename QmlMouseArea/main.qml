import QtQuick 2.7
import QtQuick.Window 2.2
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3

Window {
	visible: true
	width: 500
	height: 500
	id: root
	title: qsTr("Check Mouse Area")
	
	Row{
		id:tools
		Button{
			id:clear
			text:"Clear"
			onClicked: {
				canvas.clear()		
			}
		}
		
		Button{
			id:save
			text:"Save"
			onClicked: {
				mouse.savePressed()
				
			}
		}
		
		Button{
			id:load
			text:"Load"
			onClicked: {
				
			}
		}
		
		TextEdit {
			id: textEdit
			text: qsTr("Enter text")
			//verticalAlignment: Text.AlignVCenter
			//anchors.top: parent.top + 120
			//anchors.horizontalCenter: parent.horizontalCenter
			//anchors.topMargin: 20
			Rectangle {
				//anchors.fill: parent
				//anchors.margins: -10
				color: "red"
				border.width: 3
			}
		}
		
	}
	
	Canvas{
		id: canvas
		anchors.top: tools.bottom
		width:500
		height: 500
		property int lastX: 0
		property int lastY: 0
		
		function clear() {
			var ctx = getContext("2d")
			ctx.reset()
			requestPaint()
			mouse.clear()
		}
		
		onPaint:{
			var ctx = getContext("2d")
			ctx.lineWidth = 2
			ctx.strokeStyle = color.red
			ctx.beginPath()
			ctx.moveTo(lastX,lastY)
			lastX = mousearea.mouseX
			lastY = mousearea.mouseY
			ctx.lineTo(lastX, lastY)
			ctx.stroke()
			
			mouse.test()
		}
		
		MouseArea{
			id:mousearea
			anchors.fill: parent
			onPressed:{
				canvas.lastX = mouseX
				canvas.lastY = mouseY
				
			}
			onPositionChanged: {
				canvas.requestPaint()
				
			}
			
		}
		
	}
	
}
