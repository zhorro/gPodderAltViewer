#include <QApplication>
#include <QDebug>
#include <QDir>

#include "qmlapplicationviewer.h"

#include <QtSql/QSqlDatabase>
#include <QtSql/QSqlRelationalTableModel>
#include <QtSql/QSqlError>

#include <QtDeclarative/qdeclarative.h>
#include <QtDeclarative/QDeclarativeContext>

#include "sqlquerymodel.h"

Q_DECL_EXPORT int main(int argc, char *argv[])
{
    QScopedPointer<QApplication> app(createApplication(argc, argv));

    QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE");
    db.setDatabaseName(QDir::homePath()+QDir::separator()+"gPodder/Database");

    if (db.open())
    {
        SqlQueryModel * model = new SqlQueryModel();
        model->setQuery("SELECT * FROM episode");

        QmlApplicationViewer viewer;
        viewer.setOrientation(QmlApplicationViewer::ScreenOrientationAuto);

        QDeclarativeContext *ctxt = viewer.rootContext();
        //ctxt->setContextProperty("testModel", QVariant::fromValue(dataList));
        ctxt->setContextProperty("testModel", model);
        viewer.setMainQmlFile(QLatin1String("qml/gPodderAltViewer/main.qml"));
        viewer.showExpanded();




        return app->exec();
    }
    else
    {
        qDebug() << "Error is " << db.lastError().text();
    }
}
