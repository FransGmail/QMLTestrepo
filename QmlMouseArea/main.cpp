//jskjak
#include <QGuiApplication>
#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlEngine>
#include <QQmlContext>
#include "mousememory.h"
//main
int main(int argc, char *argv[])
{
	QApplication app(argc, argv);

	QScopedPointer<MouseMemory> mouse(new MouseMemory);

	QQmlApplicationEngine engine;
	engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

	engine.rootContext()->setContextProperty("mouse",mouse.data());


	if (engine.rootObjects().isEmpty())
		return -1;

	return app.exec();
}
