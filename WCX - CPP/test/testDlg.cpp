
// testDlg.cpp : implementation file
//

#include "stdafx.h"
#include "test.h"
#include "testDlg.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#endif


// CtestDlg dialog




CtestDlg::CtestDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CtestDlg::IDD, pParent)
{
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);
}

void CtestDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
}

BEGIN_MESSAGE_MAP(CtestDlg, CDialog)
	ON_WM_CLOSE()
	ON_WM_PAINT()
	ON_WM_QUERYDRAGICON()
	ON_MESSAGE(WM_WONITOREVENT, OnCaptureNotification)
    ON_MESSAGE(WM_WONITOREVENT_HOTKEY, OnCaptureNotificationHotkey)
END_MESSAGE_MAP()

// CtestDlg message handlers

BOOL CtestDlg::OnInitDialog()
{
	CDialog::OnInitDialog();

	// Set the icon for this dialog.  The framework does this automatically
	//  when the application's main window is not a dialog
	SetIcon(m_hIcon, TRUE);			// Set big icon
	SetIcon(m_hIcon, FALSE);		// Set small icon

	// TODO: Add extra initialization here

	StartMonitoring();

	g_pMonitorEventListener = new CWEventListener(this->m_hWnd);
	g_pMonitorEventListener->AddRef();
	g_pMonitorEventListener->AttachToSource(g_wMonitor);

	return TRUE;  // return TRUE  unless you set the focus to a control
}

// If you add a minimize button to your dialog, you will need the code below
//  to draw the icon.  For MFC applications using the document/view model,
//  this is automatically done for you by the framework.

void CtestDlg::OnPaint()
{
	if (IsIconic())
	{
		CPaintDC dc(this); // device context for painting

		SendMessage(WM_ICONERASEBKGND, reinterpret_cast<WPARAM>(dc.GetSafeHdc()), 0);

		// Center icon in client rectangle
		int cxIcon = GetSystemMetrics(SM_CXICON);
		int cyIcon = GetSystemMetrics(SM_CYICON);
		CRect rect;
		GetClientRect(&rect);
		int x = (rect.Width() - cxIcon + 1) / 2;
		int y = (rect.Height() - cyIcon + 1) / 2;

		// Draw the icon
		dc.DrawIcon(x, y, m_hIcon);
	}
	else
	{
		CDialog::OnPaint();
	}
}

// The system calls this function to obtain the cursor to display while the user drags
//  the minimized window.
HCURSOR CtestDlg::OnQueryDragIcon()
{
	return static_cast<HCURSOR>(m_hIcon);
}


void CtestDlg::Hotkey2MonitorParams(const DWORD dwHotkey, LONG &nModifier, LONG &nKey)
{
	nModifier = 0;
	nKey = LOBYTE(LOWORD(dwHotkey));
	WORD wModifiers = HIBYTE(LOWORD(dwHotkey));
	if(wModifiers & HOTKEYF_ALT)
		nModifier |= wmKeyAlt;
	if(wModifiers & HOTKEYF_CONTROL)
		nModifier |= wmKeyCtrl;
	if(wModifiers & HOTKEYF_EXT)
		nModifier |= wmKeyWin;
	if(wModifiers & HOTKEYF_SHIFT)
		nModifier |= wmKeyShift;
}

// function for using the full text method when not able to capture with native method
CString CtestDlg::CaptureFullText(const CPoint &pt1, const CPoint &pt2)
{
	CComPtr<IUIControl>	spUIC;
	CComBSTR		bstrVal;
	CString m_strResult;
	m_strResult.Empty();

	HRESULT hRes;

	hRes = spUIC.CoCreateInstance(CLSID_UIControl);
	if(hRes != S_OK)
	{
		return "";
	}
	hRes = spUIC->CreateFromScreenPoint(pt1.x, pt1.y);
	if(hRes != S_OK)
	{
		return "";
	}
	spUIC->get_Value(&bstrVal);
	if(bstrVal.m_str)
	{	
		m_strResult = bstrVal.m_str;
	}
	if(m_strResult.IsEmpty())
	{
		bstrVal = (BSTR)NULL;
		spUIC->get_Name(&bstrVal);
		if(bstrVal.m_str)
		{
			m_strResult = bstrVal.m_str;
		}
	}
	return m_strResult;
}

void CtestDlg::ReleaseObjects()
{
    if(g_wMonitor)
	{
        g_wMonitor->Stop();
	}
    if(g_wCapture)
    {
        g_wCapture->EndCaptureSession();
        g_wCapture.Release();
    }
	if(g_pMonitorEventListener)
	{
		g_pMonitorEventListener->DetachFromSource();
		g_pMonitorEventListener->Release();
	}
    if(g_wMonitor)
	{
        g_wMonitor.Release();
	}
}

void CtestDlg::ProcessResult(CComPtr<IWResult> objResult)
{
	CString strResult, strLeftContext, strRightContext,
			strParagraph, strClickedChar, strCharPos;

	// extract the result
	strResult = objResult->Text.GetBSTR();

	// get the left context
	strLeftContext = objResult->LeftContext.GetBSTR();

	// get the right context
	strRightContext = objResult->RightContext.GetBSTR();

	// get the paragraph
	strParagraph = objResult->Paragraph.GetBSTR();

	// extract the clicked char and its index
	LONG nIndex = objResult->CharIndex;
	if (nIndex >= 0)
	{
		if(nIndex >= strResult.GetLength())
			nIndex = strResult.GetLength() - 1;
		
		strClickedChar = strResult.GetAt(nIndex);
		strCharPos.Format(_T("%d"), ++ nIndex);
	}

	// add code to process your result

	CEdit *clickedWord = (CEdit*)GetDlgItem(IDC_CAPT_TEXT);
	clickedWord->SetWindowText(strResult);

	CEdit *leftCtx = (CEdit*)GetDlgItem(IDC_LEFT_CTX);
	leftCtx->SetWindowText(strLeftContext);

	CEdit *rightCtx = (CEdit*)GetDlgItem(IDC_RIGHT_CTX);
	rightCtx->SetWindowText(strRightContext);

	CEdit *parag = (CEdit*)GetDlgItem(IDC_PARAGRAPH);
	parag->SetWindowText(strParagraph);

}

