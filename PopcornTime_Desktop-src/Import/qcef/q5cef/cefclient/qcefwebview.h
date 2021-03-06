#ifndef CEFCLIENT_QCEFWEBVIEW_H
#define CEFCLIENT_QCEFWEBVIEW_H

#include <QWidget>
#include <QResizeEvent>
#include <QCloseEvent>
#include <QShowEvent>
#include <QUrl>
#include <QMutex>
#include <QWindow>
#include "cefclient/client_handler.h"


class QCefWebView : public QWidget,
                    public ClientHandler::Listener {
  Q_OBJECT
 public:
  enum BrowserState {
    kNone,
    kCreating,
    kCreated,
  };

  static const QString kUrlBlank;

  QCefWebView(QWidget* parent = 0);
  virtual ~QCefWebView();

  void load(const QUrl& url);
  void setHtml(const QString& html, const QUrl& baseUrl = QUrl());
  QUrl url() const;

 public slots:
  void back();
  void forward();
  void reload();
  void stop();

  QVariant evaluateJavaScript(const QString& scriptSource);

 signals:
  void titleChanged(const QString& title);
  void urlChanged(const QUrl& url);
  void loadStarted();
  void loadFinished(bool ok);
  void loadError( const QString& url, const QString& errorText, int errorCode );

  void navStateChanged(bool canGoBack, bool canGoForward);
  void jsMessage(const QString& name, const QVariantList& args);
  void haveWindow( QWindow * win );

 protected:
  virtual void resizeEvent(QResizeEvent*);
  virtual void closeEvent(QCloseEvent*);
  virtual void showEvent(QShowEvent*);
  virtual void customEvent(QEvent*);

  virtual void OnAddressChange(const QString& url);
  virtual void OnTitleChange(const QString& title);
  virtual void SetLoading(bool isLoading);
  virtual void SetNavState(bool canGoBack, bool canGoForward);
  virtual void OnLoadError( const QString& url, const QString& errorText, int errorCode );
  virtual void OnAfterCreated();
  virtual void OnMessageEvent(MessageEvent* e);

 private:
  bool CreateBrowser(const QSize& size);
  CefRefPtr<CefBrowser> GetBrowser() const;
  void ResizeBrowser(const QSize& size);
  bool BrowserLoadUrl(const QUrl& url);

  BrowserState browser_state_;
  bool need_resize_;
  bool need_load_;
  QUrl url_;
  QMutex mutex_;

  Q_DISABLE_COPY(QCefWebView)
};

#endif  // CEFCLIENT_QCEFWEBVIEW_H
