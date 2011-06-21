
// testDlg.h : header file
//

#pragma once

#include "stdafx.h"
#include "WEventListener.h"

// CtestDlg dialog
class CtestDlg : public CDialog
{
// Construction
public:
	CtestDlg(CWnd* pParent = NULL);	// standard constructor

// Dialog Data
	enum { IDD = IDD_TEST_DIALOG };

	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support


// Implementation
protected:
	
	HICON m_hIcon;

	// Generated message map functions
	virtual BOOL OnInitDialog();
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();
	DECLARE_MESSAGE_MAP()


public:
	
	CComPtr<IWCaptureX> g_wCapture;
	CComPtr<IWMonitorX> g_wMonitor;
	LONG g_nHotkeyCaretId;
	LONG g_nHotkeyCursorId;
	LONG g_nHotkeySelectedTextId;
	CWEventListener *g_pMonitorEventListener;
	
	void Hotkey2MonitorParams(const DWORD dwHotkey, LONG &nModifier, LONG &nKey);
	CString CaptureFullText(const CPoint &pt1, const CPoint &pt2);
	void ReleaseObjects();
	void ProcessResult(CComPtr<IWResult> objResult);
	void StartMonitoring();
	void PerformCapture(HWND hWnd, const CPoint &pt1, const CPoint &pt2, CComPtr<IWResult> &objResult);
	LRESULT OnCaptureNotification(WPARAM wParam, LPARAM lParam);
	LRESULT OnCaptureNotificationHotkey(WPARAM wParam, LPARAM lParam);
	
	afx_msg void OnEnChangeEdit3();
	
	void OnClose();
};