LRESULT CtestDlg::OnCaptureNotification(WPARAM wParam, LPARAM lParam)
{
	LPWMONITOR_EVENT lpEvent = (LPWMONITOR_EVENT)lParam;
	
	if (NULL != lpEvent)
	{
		CComPtr<IWResult> objResult;
		PerformCapture((HWND)(LONG_PTR)lpEvent->hWnd, CPoint(lpEvent->x1, lpEvent->y1), CPoint(lpEvent->x2, lpEvent->y2), objResult);
		
		// do something with the result
		ProcessResult(objResult);

		delete lpEvent;
	}

	return 0L;
}

LRESULT CtestDlg::OnCaptureNotificationHotkey(WPARAM wParam, LPARAM lParam)
{
	LPWMONITOR_EVENT lpEvent = (LPWMONITOR_EVENT)lParam;
	CComPtr<IWResult> objResult;

	long hWnd = 0, x = 0, y = 0;
    if( g_nHotkeyCursorId == lpEvent->id)
    {
        if (S_OK == g_wCapture->GetCursorInfo(&hWnd, &x, &y))
		{
           PerformCapture((HWND)(LONG_PTR)hWnd, CPoint(x, y), CPoint(x, y), objResult);
		}
	}
    else if (g_nHotkeyCaretId == lpEvent->id)
    {
        if (S_OK == g_wCapture->GetCaretInfo(&hWnd, &x, &y))
		{
            PerformCapture((HWND)(LONG_PTR)hWnd, CPoint(x, y), CPoint(x, y), objResult);
		}
	}
    else if (g_nHotkeySelectedTextId == lpEvent->id)
    {
		PerformCapture((HWND)(LONG_PTR)hWnd, CPoint(x, y), CPoint(x, y), objResult);
    }

	// do something with the result
	ProcessResult(objResult);
	////////////////

	delete lpEvent;

	return 0L;
}

void CtestDlg::OnClose()
{
	ReleaseObjects();
	CWnd::OnClose();
}

// replace these functions with those generated by the code generator
// in order to capture differently - as you selected in the demo application
void CtestDlg::StartMonitoring()
{
	g_wCapture.CoCreateInstance(CLSID_WCaptureX);
	g_wMonitor.CoCreateInstance(CLSID_WMonitorX);
	
	DWORD color = 61440;
	W_LINE_STYLE wLineStyle = wmLineDot;
	W_KEY wKey = wmKeyCtrl;
	W_MOUSE wMouse = wmMouseRight;	
	
	//wMouse |= wmMouseDoubleClick;	
	
	DWORD dwHotkeyCursor = 845;	
	DWORD dwHotkeyCaret = 835;
	DWORD dwIdleTime = 2;	
	DWORD dwHotkeySelectedText = 852;

	g_wMonitor->LineStyle = wLineStyle;
    g_wMonitor->LineColor = color;
	
	g_wMonitor->Start(wKey, wMouse, ATL_VARIANT_TRUE);	
	
	g_wMonitor->Start2(dwIdleTime*1000);	
	
	LONG nModifier, nKey;	
	
	nModifier = nKey = 0;
	Hotkey2MonitorParams(dwHotkeyCursor, nModifier, nKey);
	g_wMonitor->Start3(nModifier, nKey, &g_nHotkeyCursorId);	
	
	nModifier = nKey = 0;
	Hotkey2MonitorParams(dwHotkeyCaret, nModifier, nKey);
	g_wMonitor->Start3(nModifier, nKey, &g_nHotkeyCaretId);	
	
	nModifier = nKey = 0;
	Hotkey2MonitorParams(dwHotkeySelectedText, nModifier, nKey);
	g_wMonitor->Start3(nModifier, nKey, &g_nHotkeySelectedTextId);
}

void CtestDlg::PerformCapture(HWND hWnd, const CPoint &pt1, const CPoint &pt2, CComPtr<IWResult> &objResult)
{
	CComPtr<IWInput> objInput;
	HRESULT hRes = objInput.CoCreateInstance(CLSID_WInput);

	// set capture options
	WORD wOptions = 0;

	// set the get paragraph flag
	wOptions |= wCaptureOptionsGetParagraph;
	// set the highlight word flag
	wOptions |= wCaptureOptionsHighlightWords;
	// set the getContext flag
	wOptions |= wCaptureOptionsGetContext;
	
	//set capture parameters
	objInput->Hwnd = (LONG)(LONG_PTR)hWnd;
	objInput->StartX = pt1.x;
	objInput->StartY = pt1.y;
	objInput->EndX = pt2.x;
	objInput->EndY = pt2.y;
	objInput->Options = wOptions;

	// set the number of context words
	objInput->ContextWordsLeft = 1;
	objInput->ContextWordsRight = 1;
	CString strResult;

	objResult = g_wCapture->Capture(objInput);

	// get the text from the capture
	strResult = objResult->Text.GetBSTR();

	
	//use OCR if native method fails
	if (strResult.IsEmpty())
	{
		wOptions |= wCaptureOptionsGetTessOCRText;
		objInput->Options = wOptions;
		objResult = NULL;
		objResult = g_wCapture->Capture(objInput);
		strResult = objResult->Text.GetBSTR();
	}
}
