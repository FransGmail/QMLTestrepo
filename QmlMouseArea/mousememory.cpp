#include "mousememory.h"


MouseMemory::MouseMemory(QObject *parent) : QObject(parent)
{

}

void MouseMemory::test()
{
	qDebug() << "Called from QML";
}

void MouseMemory::savePressed()
{
	
	QMessageBox msgBox;
	msgBox.setText("What do you want to save for me.");
	msgBox.setWindowTitle("Checking for qml call.");
	msgBox.exec();
}
