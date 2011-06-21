Attribute VB_Name = "Module1"
Public Declare Function CallWindowProc Lib "user32" Alias "CallWindowProcA" _
            (ByVal lpPrevWndFunc As Long, ByVal Hwnd As Long, _
            ByVal msg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
Private Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" _
                (ByVal Hwnd As Long, ByVal lpOperation As Long, ByVal lpFile As _
                String, ByVal lpParameters As String, ByVal lpDirectory As Long, _
                ByVal nShowCmd As Long) As Long
            
Public m_WCapture As WCaptureX
Public OldWndProc As Long
Public m_nHotkeyCursorId As Long
Public m_nHotkeyCaretId As Long
Public m_nHotkeySelectedTextId As Long

Private Const WM_HOTKEY As Integer = &H312

Public Function VB_WindowProc(ByVal Hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
        Dim hwndCliked As Long
        Dim X As Long
        Dim Y As Long
        If wMsg = WM_HOTKEY Then
            If wParam = m_nHotkeyCursorId Then
                m_WCapture.GetCursorInfo hwndCliked, X, Y
                Call Form1.m_wMonitor_WEvent(hwndCliked, X, Y, X, Y)
            ElseIf wParam = m_nHotkeyCaretId Then
                m_WCapture.GetCaretInfo hwndCliked, X, Y
                Call Form1.m_wMonitor_WEvent(hwndCliked, X, Y, X, Y)
            ElseIf wParam = m_nHotkeySelectedTextId Then
                 m_WCapture.GetCaretInfo hwndCliked, X, Y
                Call Form1.m_wMonitor_WEvent(hwndCliked, X, Y, X, Y)
            End If
        End If
        VB_WindowProc = CallWindowProc(OldWndProc, Hwnd, wMsg, wParam, lParam)
End Function
