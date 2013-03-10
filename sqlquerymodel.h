#ifndef SQL_QUERY_MODEL_QML
#define SQL_QUERY_MODEL_QML

#include <QSqlQueryModel>

class SqlQueryModel : public QSqlQueryModel
{
    Q_OBJECT

    void generateRoleNames();

public:
    explicit SqlQueryModel(QObject *parent = 0);
    QVariant data(const QModelIndex &index, int role) const;

signals:

public slots:
    void setQuery(const QString &query, const QSqlDatabase &db = QSqlDatabase());
    void setQuery(const QSqlQuery &query);
};

#endif // SQL_QUERY_MODEL_QML
