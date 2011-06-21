<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class Form1
    Inherits System.Windows.Forms.Form

    'Form overrides dispose to clean up the component list.
    <System.Diagnostics.DebuggerNonUserCode()> _
    Protected Overrides Sub Dispose(ByVal disposing As Boolean)
        Try
            If disposing AndAlso components IsNot Nothing Then
                components.Dispose()
            End If
        Finally
            MyBase.Dispose(disposing)
        End Try
    End Sub

    'Required by the Windows Form Designer
    Private components As System.ComponentModel.IContainer

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.  
    'Do not modify it using the code editor.
    <System.Diagnostics.DebuggerStepThrough()> _
    Private Sub InitializeComponent()
        Me.clickedWordTxt = New System.Windows.Forms.TextBox
        Me.leftContextTxt = New System.Windows.Forms.TextBox
        Me.rightContextTxt = New System.Windows.Forms.TextBox
        Me.paragraphTxt = New System.Windows.Forms.TextBox
        Me.Label1 = New System.Windows.Forms.Label
        Me.Label2 = New System.Windows.Forms.Label
        Me.Label3 = New System.Windows.Forms.Label
        Me.Label4 = New System.Windows.Forms.Label
        Me.SuspendLayout()
        '
        'clickedWordTxt
        '
        Me.clickedWordTxt.Location = New System.Drawing.Point(116, 27)
        Me.clickedWordTxt.Name = "clickedWordTxt"
        Me.clickedWordTxt.Size = New System.Drawing.Size(156, 20)
        Me.clickedWordTxt.TabIndex = 0
        '
        'leftContextTxt
        '
        Me.leftContextTxt.Location = New System.Drawing.Point(116, 64)
        Me.leftContextTxt.Name = "leftContextTxt"
        Me.leftContextTxt.Size = New System.Drawing.Size(156, 20)
        Me.leftContextTxt.TabIndex = 1
        '
        'rightContextTxt
        '
        Me.rightContextTxt.Location = New System.Drawing.Point(116, 101)
        Me.rightContextTxt.Name = "rightContextTxt"
        Me.rightContextTxt.Size = New System.Drawing.Size(156, 20)
        Me.rightContextTxt.TabIndex = 2
        '
        'paragraphTxt
        '
        Me.paragraphTxt.Location = New System.Drawing.Point(116, 137)
        Me.paragraphTxt.Multiline = True
        Me.paragraphTxt.Name = "paragraphTxt"
        Me.paragraphTxt.Size = New System.Drawing.Size(156, 104)
        Me.paragraphTxt.TabIndex = 3
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Location = New System.Drawing.Point(2, 33)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(74, 13)
        Me.Label1.TabIndex = 4
        Me.Label1.Text = "Clicked Word:"
        '
        'Label2
        '
        Me.Label2.AutoSize = True
        Me.Label2.Location = New System.Drawing.Point(2, 71)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(67, 13)
        Me.Label2.TabIndex = 5
        Me.Label2.Text = "Left Context:"
        '
        'Label3
        '
        Me.Label3.AutoSize = True
        Me.Label3.Location = New System.Drawing.Point(2, 108)
        Me.Label3.Name = "Label3"
        Me.Label3.Size = New System.Drawing.Size(74, 13)
        Me.Label3.TabIndex = 6
        Me.Label3.Text = "Right Context:"
        '
        'Label4
        '
        Me.Label4.AutoSize = True
        Me.Label4.Location = New System.Drawing.Point(5, 137)
        Me.Label4.Name = "Label4"
        Me.Label4.Size = New System.Drawing.Size(59, 13)
        Me.Label4.TabIndex = 7
        Me.Label4.Text = "Paragraph:"
        '
        'Form1
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(284, 264)
        Me.Controls.Add(Me.Label4)
        Me.Controls.Add(Me.Label3)
        Me.Controls.Add(Me.Label2)
        Me.Controls.Add(Me.Label1)
        Me.Controls.Add(Me.paragraphTxt)
        Me.Controls.Add(Me.rightContextTxt)
        Me.Controls.Add(Me.leftContextTxt)
        Me.Controls.Add(Me.clickedWordTxt)
        Me.Name = "Form1"
        Me.Text = "Word Capture X Example"
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents clickedWordTxt As System.Windows.Forms.TextBox
    Friend WithEvents leftContextTxt As System.Windows.Forms.TextBox
    Friend WithEvents rightContextTxt As System.Windows.Forms.TextBox
    Friend WithEvents paragraphTxt As System.Windows.Forms.TextBox
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents Label2 As System.Windows.Forms.Label
    Friend WithEvents Label3 As System.Windows.Forms.Label
    Friend WithEvents Label4 As System.Windows.Forms.Label

End Class
