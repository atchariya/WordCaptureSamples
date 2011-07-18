VERSION 5.00
Begin VB.Form Form1 
   BackColor       =   &H80000004&
   Caption         =   "Capture Word Demo VB6"
   ClientHeight    =   5265
   ClientLeft      =   3000
   ClientTop       =   1725
   ClientWidth     =   7605
   FillColor       =   &H80000005&
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   5265
   ScaleWidth      =   7605
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox paragraph 
      Height          =   1935
      Left            =   2040
      TabIndex        =   3
      Top             =   1800
      Width           =   5175
   End
   Begin VB.TextBox rightContext 
      Height          =   375
      Left            =   2040
      TabIndex        =   2
      Top             =   1200
      Width           =   5175
   End
   Begin VB.TextBox leftContext 
      Height          =   285
      Left            =   2040
      TabIndex        =   1
      Top             =   840
      Width           =   5175
   End
   Begin VB.TextBox TxtResult 
      Height          =   285
      Left            =   2040
      TabIndex        =   0
      Top             =   360
      Width           =   5175
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private Declare Function RegisterHotKey Lib "user32.dll" (ByVal Hwnd As Long, _
                ByVal id As Integer, ByVal fsMOD As Long, _
                ByVal virtualKey As Long) As Boolean
Private Declare Function UnregisterHotKey Lib "user32.dll" _
                (ByVal Hwnd As Long, ByVal id As Integer) As Boolean
Private Declare Function GetWindowLongApi Lib "user32.dll" Alias "GetWindowLongA" _
                (ByVal Hwnd As Long, ByVal nIndex As Long) As Long
Private Declare Function SetWindowLongApi Lib "user32.dll" Alias "SetWindowLongA" _
                (ByVal Hwnd As Long, ByVal nIndex As Long, ByVal dwNewLong As Long) As Long

                
Private Const GWL_WNDPROC = (-4)
Private Const CC_ANYCOLOR = &H100
Private Const CC_RGBINIT = &H1

 Const HOTKEYF_ALT = &H4&
 Const HOTKEYF_SHIFT As Integer = &H1&
 Const HOTKEYF_CONTROL As Integer = &H2&
 Const HOTKEYF_EXT As Integer = &H8&
 
 Public WithEvents m_wMonitor As WMonitorX
Attribute m_wMonitor.VB_VarHelpID = -1
    Public Function LowWord(ByVal value As Long) As Long
        LowWord = value And &HFFFF&
    End Function
    Public Function HighWord(ByVal value As Long) As Long
        HighWord = value / 2 ^ 16
    End Function
    Public Function LowByte(ByVal value As Long) As Long
        LowByte = value And &HFF&
    End Function
    Public Function HighByte(ByVal value As Long) As Long
        HighByte = value / 2 ^ 8
    End Function
    Private Sub Hotkey2MonitorParams(ByVal dwHotkey, ByRef nModifier, ByRef nKey)
        nModifier = 0
        nKey = LowByte(LowWord(dwHotkey))
        Dim wModifiers As Long
        wModifiers = HighByte(LowWord(dwHotkey))

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
    
Private Sub Form_Load()
        Set m_wMonitor = New WMonitorX
        Set m_WCapture = New WCaptureX

        OldWndProc = GetWindowLongApi(Me.Hwnd, GWL_WNDPROC)
        SetWindowLongApi Me.Hwnd, GWL_WNDPROC, AddressOf VB_WindowProc
        
        Call StartMonitoring

End Sub
Private Sub Form_Unload(Cancel As Integer)
            Call m_wMonitor.Stop
            Call m_WCapture.EndCaptureSession
End Sub

Public Sub m_wMonitor_WEvent(ByVal Hwnd As Long, ByVal x1 As Long, ByVal y1 As Long, ByVal x2 As Long, ByVal y2 As Long)
     Dim X As Integer
     X = 1
     Dim objResult As WResult
     Set objResult = New WResult
     Call PerformCapture(Hwnd, x1, y1, x2, y2, objResult)
     
     TxtResult.Text = objResult.Text
     leftContext.Text = objResult.leftContext
     rightContext.Text = objResult.rightContext
     paragraph.Text = objResult.paragraph
     
     If TxtResult.Text = "" Then
        'try to use the full texe method if native failed
        Dim spUIC As UIControl
        Set spUIC = New UIControl
        
        Call spUIC.CreateFromScreenPoint(x1, y1)
        TxtResult.Text = spUIC.value
        If (TxtResult.Text = "") Then
            TxtResult.Text = spUIC.Name
        End If
        
     End If
          
End Sub

'replace the functions from the VB 6 example
'with these to run


Private Sub StartMonitoring()

    Dim color As Long
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
    dwHotkeyCursor = 845
    dwHotkeyCaret = 835
    dwIdleTime = 2
    m_wMonitor.LineStyle = wLineStyle
    m_wMonitor.LineColor = color
    
    dwHotkeySelectedText = 852
    Call m_wMonitor.Start(wKey, wMouse, True)
    Call m_wMonitor.Start2(dwIdleTime * 1000)
     Dim nModifier As Integer
    Dim nKey As Integer
    nModifier = 0
    nKey = 0
    Call Hotkey2MonitorParams(dwHotkeyCursor, nModifier, nKey)
    Call m_wMonitor.Start3(nModifier, nKey, m_nHotkeyCursorId)
    Call RegisterHotKey(Me.Hwnd, m_nHotkeyCursorId, nModifier, nKey)
    nModifier = 0
    nKey = 0
    Call Hotkey2MonitorParams(dwHotkeyCaret, nModifier, nKey)
    Call m_wMonitor.Start3(nModifier, nKey, m_nHotkeyCaretId)
    Call RegisterHotKey(Me.Hwnd, m_nHotkeyCaretId, nModifier, nKey)
    nModifier = 0
    nKey = 0
    Call Hotkey2MonitorParams(dwHotkeySelectedText, nModifier, nKey)
    Call m_wMonitor.Start3(nModifier, nKey, m_nHotkeySelectedTextId)
    Call RegisterHotKey(Me.Hwnd, m_nHotkeySelectedTextId, nModifier, nKey)
End Sub

Private Sub PerformCapture(ByVal Hwnd As Long, ByVal x1 As Long, ByVal y1 As Long, ByVal x2 As Long, ByVal y2 As Long, ByRef objResult As WResult)

    Dim objInput As WInput
    Set objInput = New WInput
    Dim wOptions As Integer
    wOptions = 0

    
    ' set the get paragraph flag
    wOptions = wOptions Or W_CAPTURE_OPTIONS.wCaptureOptionsGetParagraph
    
    ' set the highlight word flag
    wOptions = wOptions Or W_CAPTURE_OPTIONS.wCaptureOptionsHighlightWords
    
    ' set the getContext flag
    wOptions = wOptions Or W_CAPTURE_OPTIONS.wCaptureOptionsGetContext
    
    ' set the "capture selected text" flag
    If (x1 = -1 And y1 = -1) Then
        wOptions = wOptions Or W_CAPTURE_OPTIONS.wCaptureOptionsGetSelectedText
    End If
    
    'set capture parameters
    objInput.Hwnd = Hwnd
    objInput.StartX = x1
    objInput.StartY = y1
    objInput.EndX = x2
    objInput.EndY = y2
    objInput.Options = wOptions

    
    ' set the number of context words
    objInput.ContextWordsLeft = 1
    objInput.ContextWordsRight = 1
    
    Set objResult = m_WCapture.Capture(objInput)
End Sub

