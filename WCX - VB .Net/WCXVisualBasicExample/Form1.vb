Imports WordCapture
Imports System.Runtime.InteropServices

Public Class Form1
    <DllImport("user32.dll")> _
    Public Shared Function RegisterHotKey(ByVal hWnd As IntPtr, ByVal id As Integer, _
                ByVal fsModifiers As Integer, ByVal virtualKey As Keys) As Boolean
    End Function
    <DllImport("user32.dll")> _
      Public Shared Function UnregisterHotKey(ByVal hWnd As IntPtr, ByVal id As Integer) As Boolean
    End Function
    Public Enum E_CAPTURE_MASK
        E_CAPTURE_NONE = &H0&
        E_CAPTURE_MOUSE = &H1&
        E_CAPTURE_MOUSE_GEST = &H2&
        E_CAPTURE_CARET = &H4&
        E_CAPTURE_CURSOR = &H8&
        E_CAPTURE_HOVER = &H10&
        E_CAPTURE_HOTKEY = &H20&
        E_CAPTURE_SELECTED_TEXT = &H40&
    End Enum

    Private m_wCapture As WCaptureX = ComFactory.Instance.NewWCaptureX()
    Private m_wMonitor As WMonitorX = ComFactory.Instance.NewWMonitorX
    Private m_captParams As CAPTURE_PARAMS = New CAPTURE_PARAMS
    Private m_nHotkeyCursorId As Integer
    Private m_nHotkeyCaretId As Integer
    Private m_nHotkeySelectedTextId As Integer

    Public Const HOTKEYF_ALT As Integer = &H4&
    Public Const HOTKEYF_SHIFT As Integer = &H1&
    Public Const HOTKEYF_CONTROL As Integer = &H2&
    Public Const HOTKEYF_EXT As Integer = &H8&

    Public Const WM_HOTKEY As Short = &H312S

    Public Function LowWord(ByVal value As Integer) As Integer
        Return (value And &HFFFF&)
    End Function
    Public Function HighWord(ByVal value As Integer) As Integer
        Return value / 2 ^ 16
    End Function
    Public Function LowByte(ByVal value As Integer) As Integer
        Return value And &HFF&
    End Function
    Public Function HighByte(ByVal value As Integer) As Integer
        Return value / 2 ^ 8
    End Function
    Private Sub Hotkey2MonitorParams(ByVal dwHotkey, ByRef nModifier, ByRef nKey)
        nModifier = 0
        nKey = LowByte(LowWord(dwHotkey))
        Dim wModifiers = HighByte(LowWord(dwHotkey))

        If (wModifiers And HOTKEYF_ALT) <> 0 Then
            nModifier = nModifier Or W_KEY.wmKeyAlt
        End If

        If (wModifiers And HOTKEYF_CONTROL) <> 0 Then
            nModifier = nModifier Or W_KEY.wmKeyCtrl
        End If

        If (wModifiers And HOTKEYF_EXT) <> 0 Then
            nModifier = nModifier Or W_KEY.wmKeyWin
        End If

        If (wModifiers And HOTKEYF_SHIFT) <> 0 Then
            nModifier = nModifier Or W_KEY.wmKeyShift
        End If
    End Sub
 
    Private Sub m_monitor_WEvent(ByVal hwnd As Integer, ByVal x1 As Integer, ByVal y1 As Integer, ByVal x2 As Integer, ByVal y2 As Integer)
        Dim objResult As WResult = PerformCapture(hwnd, x1, y1, x2, y2)

        Dim strRes As String = objResult.Text
        Dim strLeftCtx As String = objResult.LeftContext
        Dim strRightCtx As String = objResult.RightContext
        Dim strParagraph As String = objResult.Paragraph

        If (strRes = String.Empty) Then
            Return
        End If

        clickedWordTxt.Text = strRes
        leftContextTxt.Text = strLeftCtx
        rightContextTxt.Text = strRightCtx
        paragraphTxt.Text = strParagraph
    End Sub

    Private Sub StartMonitoring()

        Dim color As Integer
        Dim wLineStyle As W_LINE_STYLE
        Dim wKey As W_KEY
        Dim wMouse As W_MOUSE

        Dim dwHotkeyCursor As Integer
        Dim dwHotkeyCaret As Integer
        Dim dwHotkeySelectedText As Integer
        Dim dwIdleTime As Integer


        color = 61440
        wLineStyle = W_LINE_STYLE.wmLineDot
        wKey = W_KEY.wmKeyCtrl
        wMouse = W_MOUSE.wmMouseRight
        m_wMonitor.LineStyle = wLineStyle
        m_wMonitor.LineColor = color

        m_wMonitor.Start(wKey, wMouse, True)
        AddHandler m_wMonitor.WEvent, AddressOf m_monitor_WEvent
    End Sub
    Private Function PerformCapture(ByVal hwnd As Integer, ByVal x1 As Integer, ByVal y1 As Integer, ByVal x2 As Integer, ByVal y2 As Integer) As WResult

        Dim objInput As WInput = ComFactory.Instance.NewWInput
        Dim wOptions As Integer = 0

        ' set the get paragraph flag
        wOptions = wOptions Or W_CAPTURE_OPTIONS.wCaptureOptionsGetParagraph

        ' set the highlight word flag
        wOptions = wOptions Or W_CAPTURE_OPTIONS.wCaptureOptionsHighlightWords

        ' set the getContext flag
        wOptions = wOptions Or W_CAPTURE_OPTIONS.wCaptureOptionsGetContext
        'set capture parameters
        objInput.Hwnd = hWnd
        objInput.StartX = x1
        objInput.StartY = y1
        objInput.EndX = x2
        objInput.EndY = y2
        objInput.Options = wOptions


        ' set the number of context words
        objInput.ContextWordsLeft = 1
        objInput.ContextWordsRight = 1

        Dim objResult As WResult = m_wCapture.Capture(objInput)
        'get the text from the capture
        Dim strResult As String = objResult.Text



        'use OCR if native method fails
        If strResult = String.Empty Then
            wOptions = wOptions Or W_CAPTURE_OPTIONS.wCaptureOptionsGetTessOCRText
            objInput.Options = wOptions
            objResult = m_wCapture.Capture(objInput)
            strResult = objResult.Text
        End If

        Return objResult
    End Function
    Private Sub CaptureFullText(ByVal x As Integer, ByVal y As Integer)
        Dim spUIC As UIControl = ComFactory.Instance.NewUIControl
        Dim strRes As String

        spUIC.CreateFromScreenPoint(x, y)

        strRes = spUIC.Value
        If (strRes = String.Empty) Then
            strRes = spUIC.Name
        End If
        clickedWordTxt.Text = strRes
    End Sub
    Protected Overrides Sub WndProc(ByRef m As Message)
        Dim capture As WCaptureX = ComFactory.Instance.NewWCaptureX()
        Dim Hwnd As Integer
        Dim X As Integer
        Dim Y As Integer
        If m.Msg = WM_HOTKEY Then
            Dim wp As Integer = m.WParam.ToInt32()
            If wp = m_nHotkeyCaretId Then
                capture.GetCursorInfo(Hwnd, X, Y)
                m_monitor_WEvent(Hwnd, X, Y, X, Y)
            ElseIf wp = m_nHotkeyCursorId Then
                capture.GetCaretInfo(Hwnd, X, Y)
                m_monitor_WEvent(Hwnd, X, Y, X, Y)
            ElseIf wp = m_nHotkeySelectedTextId Then
                capture.GetCaretInfo(Hwnd, X, Y)
                m_monitor_WEvent(Hwnd, X, Y, X, Y)
            End If

        Else
            MyBase.WndProc(m)
        End If
    End Sub
    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        StartMonitoring()
    End Sub
    Private Sub Form1_unload(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Closing
        m_wMonitor.Stop()
        m_wCapture.EndCaptureSession()
    End Sub
End Class

Public Class CAPTURE_PARAMS
    Public dwCaptureMask As Integer
    Public wKey As W_KEY
    Public wMouse As W_MOUSE
    Public wLineStyle As W_LINE_STYLE
    Public color As Integer
    Public dwIdleTime As Integer
    Public dwHotkeyCursor As Integer
    Public dwHotkeyCaret As Integer
    Public dwHotkeySelectedText As Integer
End Class